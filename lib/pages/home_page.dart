/// チーム検索の結果を表示する画面

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:nfl_library/components/common/search_selectbox/select_box.dart';
import 'package:nfl_library/controllers/search_controller.dart';
import 'package:nfl_library/domain/roster.dart';
import 'package:nfl_library/pages/results/teams/teams_page.dart';
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

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? _selectYearItem = 0;
  int? _selectTeamItem = 0;
  final _searchController = SearchController(SearchRepository());
  final _rosterController = RosterController(RosterRepository());

  final teamSelectList = [
    ISelectBox(value: 1, text: 'Buffalo Bills', imageFile: 'images/logos/bills.gif'),
    ISelectBox(value: 2, text: 'Miami Dolphins', imageFile: 'images/logos/dolphins.gif'),
    ISelectBox(value: 3, text: 'New England Patriots', imageFile: 'images/logos/patriots.gif'),
    ISelectBox(value: 4, text: 'New York Jets', imageFile: 'images/logos/jets.gif'),
  ];

  final seasonSelectList = [
    ISelectBox(value: 0, text: '指定なし'),
    ISelectBox(value: 2012, text: '2012年'),
    ISelectBox(value: 2013, text: '2013年'),
    ISelectBox(value: 2014, text: '2014年'),
    ISelectBox(value: 2015, text: '2015年'),
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

  int _selectedIndex = 0;
  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // ページ遷移
    if(index == 0) {
      // ロスターがクリックされた時
      Navigator.of(context).pushNamed("/home");
    } else if (index == 1) {
      // ルールがクリックされた時
      Navigator.of(context).pushNamed("/rules");
    } else if (index == 2) {
      // お気に入りがクリックされた時
      Navigator.of(context).pushNamed("/logged_in_menu");
    } else if (index == 3) {
      // 設定がクリックされた時
      Navigator.of(context).pushNamed("/settings");
    }
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

    return Scaffold(
      appBar: const AppMainBar(),
      backgroundColor: AppColor.backColor,
      body: const TeamsPage(),
      bottomNavigationBar: BottomNavBar(selectedIndex: _selectedIndex, onTap: _onTap),
    );
  }
}