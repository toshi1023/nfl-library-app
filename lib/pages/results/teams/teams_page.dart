/// チーム検索の結果を表示する画面

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:nfl_library/components/common/search_selectbox/select_box.dart';
import 'package:nfl_library/controllers/search_controller.dart';
import 'package:nfl_library/domain/roster.dart';
import 'package:nfl_library/repositories/search_repository.dart';
import 'package:nfl_library/controllers/roster_controller.dart';
import 'package:nfl_library/repositories/roster_repository.dart';
import 'package:nfl_library/types/select_box_component_type.dart';
import 'package:provider/provider.dart';
import 'package:nfl_library/components/common/app_bar/app_main_bar.dart';
import 'package:nfl_library/components/common/bottom_bar/bottom_nav_bar.dart';
import 'package:nfl_library/components/results/teams/starters.dart';
import '../../../components/results/teams/rosters.dart';
import '../../../components/results/teams/formations.dart';
import '../../../configs/const.dart';
import '../../../domain/player2.dart';
import '../../../domain/roster.dart';

const List<Tab> tabs = <Tab>[
  Tab(text: 'Rosters'),
  Tab(text: 'Starters'),
  Tab(text: 'Formations')
];

class TeamsPage extends StatefulWidget {
  const TeamsPage({Key? key}) : super(key: key);

  @override
  _TeamsPageState createState() => _TeamsPageState();
}

class _TeamsPageState extends State<TeamsPage> {
  int? _selectYearItem = 0;
  int? _selectTeamItem = 0;
  final _searchController = SearchController(SearchRepository());
  final _rosterController = RosterController(RosterRepository());

  final teamSelectList = [
    ISelectBox(value: 1, text: 'Buffalo Bills', shortText: 'Buffalo', imageFile: 'images/logos/bills.gif'),
    ISelectBox(value: 2, text: 'Miami Dolphins', shortText: 'Miami', imageFile: 'images/logos/dolphins.gif'),
    ISelectBox(value: 3, text: 'New England Patriots', shortText: 'New England', imageFile: 'images/logos/patriots.gif'),
    ISelectBox(value: 4, text: 'New York Jets', shortText: 'New York', imageFile: 'images/logos/jets.gif'),
  ];

  final seasonSelectList = [
    ISelectBox(value: 0, text: '指定なし', shortText: '指定なし'),
    ISelectBox(value: 2012, text: '2012年', shortText: '2012年'),
    ISelectBox(value: 2013, text: '2013年', shortText: '2013年'),
    ISelectBox(value: 2014, text: '2014年', shortText: '2014年'),
    ISelectBox(value: 2015, text: '2015年', shortText: '2015年'),
  ];

  final Map<String, dynamic> data = {
    // ロスターの値
    'rosters': [
      Player(
          'images/favorite_teams/San_Francisco_49ers_logo_mini.png',
          'QB', 10, 'Jimmy Garoppolo', 83, 188, 89,
          'Eastern Illinois University', 2014, 5, 109
      ),
      Player(
          'images/favorite_teams/San_Francisco_49ers_logo_mini.png',
          'WR', 19, 'Deebo Samuel', 89, 182, 97,
          'South Carolina University', 2019, 2, 36
      ),
      Player(
          'images/favorite_teams/San_Francisco_49ers_logo_mini.png',
          'TE', 85, 'George Kittle', 97, 193, 113,
          'Iowa University', 2017, 5, 146
      ),
      Player(
          'images/favorite_teams/San_Francisco_49ers_logo_mini.png',
          'QB', 10, 'Jimmy Garoppolo', 83, 188, 89,
          'Eastern Illinois University', 2014, 5, 109
      ),
      Player(
          'images/favorite_teams/San_Francisco_49ers_logo_mini.png',
          'WR', 19, 'Deebo Samuel', 89, 182, 97,
          'South Carolina University', 2019, 2, 36
      ),
      Player(
          'images/favorite_teams/San_Francisco_49ers_logo_mini.png',
          'TE', 85, 'George Kittle', 97, 193, 113,
          'Iowa University', 2017, 5, 146
      )
    ],
  };

  @override
  void initState() {
    super.initState();
  }

  /// 選択シーズンの更新処理
  void callbackChangeSeason(int value) {
    _selectYearItem = value;
  }
  /// 選択チームの更新処理
  void callbackChangeTeam(int value) {
    _selectTeamItem = value;
  }

  @override
  Widget build(BuildContext context) {
    final String? apiurl = dotenv.env['API_URL'];
    if(apiurl != null) print(apiurl);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(AppNum.cardPadding * 0.5),
          child: Row(
            children: [
              // 年代のメニューリスト
              FutureBuilder<List<ISelectBox>>(
                  future: _searchController.fetchSeasonList(),
                  builder: (context, snapshot) {
                    if(snapshot.hasData) {
                      return SizedBox(
                          width: 110,
                          child: SelectBox(selectList: snapshot.data!, title: 'Select Season', callback: callbackChangeSeason)
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  }
              ),

              // チームのメニューリスト
              FutureBuilder<List<ISelectBox>>(
                  future: _searchController.fetchTeamList(),
                  builder: (context, snapshot) {
                    // if(snapshot.connectionState == ConnectionState.done){
                    //   return SelectBox(selectList: snapshot.data!, title: 'Select Team', callback: callbackChangeTeam);
                    // } else {
                    //   return SelectBox(selectList: teamSelectList, title: 'Select Team', callback: callbackChangeTeam);
                    // }
                    if(snapshot.hasData) {
                      return Expanded(flex: 1, child: SelectBox(selectList: snapshot.data!, title: 'Select Team', callback: callbackChangeTeam));
                    } else {
                      return const CircularProgressIndicator();
                    }
                  }
              ),
            ],
          ),
        ),
        FutureBuilder<List<Roster>>(
          future: _rosterController.fetchRosterList(),
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              return Expanded(
                  child: SingleChildScrollView(
                    child: Center(
                        child: Rosters(params: snapshot.data!)
                    ),
                  )
              );
            } else {
              return const Expanded(
                child: Center(
                    child: CircularProgressIndicator()
                ),
              );
            }
          },
        )
      ],
    );
  }
}