/// チーム検索の結果を表示する画面

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nfl_library/components/common/app_bar/app_main_bar.dart';
import '../../../components/common/search_selectbox/year_select_box.dart';
import '../../../components/common/search_selectbox/team_select_box.dart';
import '../../../components/results/teams/rosters.dart';
import '../../../configs/const.dart';

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
    // 検索用ドロップダウンリストのレイアウト設定
    const double selectBoxHeight = AppNum.cardPadding / 5;

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
            appBar: AppBar(
              centerTitle: false,
              automaticallyImplyLeading: false,
              title: Column(
                children: [
                  Image.asset(
                    AppImages.nflLogoImage,
                    width: AppNum.appBarLogo,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 2.0),
                    child: Text('LIBRARY', style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Playfair_Display'
                    )),
                  ),
                ],
              ),
              actions: [
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: 33,
                      ),
                      onPressed: () {
                        // メニューページを開く
                        Navigator.of(context).pushNamed("/logged_in_menu");
                      },
                    )
                ),
              ],
              backgroundColor: AppColor.mainColor,
              bottom: const TabBar(
                indicatorColor: Colors.white,
                labelStyle: TextStyle(
                    fontSize: AppNum.tabFont,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Dancing_Script'
                ),
                tabs: tabs,
              ),
            ),
            backgroundColor: AppColor.backColor,
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget> [
                    Padding(
                      padding: const EdgeInsets.all(AppNum.cardPadding),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: AppNum.cardPadding * 3),
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.only(top: selectBoxHeight, bottom: selectBoxHeight),
                                child: YearSelectBox(),
                              ),
                            ),
                          ),
                          const Card(
                              margin: EdgeInsets.only(top: AppNum.cardMargin),
                              child: Padding(
                                padding: EdgeInsets.only(top: selectBoxHeight, bottom: selectBoxHeight),
                                child: TeamSelectBox(pageType: false),
                              )
                          ),
                          const Rosters(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          );
      }),
    );
  }
}