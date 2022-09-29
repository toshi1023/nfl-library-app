/// チーム検索の結果を表示する画面

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:nfl_library/components/common/app_bar/app_main_bar.dart';
import 'package:nfl_library/components/results/teams/starters.dart';
import '../../../components/results/teams/rosters.dart';
import '../../../components/results/teams/formations.dart';
import '../../../configs/const.dart';
import '../../../domain/player.dart';

const List<Tab> tabs = <Tab>[
  Tab(text: 'Rosters'),
  Tab(text: 'Starters'),
  Tab(text: 'Formations')
];

class TeamsPage extends StatelessWidget {
  @override
  const TeamsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String? apiurl = dotenv.env['API_URL'];
    if(apiurl != null) print(apiurl);

    final List<Player> rosters = [
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
    ];

    return Provider<List<Player>>(
        create: (context) => rosters,
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
              body: TabBarView(
                children: tabs.map((Tab tab) {
                  if(tab.text == 'Rosters'){
                    // ロスターを表示
                    return const Rosters();
                  }
                  if(tab.text == 'Starters'){
                    // スターターを表示
                    return Starters(players: rosters);
                  }
                  // フォーメーションを表示
                  return const Formations();
                }).toList(),
              )
            );
          }),
        )
    );
  }
}