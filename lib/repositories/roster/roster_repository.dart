import 'package:nfl_library/types/api_response.dart';

import './roster_repository_interface.dart';
import '../base_repository.dart';
import '../../../domain/roster.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RosterRepository extends BaseRepository implements RosterRepositoryInterface {
  

  /// 選手情報を取得するAPIを実行
  @override
  Future<ApiResponse<List<Roster>>> getRosterList(int season, int teamId) async {
    List<Roster>? rosterList;
    final Map<String, dynamic> res = await fetch('players/info?season=$season&team_id=$teamId');
    var test = convertResponse<List<Roster>>(res, (rosterList, res) {
      var rosters = res['data']?['rosters'];
      if(rosters != null && rosters.length > 0) {
        rosterList = [];
      }
      for(var i = 0; i < rosters.length; i++) {
        rosterList?.add(Roster.fromJson(rosters[i]));
      }
      return rosterList;
    });
    print(test.status);
    print(test.validationMessages);
    return test;
  }
}