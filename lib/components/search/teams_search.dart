/// チーム検索ページ

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../common/app_bar/app_main_bar.dart';
import '../../configs/const.dart';
import '../common/search_selectbox/year_select_box.dart';
import '../common/search_selectbox/team_select_box.dart';

class TeamsSearch extends StatelessWidget {
  @override
  const TeamsSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.backColor,
        body: Center(
            // alignment: Alignment.center,
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
                                        '年代',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: AppNum.formLabelFontSize
                                        ),
                                      )
                                  ),
                                ),
                                YearSelectBox(),
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
                                        'チーム',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: AppNum.formLabelFontSize
                                        ),
                                      )
                                  ),
                                ),
                                const TeamSelectBox(),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(AppNum.searchPaddingForm),
                            child: ElevatedButton(
                              onPressed: () {
                                // ロスターページへ遷移
                                Navigator.of(context).pushNamed("/results");
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