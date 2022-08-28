/// ログイン済みの場合のメニュー画面

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nfl_library/components/common/app_bar/app_back_bar.dart';
import '../../configs/const.dart';

class LoggedInMenuPage extends StatelessWidget {
  @override
  const LoggedInMenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // cardのwidthを定義
    final double cardWidth = MediaQuery.of(context).size.width * AppNum.cardWidth;
    // 年代表記のpadding設定
    const double yearPadding = 3.0;

    return Scaffold(
        appBar: const AppBackBar(),
        backgroundColor: AppColor.backColor,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [

                // お気に入りチーム
                Padding(
                  padding: const EdgeInsets.only(top: AppNum.cardPadding, left: AppNum.cardPadding, right: AppNum.cardPadding),
                  child: Card(
                    child: Column(
                      children: [
                        Row(
                          children: <Widget> [
                            Expanded(
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    margin: const EdgeInsets.all(AppNum.labelMargin),
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
                                margin: const EdgeInsets.all(AppNum.labelMargin),
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
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              child: Column(
                                children: [
                                  SizedBox(
                                      width: cardWidth * 0.8,
                                      height: 110,
                                      child: Image.asset('images/favorite_teams/San_Francisco_49ers_logo_mini.png')
                                  ),
                                  const Text(
                                    'San Francisco',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: 'Playfair_Display'
                                    ),
                                  ),
                                  const Text(
                                    '49ers',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontFamily: 'Bebas_Neue'
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: AppNum.cardPadding, left: AppNum.cardPadding, right: AppNum.cardPadding),
                  child: Card(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                              margin: const EdgeInsets.all(AppNum.labelMargin),
                              child: const Text(
                                'メニュー',
                                style: TextStyle(fontSize: AppNum.cardTitleSize),
                              )
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              // 検索TOP
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: InkWell(
                                  onTap: () {
                                    // 検索TOPがクリックされた時
                                    Navigator.of(context).pushNamed("/home");
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          border: Border(bottom: BorderSide(
                                            color: Colors.black,
                                            width: 0.8,
                                          ))
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: const <Widget> [
                                          Padding(
                                            padding: EdgeInsets.only(right: 20.0),
                                            child: Icon(IconData(0xf013d, fontFamily: 'MaterialIcons')),
                                          ),
                                          Text(
                                            '検索TOP',
                                            style: TextStyle(
                                                fontSize: AppNum.menuFontSize
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ),
                              ),

                              //アカウント編集
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: InkWell(
                                    onTap: () {
                                      // アカウント編集がクリックされた時
                                      Navigator.of(context).pushNamed("/account_edit");
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Container(
                                        decoration: const BoxDecoration(
                                            border: Border(bottom: BorderSide(
                                              color: Colors.black,
                                              width: 0.8,
                                            ))
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: const <Widget> [
                                            Padding(
                                              padding: EdgeInsets.only(right: 20.0),
                                              child: Icon(IconData(0xe498, fontFamily: 'MaterialIcons')),
                                            ),
                                            Text(
                                              'アカウント編集',
                                              style: TextStyle(
                                                  fontSize: AppNum.menuFontSize
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                ),
                              ),

                              // パスワード再設定
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: InkWell(
                                    onTap: () {
                                      // パスワード再設定がクリックされた時
                                      Navigator.of(context).pushNamed("/password_reset");
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Container(
                                        decoration: const BoxDecoration(
                                            border: Border(bottom: BorderSide(
                                              color: Colors.black,
                                              width: 0.8,
                                            ))
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: const <Widget> [
                                            Padding(
                                              padding: EdgeInsets.only(right: 20.0),
                                              child: Icon(IconData(0xe47a, fontFamily: 'MaterialIcons')),
                                            ),
                                            Text(
                                              'パスワード再設定',
                                              style: TextStyle(
                                                  fontSize: AppNum.menuFontSize
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                ),
                              ),

                              // 設定
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: InkWell(
                                    onTap: () {
                                      // 設定がクリックされた時
                                      Navigator.of(context).pushNamed("/settings");
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Container(
                                        decoration: const BoxDecoration(
                                            border: Border(bottom: BorderSide(
                                              color: Colors.black,
                                              width: 0.8,
                                            ))
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: const <Widget> [
                                            Padding(
                                              padding: EdgeInsets.only(right: 20.0),
                                              child: Icon(IconData(0xec76, fontFamily: 'MaterialIcons')),
                                            ),
                                            Text(
                                              '設定',
                                              style: TextStyle(
                                                  fontSize: AppNum.menuFontSize
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}