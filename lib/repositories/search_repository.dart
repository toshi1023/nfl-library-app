import 'package:nfl_library/components/common/search_selectbox/select_box.dart';

import './search_repository_interface.dart';
import '../../../domain/team.dart';
import '../types/select_box_component_type.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchRepository implements SearchRepositoryInterface {
  String dataURL = 'http://localhost';

  /// 検索条件用のチーム情報を取得するAPIを実行
  @override
  Future<List<ISelectBox>> getSearchTeamList() async {
    List<ISelectBox> teamList = [];
    var url = Uri.parse('$dataURL/api/search/team/index');
    var response = await http.get(url);
    var convert = utf8.decode(response.bodyBytes);    // 日本語の文字化けを解消するため
    var body = json.decode(convert)['teams'];
    for(var i = 0; i < body.length; i++) {
      var team = Team.fromJson(body[i]);
      teamList.add(ISelectBox(value: team.id, text: '${team.city} ${team.name}', imageFile: 'images/logos/${team.imageFile}'));
    }
    return teamList;
  }

  /// 検索条件用のシーズン情報を取得するAPIを実行
  @override
  Future<List<ISelectBox>> getSearchSeasonList() async {
    List<ISelectBox> seasonList = [];
    var url = Uri.parse('$dataURL/api/search/season/index');
    var response = await http.get(url);
    var convert = utf8.decode(response.bodyBytes);    // 日本語の文字化けを解消するため
    var body = json.decode(convert)['seasons'];
    for(var i = 0; i < body.length; i++) {
      seasonList.add(ISelectBox(value: body[i]['season'], text: '${body[i]['season']}年'));
    }
    return seasonList;
  }
}