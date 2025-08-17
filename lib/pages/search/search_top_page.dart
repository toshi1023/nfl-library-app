
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../components/common/app_bar/app_main_bar.dart';
import '../../components/search/teams_search.dart';
import '../../components/search/rules_search.dart';
import '../../configs/const.dart';
import '../../domain/roster.dart';
import '../../providers/app_dependencies.dart';
import '../../types/api_response.dart';

const List<Tab> tabs = <Tab>[
  Tab(text: 'Teams'),
  Tab(text: 'Rules'),
];

class SearchTopPage extends StatelessWidget {
  const SearchTopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

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
          body: FutureBuilder<ApiResponse<List<Roster>>>(
            future: AppDependencies.rosterController.fetchRosterList(2012, 31),
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
