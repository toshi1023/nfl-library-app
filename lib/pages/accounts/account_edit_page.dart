/// アカウント情報編集ページ

import 'package:flutter/material.dart';
import '../../components/common/app_bar/app_back_bar.dart';
import '../../configs/const.dart';

class AccountEditPage extends StatelessWidget {
  @override
  const AccountEditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBackBar(),
        backgroundColor: AppColor.backColor,
        body: Center(
          child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(AppNum.cardPadding),
                child: Card (
                    child: Column(
                      children: <Widget> [
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
                                        child: const Icon(IconData(0xe498, fontFamily: 'MaterialIcons'), size: 20),
                                    ),
                                  ),
                                  const Text(
                                    'アカウント編集',
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
                              )
                            ]
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: AppNum.formButtonTop, bottom: AppNum.formButtonBottom),
                          child: ElevatedButton(
                            onPressed: () {
                              // ログインページへ遷移
                              Navigator.of(context).pushNamed("/logged_in_menu");
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
                              '更新',
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