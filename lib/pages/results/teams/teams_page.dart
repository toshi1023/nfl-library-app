/// チーム検索の結果を表示する画面

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:nfl_library/components/common/app_bar/app_main_bar.dart';
import 'package:nfl_library/components/results/teams/starters.dart';
import '../../../components/common/search_selectbox/team_select_box.dart';
import '../../../components/common/search_selectbox/year_select_box.dart';
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
    // 年代のセレクトボックスの値
    'yearMenu': [
      const DropdownMenuItem(
        value: 2012,
        child: Center(child: Text('2012年', textAlign: TextAlign.center, style: TextStyle(fontSize: AppNum.selectboxFontSize))),
      ),
      const DropdownMenuItem(
        value: 2013,
        child: Center(child: Text('2013年', textAlign: TextAlign.center, style: TextStyle(fontSize: AppNum.selectboxFontSize))),
      ),
      const DropdownMenuItem(
        value: 2014,
        child: Center(child: Text('2014年', textAlign: TextAlign.center, style: TextStyle(fontSize: AppNum.selectboxFontSize))),
      )
    ],
    // チームのセレクトボックスの値
    'teamMenu': [
      DropdownMenuItem(
        value: 1,
        child: Center(
            child: Row(
              children: <Widget> [
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Image.asset(
                    'images/favorite_teams/San_Francisco_49ers_logo_mini.png',
                    width: AppNum.dropDownListImageSize,
                  ),
                ),
                const Text(
                    'Buffalo Bills',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: AppNum.selectboxFontSize)
                ),
              ],
            )
        ),
      ),
      DropdownMenuItem(
        value: 2,
        child: Center(
            child: Row(
              children: <Widget> [
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Image.asset(
                    'images/favorite_teams/San_Francisco_49ers_logo_mini.png',
                    width: AppNum.dropDownListImageSize,
                  ),
                ),
                const Text(
                    'Miami Dolphins',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: AppNum.selectboxFontSize)
                ),
              ],
            )
        ),
      ),
      DropdownMenuItem(
        value: 3,
        child: Center(
            child: Row(
              children: <Widget> [
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Image.asset(
                    'images/favorite_teams/San_Francisco_49ers_logo_mini.png',
                    width: AppNum.dropDownListImageSize,
                  ),
                ),
                const Text(
                    'New England Patriots',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: AppNum.selectboxFontSize)
                ),
              ],
            )
        ),
      ),
      DropdownMenuItem(
        value: 4,
        child: Center(
            child: Row(
              children: <Widget> [
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Image.asset(
                    'images/favorite_teams/San_Francisco_49ers_logo_mini.png',
                    width: AppNum.dropDownListImageSize,
                  ),
                ),
                const Text(
                    'New York Jets',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: AppNum.selectboxFontSize)
                ),
              ],
            )
        ),
      ),
      DropdownMenuItem(
        value: 5,
        child: Center(
            child: Row(
              children: <Widget> [
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Image.asset(
                    'images/favorite_teams/San_Francisco_49ers_logo_mini.png',
                    width: AppNum.dropDownListImageSize,
                  ),
                ),
                const Text(
                    'Washington Commanders',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: AppNum.selectboxFontSize)
                ),
              ],
            )
        ),
      )
    ]
  };

  @override
  void initState() {
    super.initState();
    _selectYearItem = data['yearMenu'][0].value;
    _selectTeamItem = data['teamMenu'][0].value;
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
                            child: YearSelectBox(),
                          ),

                          // チームのメニューリスト
                          const TeamSelectBox(),
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