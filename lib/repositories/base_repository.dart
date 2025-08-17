import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:nfl_library/types/api_response.dart';

class BaseRepository
{
  String dataURL = dotenv.env['API_URL'] ?? 'http://localhost';

  /// APIのURLを取得する
  /// 
  /// Parameters:
  /// * [path] - APIのパス(頭にスラッシュは不要)
  /// 
  /// Returns:
  /// [Uri]オブジェクト
  Uri _getApiUrl(String path) {
    return Uri.parse('$dataURL/api/$path');
  }

  /// エラーページを表示するかどうかをチェックする
  bool checkErrorPage (int status) {
    return status >= 500;
  }

  /// レスポンスボディをアプリ用にカスタマイズする
  /// 
  /// Parameters:
  /// * [response] - レスポンスボディ
  /// * [data]     - システムが使用するメインデータ
  /// * [callback] - data部分に定義するデータを整形する関数
  /// 
  /// Returns:
  /// 正常時・エラー時のどちらにも対応した[ApiResponse]オブジェクト
  ApiResponse<T> convertResponse<T>(Map<String, dynamic> response, T? Function(T?, dynamic) callback) {
    final int status = response['status'] ?? 500;
    final List<String> messages;
    final Map<String, dynamic>? validationMessages;
    // バリデーションのエラーメッセージを設定
    if(status == 422) {
      validationMessages = response['message'] as Map<String, dynamic>;
      messages = ['入力内容に不備があります。'];
    } else {
      // その他の正常、エラーメッセージを設定
      messages = (response['message'] as List<dynamic>?)?.cast<String>() ?? [];
      validationMessages = null;
    }
    final Pagination? pagination = response['pagination'] != null ? Pagination.fromJson(response['pagination']) : null;
    T? data;
    final T? formattedData = response['data'] == null ? null : callback(data, response);

    return ApiResponse<T>(
      data: formattedData,
      message: messages,
      status: status,
      validationMessages: validationMessages,
      pagination: pagination,
      isErrorPage: checkErrorPage(status),
    );
  }  

  /// GETのAPIを実行し、そのレスポンスボディを取得する
  /// 
  /// Parameters:
  /// * [path] - APIのパス(頭にスラッシュは不要)
  /// 
  /// Returns:
  /// レスポンスのJSONをデコードした生のデータ([Future<Map<String, dynamic>>]オブジェクト)
  Future<Map<String, dynamic>> fetch(String path) async {
    final Uri url = _getApiUrl(path);
    final http.Response response = await http.get(url);
    final String convert = utf8.decode(response.bodyBytes);    // 日本語の文字化けを解消するため
    return json.decode(convert) as Map<String, dynamic>;
  }
}