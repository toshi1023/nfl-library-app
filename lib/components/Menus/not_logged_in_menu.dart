/// ログイン済みの場合のメニュー画面

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nfl_library/common/app_bar/app_back_bar.dart';
import '../../configs/const.dart';

class NotLoggedInMenu extends StatelessWidget {
  @override
  const NotLoggedInMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // お気に入りチームのcardのheightを定義
    final double cardFavoriteHeight = MediaQuery.of(context).size.height * 0.25;
    // メニューのcardのheightを定義
    final double cardMenuHeight = MediaQuery.of(context).size.height * 0.17;
    // アカウントのcardのheightを定義
    final double cardAccountHeight = MediaQuery.of(context).size.height * 0.3;
    // cardのwidthを定義
    final double cardWidth = MediaQuery.of(context).size.width * AppNum.cardWidth;
    // 年代表記のpadding設定
    const double yearPadding = 3.0;
    // メニュー一覧を格納
    const Map<String, int> menuList = <String, int>{
      AppTitleWord.menuTitleTop: 0xf013d,
    };

    return Scaffold(
        appBar: const AppBackBar(),
        backgroundColor: AppColor.backColor,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget> [
              Center(
                child: Card(
                  margin: const EdgeInsets.all(AppNum.cardMargin),
                  child: SizedBox(
                    width: cardWidth,
                    height: cardFavoriteHeight,
                    child: Column(
                      children: <Widget> [
                        SizedBox(
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                                margin: const EdgeInsets.all(AppNum.subtitle),
                                child: const Text('お気に入りチーム')
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0, bottom: 5.0),
                          child: Container(
                            alignment: Alignment.center,
                            child: Image.asset(
                              AppImages.nflLogoImage,
                            ),
                          ),
                        ),
                        const SizedBox(
                          child: Text(
                            '会員登録をして'
                          ),
                        ),
                        const SizedBox(
                          child: Text(
                              'お気に入りのチームを登録しよう'
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                child: Card(
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
                                  child: const Text('メニュー')
                              ),
                            ),

                            // 上下中央に配置できないため、きく
                            Expanded(
                              child: ListView.builder(
                                  padding: const EdgeInsets.only(left: 30, right: 30),
                                  itemCount: menuList.length,
                                  itemBuilder: (context, int index) {
                                    String key = menuList.keys.elementAt(index);
                                    return Container(
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
              ),
              Center(
                child: Card(
                  margin: const EdgeInsets.all(AppNum.cardMargin),
                  child: SizedBox(
                    width: cardWidth,
                    height: cardAccountHeight,
                    child: Column(
                      children: <Widget> [
                        SizedBox(
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                                margin: const EdgeInsets.all(AppNum.subtitle),
                                child: const Text('アカウント')
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                          child: Container(
                            alignment: Alignment.center,
                            child: const Icon(
                              Icons.lock_person_rounded,
                              size: AppNum.lockIcon,
                            )
                          ),
                        ),
                        SizedBox(
                            height: 40,
                            width: 180,
                            child: ElevatedButton(
                              onPressed: () {
                                // ログインページへ遷移
                              },
                              style: ElevatedButton.styleFrom(
                                primary: AppColor.mainColor, //ボタンの背景色
                                shape: const RoundedRectangleBorder(
                                  // ボタンの形に丸みをおびせる
                                  borderRadius: BorderRadius.all(Radius.circular(18.0)),
                                ),
                              ),
                              child: const Text(
                                'ログイン',
                                style: TextStyle(fontSize: 17),
                              ),
                            )
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}