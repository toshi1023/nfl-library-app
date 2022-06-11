/// ログイン済みの場合のメニュー画面

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nfl_library/common/app_bar/app_back_bar.dart';
import '../../configs/const.dart';

class LoggedInMenuPage extends StatelessWidget {
  @override
  const LoggedInMenuPage({Key? key}) : super(key: key);

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

    return Scaffold(
        appBar: const AppBackBar(),
        backgroundColor: AppColor.backColor,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget> [
              Center(
                child: Card(
                  margin: const EdgeInsets.only(top: AppNum.cardMargin),
                  child: SizedBox(
                    width: cardWidth,
                    height: cardFavoriteHeight,
                    child: Row(
                      children: <Widget> [
                        Expanded(
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                margin: const EdgeInsets.all(AppNum.subtitle),
                                child: const Text(
                                  'お気に入りチーム',
                                  style: TextStyle(fontSize: AppNum.cardTitleSize),
                                )
                              ),
                            ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            decoration: const BoxDecoration(color: AppColor.mainColor),
                            margin: const EdgeInsets.all(AppNum.subtitle),
                            padding: const EdgeInsets.all(yearPadding),
                            child: const Text(
                              '2013年',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                child: Card(
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
                ),
              )
            ],
          ),
        )
    );
  }
}