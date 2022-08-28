/// ログイン済みの場合のメニュー画面

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nfl_library/components/common/app_bar/app_back_bar.dart';
import '../../configs/const.dart';

class NotLoggedInMenuPage extends StatelessWidget {
  @override
  const NotLoggedInMenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      children: <Widget> [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                              margin: const EdgeInsets.all(AppNum.labelMargin),
                              child: const Text(
                                'お気に入りチーム',
                                style: TextStyle(fontSize: AppNum.cardTitleSize),
                              )
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
                          child: Container(
                            alignment: Alignment.center,
                            height: AppNum.logoImageSize,
                            child: Image.asset(
                              AppImages.nflLogoImage,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            children: const <Widget> [
                              Text(
                                  '会員登録をして'
                              ),
                              Text(
                                  'お気に入りのチームを登録しよう'
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ),
                ),

                // メニュー
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
                        )
                      ],
                    ),
                  ),
                ),

                // アカウント
                Padding(
                  padding: const EdgeInsets.only(top: AppNum.cardPadding, left: AppNum.cardPadding, right: AppNum.cardPadding),
                  child: Card(
                    child: Column(
                      children: <Widget> [
                        SizedBox(
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                                margin: const EdgeInsets.all(AppNum.labelMargin),
                                child: const Text(
                                  'アカウント',
                                  style: TextStyle(fontSize: AppNum.cardTitleSize),
                                )
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0, bottom: 15.0),
                          child: Container(
                            alignment: Alignment.center,
                            child: const Icon(
                              Icons.lock_person_rounded,
                              size: AppNum.lockIconSize,
                            )
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: AppNum.cardPadding),
                          child: ElevatedButton(
                            onPressed: () {
                              // ログインページへ遷移
                              Navigator.of(context).pushNamed("/login");
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.only(
                                top: AppNum.buttonPadding * 0.15, bottom: AppNum.buttonPadding * 0.15,
                                left: AppNum.buttonPadding, right: AppNum.buttonPadding
                              ),
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
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}