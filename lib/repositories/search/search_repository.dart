import './search_repository_interface.dart';
import '../../../domain/team.dart';
import '../../types/select_box_component_type.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchRepository implements SearchRepositoryInterface {
  String dataURL = 'http://localhost';

  /// 検索条件用のチーム情報を取得するAPIを実行
  @override
  Future<List<ISelectBox<int>>> getSearchTeamList() async {
    List<ISelectBox<int>> teamList = [];
    var url = Uri.parse('$dataURL/api/search/team/index');
    var response = await http.get(url);
    var convert = utf8.decode(response.bodyBytes);    // 日本語の文字化けを解消するため
    var body = json.decode(convert)['data']['teams'];
    for(var i = 0; i < body.length; i++) {
      var team = Team.fromJson(body[i]);
      teamList.add(ISelectBox<int>(value: team.id, text: '${team.city} ${team.name}', shortText: team.city, imageFile: team.imageFile != null ? 'images/logos/${team.imageFile}' : null));
    }
    return teamList;
  }

  /// 検索条件用のシーズン情報を取得するAPIを実行
  @override
  Future<List<ISelectBox<int>>> getSearchSeasonList() async {
    List<ISelectBox<int>> seasonList = [];
    var url = Uri.parse('$dataURL/api/search/season/index');
    var response = await http.get(url);
    var convert = utf8.decode(response.bodyBytes);    // 日本語の文字化けを解消するため
    var body = json.decode(convert)['data']['seasons'];
    for(var i = 0; i < body.length; i++) {
      String text = '${body[i]['season']}年';
      seasonList.add(ISelectBox<int>(value: body[i]['season'], text: text, shortText: text));
    }
    return seasonList;
  }
}