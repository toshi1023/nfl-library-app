/// オフェンスとディフェンスの切り替えを実行する

import 'package:flutter/material.dart';
import '../../../configs/const.dart';

class ChangeButton extends StatelessWidget {
  final int odflg;
  final Function callback;
  const ChangeButton({Key? key, required this.odflg, required this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: AppNum.cardPadding * 2, right: AppNum.cardPadding * 2),
      child: ElevatedButton(
        onPressed: () {
          // オフェンスとディフェンスを切り替え
          callback();
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
            Text(
              odflg == 0 ? 'Offence Starters' : 'Defence Starters',
              style: const TextStyle(
                fontSize: 17,
                fontFamily: 'Bree_Serif'
              ),
            ),
          ],
        ),
      ),
    );
  }
}