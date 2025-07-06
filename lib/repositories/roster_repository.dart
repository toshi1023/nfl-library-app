import './roster_repository_interface.dart';
import '../../../domain/roster.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RosterRepository implements RosterRepositoryInterface {
  String dataURL = 'http://localhost';

  /// 選手情報を取得するAPIを実行
  @override
  Future<List<Roster>> getRosterList() async {
    List<Roster> rosterList = [];
    var url = Uri.parse('$dataURL/api/players/info?season=2012&team_id=31');
    var response = await http.get(url);
    var convert = utf8.decode(response.bodyBytes);    // 日本語の文字化けを解消するため
    var body = json.decode(convert)['data']['rosters'];
    for(var i = 0; i < body.length; i++) {
      rosterList.add(Roster.fromJson(body[i]));
    }
    return rosterList;
  }
}