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
    return Scaffold(
        backgroundColor: AppColor.backColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(AppNum.cardPadding),
                child: Card (
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(AppNum.searchPaddingForm),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                    margin: const EdgeInsets.only(top: AppNum.labelMargin),
                                    child: const Text(
                                      '攻守ステータス',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: AppNum.formLabelFontSize
                                      ),
                                    )
                                ),
                              ),
                              OffenceDefenceKickSelectBox(),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(AppNum.searchPaddingForm),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                    margin: const EdgeInsets.only(top: AppNum.labelMargin),
                                    child: const Text(
                                      '罰則ヤード',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: AppNum.formLabelFontSize
                                      ),
                                    )
                                ),
                              ),
                              PenaltyYardSelectBox(),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(AppNum.searchPaddingForm),
                          child: ElevatedButton(
                            onPressed: () {
                              // 反則一覧ページへ遷移
                              Navigator.of(context).pushNamed("/rules");
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.only(left: AppNum.buttonPadding, right: AppNum.buttonPadding),
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
                          ),
                        )
                      ],
                    )
                ),
              ),
            ],
          ),
        )
    );
  }
}