import './search_repository_interface.dart';
import '../../../domain/team.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchRepository implements SearchRepositoryInterface {
  String dataURL = 'http://localhost';

  /// 選手情報を取得するAPIを実行
  @override
  Future<List<Team>> getSearchTeamList() async {
    List<Team> teamList = [];
    var url = Uri.parse('$dataURL/api/search/team/index');
    var response = await http.get(url);
    var convert = utf8.decode(response.bodyBytes);    // 日本語の文字化けを解消するため
    print('status code : ${response.statusCode}');
    var body = json.decode(convert)['teams'];
    for(var i = 0; i < body.length; i++) {
      teamList.add(Team.fromJson(body[i]));
    }
    return teamList;
  }
}