
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../components/common/app_bar/app_main_bar.dart';
import '../../components/search/teams_search.dart';
import '../../components/search/rules_search.dart';
import '../../configs/const.dart';
import '../../domain/roster.dart';
import '../../controllers/roster_controller.dart';
import '../../repositories/roster_repository.dart';

const List<Tab> tabs = <Tab>[
  Tab(text: 'Teams'),
  Tab(text: 'Rules'),
];

class SearchTopPage extends StatelessWidget {
  const SearchTopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = RosterController(RosterRepository());

    return DefaultTabController(
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
          body: FutureBuilder<List<Roster>>(
            future: _controller.fetchRosterList(),
            builder: (context, snapshot) {
              return TabBarView(
                children: tabs.map((Tab tab) {
                  if(tab.text == 'Teams'){
                    // チーム検索のページを表示
                    return const TeamsSearch();
                  }
                  // 反則検索のページを表示
                  return const RulesSearch();
                }).toList(),
              );
            },
          )
        );
      }),
    );
  }
}
