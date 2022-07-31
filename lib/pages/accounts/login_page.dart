/// ログインページ

import 'package:flutter/material.dart';
import '../../components/common/app_bar/app_main_bar.dart';
import '../../configs/const.dart';

class LoginPage extends StatelessWidget {
  @override
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: const AppMainBar(null),
      backgroundColor: AppColor.backColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(AppNum.cardPadding),
                child: Card (
                  child: Column(
                    children: <Widget> [
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0, bottom: 15.0),
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
                                        Icons.lock_person_rounded,
                                        size: 20,
                                      )
                                  ),
                                ),
                                const Text(
                                  'ログイン',
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
                                hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
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
                            'ログイン',
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                      )
                    ],
                  )
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(AppNum.cardPadding),
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget> [
                      const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Center(
                          child: Text(
                            'アカウントをお持ちですか？',
                            style: TextStyle(
                              fontSize: 17
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: ElevatedButton(
                          onPressed: () {
                            // アカウント登録ページへ遷移
                            Navigator.of(context).pushNamed("/account_register");
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.only(
                                top: AppNum.buttonPadding * 0.15, bottom: AppNum.buttonPadding * 0.15
                            ),
                            primary: Colors.deepPurpleAccent, //ボタンの背景色
                            shape: const RoundedRectangleBorder(
                              // ボタンの形に丸みをおびせる
                              borderRadius: BorderRadius.all(Radius.circular(18.0)),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget> [
                              const Text(
                                'アカウントを登録する',
                                style: TextStyle(fontSize: 17),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Container(
                                    alignment: Alignment.center,
                                    child: const Icon(
                                      Icons.person_add_rounded,
                                      size: 20,
                                    )
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
            ],
          )
        ),
      )
    );
  }
}
