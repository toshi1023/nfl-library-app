/// オフェンスとディフェンスの切り替えを実行する

import 'package:flutter/material.dart';
import '../../../configs/const.dart';

class ChangeButton extends StatelessWidget {
  final int odflg;
  final String offenceSubtitle;
  final String defenceSubtitle;
  final Function callback;
  const ChangeButton({Key? key, required this.odflg, required this.offenceSubtitle, required this.defenceSubtitle, required this.callback}) : super(key: key);

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
            Container(
              margin: const EdgeInsets.only(right: 10),
              width: AppNum.dropDownListImageSize,
              height: AppNum.dropDownListImageSize,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    odflg == 0 ?
                    'images/icons/offence-logo-resize.jpg'
                        :
                    'images/icons/defence-logo-resize.png'
                  ),
                  fit: BoxFit.fill,
                ),
                borderRadius: const BorderRadius.all( Radius.circular(AppNum.dropDownListImageSize * 0.5)),

              ),
            ),
            Text(
              odflg == 0 ? offenceSubtitle : defenceSubtitle,
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