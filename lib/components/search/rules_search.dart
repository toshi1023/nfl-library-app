import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../common/app_bar/app_main_bar.dart';
import '../../configs/const.dart';
import '../common/search_selectbox/offence_defence_kick_select_box.dart';
import '../common/search_selectbox/penalty_yard_select_box.dart';

class RulesSearch extends StatelessWidget {
  @override
  const RulesSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // メニューのcardのheightを定義
    final double cardSearchHeight = MediaQuery.of(context).size.height * 0.6;
    // cardのwidthを定義
    final double cardWidth = MediaQuery.of(context).size.width * AppNum.cardWidth;

    return Scaffold(
        backgroundColor: AppColor.backColor,
        body: Container(
          alignment: Alignment.center,
          child: Card (
              child: SizedBox (
                width: cardWidth,
                height: cardSearchHeight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        width: cardWidth * 0.7,
                        height: cardSearchHeight,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                  margin: const EdgeInsets.only(top: AppNum.subtitle),
                                  child: const Text(
                                    '攻守ステータス',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: AppNum.formLabel
                                    ),
                                  )
                              ),
                            ),
                            SizedBox(
                              width: cardWidth * 0.7,
                              height: 50,
                              child: OffenceDefenceKickSelectBox(),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                  margin: const EdgeInsets.only(top: AppNum.subtitle),
                                  child: const Text(
                                    '罰則ヤード',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: AppNum.formLabel
                                    ),
                                  )
                              ),
                            ),
                            SizedBox(
                              width: cardWidth * 0.7,
                              height: 50,
                              child: PenaltyYardSelectBox(),
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
                                    '検索',
                                    style: TextStyle(fontSize: 17),
                                  ),
                                )
                            )
                          ],
                        )
                    )
                  ],
                ),
              )
          ),
        )
    );
  }
}