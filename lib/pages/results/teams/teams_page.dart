/// チーム検索の結果を表示する画面

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:nfl_library/components/common/search_selectbox/select_box.dart';
import 'package:nfl_library/types/select_box_component_type.dart';
import 'package:provider/provider.dart';
import 'package:nfl_library/components/common/app_bar/app_main_bar.dart';
import 'package:nfl_library/components/results/teams/starters.dart';
import '../../../components/results/teams/rosters.dart';
import '../../../components/results/teams/formations.dart';
import '../../../configs/const.dart';
import '../../../domain/player2.dart';

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

  /// 選択シーズンの更新処理
  void callbackChangeSeason(int value) {
    _selectYearItem = value;
    print(_selectYearItem);
  }
  /// 選択チームの更新処理
  void callbackChangeTeam(int value) {
    _selectTeamItem = value;
    print(_selectTeamItem);
  }

  @override
  Widget build(BuildContext context) {
    final String? apiurl = dotenv.env['API_URL'];
    if(apiurl != null) print(apiurl);

    return Provider<Map<String, dynamic>>(
        create: (context) => data,
        child: DefaultTabController(
          length: tabs.length,
          child: Builder(builder: (BuildContext context) {
            final TabController tabController = DefaultTabController.of(context)!;
            tabController.addListener(() {
              if (!tabController.indexIsChanging) {
                // Your code goes here.
                // To get index of current tab use tabController.index
              }
            });
            return Scaffold(
              appBar: const AppMainBar(tabs: tabs),
              backgroundColor: AppColor.backColor,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(AppNum.cardPadding),
                      child: Column(
                        children: [
                          // 年代のメニューリスト
                          Padding(
                            padding: const EdgeInsets.only(top: AppNum.cardMargin, left: AppNum.cardMargin * 10),
                            child: SelectBox(selectList: seasonSelectList, title: 'Select Season', callback: callbackChangeSeason),
                          ),

                          // チームのメニューリスト
                          SelectBox(selectList: teamSelectList, title: 'Select Team', callback: callbackChangeTeam),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: (data['rosters'].length * 68.0) + 129.4,
                      child: TabBarView(
                        children: tabs.map((Tab tab) {
                          if(tab.text == 'Rosters'){
                            // ロスターを表示
                            return const Rosters();
                          }
                          if(tab.text == 'Starters'){
                            // スターターを表示
                            return Starters();
                          }
                          // フォーメーションを表示
                          return const Formations();
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              )
            );
          }),
        )
    );
  }
}