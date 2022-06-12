/// ログイン済みの場合のメニュー画面

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nfl_library/components/common/app_bar/app_main_bar.dart';
import '../../components/common/search_selectbox/year_select_box.dart';
import '../../components/common/search_selectbox/team_select_box.dart';
import '../../configs/const.dart';

const List<Tab> tabs = <Tab>[
  Tab(text: 'Rosters'),
  Tab(text: 'Starters'),
  Tab(text: 'Formations')
];

class RostersPage extends StatelessWidget {
  @override
  const RostersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double cardFavoriteHeight;
    final double cardMenuHeight;

    // iPhone8の画面サイズ
    if(MediaQuery.of(context).size.height == AppNum.iphoneHeight8) {
      // お気に入りチームのcardのheightを定義
      cardFavoriteHeight = MediaQuery.of(context).size.height * 0.4;
      // メニューのcardのheightを定義
      cardMenuHeight = MediaQuery.of(context).size.height * 0.5;
    } else {
      // お気に入りチームのcardのheightを定義
      cardFavoriteHeight = MediaQuery.of(context).size.height * 0.28;
      // メニューのcardのheightを定義
      cardMenuHeight = MediaQuery.of(context).size.height * 0.5;
    }
    // cardのwidthを定義
    final double cardWidth = MediaQuery.of(context).size.width * AppNum.cardWidth;
    // 年代表記のpadding設定
    const double yearPadding = 3.0;
    // メニュー一覧を格納
    const Map<String, int> menuList = <String, int>{
      AppTitleWord.menuTitleTop: 0xf013d,
      AppTitleWord.menuTitleAccountEdit: 0xe498,
      AppTitleWord.menuTitleSetting: 0xec76
    };

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
                    Align(
                      alignment: Alignment.topRight,
                      child: Card(
                        margin: const EdgeInsets.only(top: AppNum.cardMargin),
                        child: SizedBox(
                          width: cardWidth * 0.7,
                          height: 50,
                          child: YearSelectBox(),
                        ),
                      )
                    ),
                    Card(
                      margin: const EdgeInsets.only(top: AppNum.cardMargin),
                      child: SizedBox(
                        width: cardWidth,
                        height: 70,
                        child: const TeamSelectBox(pageType: false),
                      ),
                    ),
                    Card(
                      margin: const EdgeInsets.all(AppNum.cardMargin),
                      child: Column(
                        children: [
                          SizedBox(
                            width: cardWidth,
                            height: cardMenuHeight,
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                      margin: const EdgeInsets.all(AppNum.subtitle),
                                      child: const Text(
                                        'メニュー',
                                        style: TextStyle(fontSize: AppNum.cardTitleSize),
                                      )
                                  ),
                                ),

                                // 上下中央に配置できないため、質問する
                                Expanded(
                                  child: ListView.builder(
                                      padding: const EdgeInsets.only(left: 30, right: 30),
                                      itemCount: menuList.length,
                                      itemBuilder: (context, int index) {
                                        String key = menuList.keys.elementAt(index);
                                        return InkWell(
                                            onTap: () {
                                              // 検索TOPがクリックされた時
                                              if(key == AppTitleWord.menuTitleTop)
                                                Navigator.of(context).pushNamed("/home");
                                              // アカウント編集がクリックされた時
                                              // if(key == AppTitleWord.menuTitleAccountEdit)
                                              // 設定がクリックされた時
                                              if(key == AppTitleWord.menuTitleSetting)
                                                Navigator.of(context).pushNamed("/settings");
                                            },
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                  border: Border(bottom: BorderSide(
                                                    color: Colors.black,
                                                    width: 0.8,
                                                  ))
                                              ),
                                              child: ListTile(
                                                leading: Icon(
                                                    IconData(menuList[key]!, fontFamily: 'MaterialIcons')
                                                ),
                                                title: Text(
                                                    key,
                                                    style: const TextStyle(
                                                        fontSize: 20
                                                    )
                                                ),
                                              ),
                                            )
                                        );
                                      }
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          );
      }),
    );
  }
}