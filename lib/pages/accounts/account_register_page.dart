/// ログインページ

import 'package:flutter/material.dart';
import '../../components/common/app_bar/app_main_bar.dart';
import '../../configs/const.dart';

class AccountRegisterPage extends StatelessWidget {
  @override
  const AccountRegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double cardLoginHeight;
    final double accountRegisterFormHeight;

    if(MediaQuery.of(context).size.height == AppNum.iphoneHeight8) {
      // ログインのcardのheightを定義
      cardLoginHeight = MediaQuery.of(context).size.height * 0.8;
      // アカウント登録フォームのheight範囲
      accountRegisterFormHeight = cardLoginHeight * 0.8;
    } else {
      // ログインのcardのheightを定義
      cardLoginHeight = MediaQuery.of(context).size.height * 0.75;
      // アカウント登録フォームのheight範囲
      accountRegisterFormHeight = cardLoginHeight * 0.7;
    }
    // cardのwidthを定義
    final double cardWidth = MediaQuery.of(context).size.width * AppNum.cardWidth;
    // アカウント登録フォームのwidth範囲
    final double accountRegisterFormWidth = cardWidth * 0.8;

    return Scaffold(
        appBar: const AppMainBar(),
        backgroundColor: AppColor.backColor,
        body: Center(
          child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(AppNum.cardPadding),
                child: Card (
                    child: Column(
                      children: <Widget> [
                        Align(
                          alignment: Alignment.topLeft,
                          child: InkWell(
                            onTap: () {
                              // ログインページへ遷移
                              Navigator.of(context).pushNamed("/login");
                            },
                            child: Container(
                                margin: const EdgeInsets.all(AppNum.subtitle),
                                child: const Text(
                                  'ログインに戻る',
                                  style: TextStyle(
                                    color: Colors.blueAccent
                                  ),
                                )
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0, bottom: 15.0),
                          child: Container(
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5.0),
                                    child: Container(
                                        alignment: Alignment.center,
                                        child: const Icon(
                                          Icons.person_add_rounded,
                                          size: 20,
                                        )
                                    ),
                                  ),
                                  const Text(
                                    'アカウント登録',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ],
                              )
                          ),
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: AppNum.formWidth, right: AppNum.formWidth),
                                child: Text(
                                  'ユーザ名',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: AppNum.formLabelFontSize
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: AppNum.formWidth, right: AppNum.formWidth, bottom: AppNum.formHeight),
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    hintText: 'test user',
                                    hintStyle: const TextStyle(fontSize: 16, color: Colors.grey),
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: AppNum.formWidth, right: AppNum.formWidth),
                                child: Text(
                                  'メールアドレス',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: AppNum.formLabelFontSize
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: AppNum.formWidth, right: AppNum.formWidth, bottom: AppNum.formHeight),
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    hintText: 'xxx@xxx.co.jp',
                                    hintStyle: const TextStyle(fontSize: 16, color: Colors.grey),
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: AppNum.formWidth, right: AppNum.formWidth),
                                child: Text(
                                  'パスワード',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: AppNum.formLabelFontSize
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: AppNum.formWidth, right: AppNum.formWidth, bottom: AppNum.formHeight),
                                child: TextFormField(
                                  decoration: const InputDecoration(),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: AppNum.formWidth, right: AppNum.formWidth),
                                child: Text(
                                  'パスワード(確認)',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: AppNum.formLabelFontSize
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: AppNum.formWidth, right: AppNum.formWidth, bottom: AppNum.formHeight),
                                child: TextFormField(
                                  decoration: const InputDecoration(),
                                ),
                              )
                            ]
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: AppNum.formButtonTop, bottom: AppNum.formButtonBottom),
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
                              '登録',
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                        )
                      ],
                    )
                ),
              )
          ),
        )
    );
  }
}