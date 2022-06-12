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
    // メニューのcardのheightを定義
    final double cardSearchHeight = MediaQuery.of(context).size.height * 0.6;
    // cardのwidthを定義
    final double cardWidth = MediaQuery.of(context).size.width * AppNum.cardWidth;
    // ドロップラウンリストのwidthを定義
    final double dropDownlistWidth = cardWidth * 0.8;

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
                        width: dropDownlistWidth,
                        height: cardSearchHeight,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                  margin: const EdgeInsets.only(top: AppNum.subtitle),
                                  child: const Text(
                                    '年代',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: AppNum.formLabel
                                    ),
                                  )
                              ),
                            ),
                            SizedBox(
                              width: dropDownlistWidth,
                              height: 50,
                              child: YearSelectBox(),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                  margin: const EdgeInsets.only(top: AppNum.subtitle),
                                  child: const Text(
                                    'チーム',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: AppNum.formLabel
                                    ),
                                  )
                              ),
                            ),
                            SizedBox(
                              width: dropDownlistWidth,
                              height: 50,
                              child: const TeamSelectBox(pageType: true),
                            ),
                            SizedBox(
                                height: 40,
                                width: 180,
                                child: ElevatedButton(
                                  onPressed: () {
                                    // ロスターページへ遷移
                                    Navigator.of(context).pushNamed("/rosters");
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