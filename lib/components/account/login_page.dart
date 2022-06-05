/// ログインページ

import 'package:flutter/material.dart';
import '../../common/app_bar/app_main_bar.dart';
import '../../configs/const.dart';

class LoginPage extends StatelessWidget {
  @override
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double cardLoginHeight;
    final double loginFormHeight;
    final double cardAccountConfirmHeight;

    if(MediaQuery.of(context).size.height == AppNum.iphoneHeight8) {
      // ログインのcardのheightを定義
      cardLoginHeight = MediaQuery.of(context).size.height * 0.6;
      // ログインフォームのheight範囲
      loginFormHeight = cardLoginHeight * 0.5;
      // アカウント確認のcardのheightを定義
      cardAccountConfirmHeight = MediaQuery.of(context).size.height * 0.3;
    } else {
      // ログインのcardのheightを定義
      cardLoginHeight = MediaQuery.of(context).size.height * 0.5;
      // ログインフォームのheight範囲
      loginFormHeight = cardLoginHeight * 0.6;
      // アカウント確認のcardのheightを定義
      cardAccountConfirmHeight = MediaQuery.of(context).size.height * 0.2;
    }
    // cardのwidthを定義
    final double cardWidth = MediaQuery.of(context).size.width * AppNum.cardWidth;
    // ログインフォームのwidth範囲
    final double loginFormWidth = cardWidth * 0.8;

    return Scaffold(
      appBar: const AppMainBar(),
      backgroundColor: AppColor.backColor,
      body: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Card (
                  child: SizedBox (
                    width: cardWidth,
                    height: cardLoginHeight,
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
                        SizedBox(
                          width: loginFormWidth,
                          height: loginFormHeight,
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                    margin: const EdgeInsets.only(top: AppNum.subtitle),
                                    child: const Text(
                                      'メールアドレス',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: AppNum.formLabel
                                      ),
                                    )
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    hintText: 'xxx@xxx.co.jp',
                                    hintStyle: const TextStyle(fontSize: 16, color: Colors.grey),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                    margin: const EdgeInsets.only(top: AppNum.subtitle),
                                    child: const Text(
                                      'パスワード',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: AppNum.formLabel
                                      ),
                                    )
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 15.0),
                                child: TextFormField(
                                  decoration: const InputDecoration(),
                                ),
                              )
                            ]
                          )
                        ),
                        SizedBox(
                            height: 40,
                            width: 180,
                            child: ElevatedButton(
                              onPressed: () {
                                // ログインページへ遷移
                                Navigator.of(context).pushNamed("/login");
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
                  )
                ),
                Card(
                  margin: const EdgeInsets.all(AppNum.cardMargin),
                  child: SizedBox(
                    width: cardWidth,
                    height: cardAccountConfirmHeight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget> [
                        const Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Center(
                            child: Text(
                              'アカウントをお持ちですか？',
                              style: TextStyle(
                                fontSize: 17
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                            height: 40,
                            width: cardWidth * 0.75,
                            child: ElevatedButton(
                              onPressed: () {
                                // ログインページへ遷移
                                Navigator.of(context).pushNamed("/login");
                              },
                              style: ElevatedButton.styleFrom(
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
                            )
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          )
      )
    );
  }
}

// body: SizedBox(   // ContainerよりSizedBoxの方が推奨されている!?
// width: double.infinity,
// //child: TextFormField(  // TextFieldとの違いは機能の多さ。例えば、validatorはTextFormFieldならではの機能である。
// child: Column(
// children: <Widget> [
// TextField(
// // validator: (String? value) {
// //   if(value!.isEmpty) {
// //     return 'Please enter some text';
// //   }
// //   return null;
// // },   // これを実装するだけでは、機能しない。公式ドキュメントのcookbookを要確認
// autofocus: true,  // 画面を開いた時に入力キーボードが自動で立ち上がる
// decoration: const InputDecoration(
// // border: InputBorder.none,
// hintText: 'Enter a search term',  // placeholder
// ),
// onChanged: (String? text) {
// // 文字が入力されるたびにprintされる
// print('First text field: $text');
// name = text;
// },
// ),
// TextField(
// controller: myController,
// focusNode: myFocusNode,  // 下のElevatedButtonをクリックした際にフォーカスが当たる
// ),
// ElevatedButton(
// onPressed: () {
// // TODO: ここにフォーカスするためのコード(ボタンを押すと、focusNodeを設定した要素にフォーカスされる)
// myFocusNode.requestFocus();
// // Controllerを使用する場合
// // print(myController.text);
//
// // Controllerがもつ入力値をモーダルに表示する
// showDialog(context: context, builder: (context) {
// return AlertDialog(
// content: Text(myController.text),
// );
// });
// }, child: const Text('新規登録する')
// )
// ],
// ),
// ),