/// チーム検索の結果を表示する画面

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:nfl_library/components/common/search/select_box.dart';
import 'package:nfl_library/controllers/search_controller.dart';
import 'package:nfl_library/domain/roster.dart';
import 'package:nfl_library/pages/menus/logged_in_menu_page.dart';
import 'package:nfl_library/pages/results/rules/rules_page.dart';
import 'package:nfl_library/pages/results/teams/teams_page.dart';
import 'package:nfl_library/pages/settings/settings_page.dart';
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
import 'package:nfl_library/pages/modern_nfl_page.dart';

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

  @override
  void initState() {
    super.initState();
  }

  int _selectedIndex = 0;
  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  /// 選択シーズンの更新処理
  void callbackChangeSeason(int value) {
    _selectYearItem = value;
  }
  /// 選択チームの更新処理
  void callbackChangeTeam(int value) {
    _selectTeamItem = value;
  }

  /// ボトムナビゲーションに応じてページをレンダリングをする処理
  Widget renderPage(int index) {
    if (index == 1) {
      // ルールがクリックされた時
      return const RulesPage();
    } else if (index == 2) {
      // お気に入りがクリックされた時
      // return const LoggedInMenuPage();
      return const ModernNFLRoster();
    } else if (index == 3) {
      // 設定がクリックされた時
      return const SettingsPage();
    }
    // ロスターがクリックされた時
    return const TeamsPage();
  }

  @override
  Widget build(BuildContext context) {
    final String? apiurl = dotenv.env['API_URL'];
    if(apiurl != null) print(apiurl);

    return Scaffold(
      appBar: const AppMainBar(),
      backgroundColor: AppColor.backColor,
      body: renderPage(_selectedIndex),
      bottomNavigationBar: BottomNavBar(selectedIndex: _selectedIndex, onTap: _onTap),
    );
  }
}