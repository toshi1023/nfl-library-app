
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './teams_search.dart';
import './rules_search.dart';
import '../../configs/const.dart';

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
          body: TabBarView(
            children: tabs.map((Tab tab) {
              if(tab.text == 'Teams'){
                // チーム検索のページを表示
                return const TeamsSearch();
              }
              // 反則検索のページを表示
              return const RulesSearch();
            }).toList(),
          ),
        );
      }),
    );
  }
}
