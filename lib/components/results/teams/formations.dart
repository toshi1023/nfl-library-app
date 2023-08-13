/// フォーメーションを表示するコンポーネント

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../configs/const.dart';
import '../../../domain/player.dart';
import './change_button.dart';

class Formations extends StatefulWidget {
  const Formations({Key? key}) : super(key: key);

  @override
  _FormationsState createState() => _FormationsState();
}

class _FormationsState extends State<Formations> {
  int _odflg = 0;
  final String _offenceFormations = 'Offence Formations';
  final String _defenceFormations = 'Defence Formations';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double containerWidth;
    // 検索用ドロップダウンリストのレイアウト設定
    const double selectBoxHeight = AppNum.cardPadding / 5;

    containerWidth = MediaQuery.of(context).size.width * 0.6;

    // SingleChildScrollViewで高さ指定が必要
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget> [
            // Padding(
            //   padding: const EdgeInsets.all(AppNum.cardPadding),
            //   child: Column(
            //     children: [
            //       // 年代のメニューリスト
            //       YearSelectBox(),
            //
            //       // チームのメニューリスト
            //       const TeamSelectBox(),
            //     ],
            //   ),
            // ),

            // オフェンス・ディフェンス切り替えボタン
            ChangeButton(
                odflg: _odflg,
                offenceSubtitle: _offenceFormations,
                defenceSubtitle: _defenceFormations,
                callback: () {
                  setState(() {
                    _odflg = _odflg == 0 ? 1 : 0;
                  });
                }
            ),

            Card(
              margin: const EdgeInsets.all(AppNum.cardMargin),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: AppNum.cardPadding),
                    child: Center(
                      child: Text(
                        _odflg == 0 ? _offenceFormations : _defenceFormations,
                        style: const TextStyle(
                            fontSize: AppNum.resultsNameFontSize,
                            fontFamily: 'Bree_Serif',
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Center(
                      child: Text(
                        '現在準備中です',
                        style: TextStyle(
                          fontSize: AppNum.resultsNameFontSize,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}