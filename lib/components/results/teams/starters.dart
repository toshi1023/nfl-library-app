/// ロスターを表示するコンポーネント

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../configs/const.dart';
import '../../../domain/player2.dart';
import './change_button.dart';

class Starters extends StatefulWidget {
  const Starters({Key? key}) : super(key: key);

  @override
  _StartersState createState() => _StartersState();
}

class _StartersState extends State<Starters> {
  int _odflg = 0;
  final String _offenceStarters = 'Offence Starters';
  final String _defenceStarters = 'Defence Starters';

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

    final Map<String, dynamic> data = Provider.of<Map<String, dynamic>>(context);
    final List<Player> players = data['rosters'];

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
              offenceSubtitle: _offenceStarters,
              defenceSubtitle: _defenceStarters,
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
                        _odflg == 0 ? _offenceStarters : _defenceStarters,
                        style: const TextStyle(
                          fontSize: AppNum.resultsNameFontSize,
                          fontFamily: 'Bree_Serif',
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  ListView.builder( // ListViewはスクロールが自動でつく
                    // スクロールする要素の中(SingleChildScrollView)にスクロールする要素(ListView)を追加してしまうと、
                    // ListViewがどっちのスクロールに高さを合わせればいいか分からなくなるため、エラーを発生させる

                    // 要素の高さに合わせてどうこう調整してくれるもの
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),

                    itemCount: players.length,
                    itemBuilder: (context, index) {
                      final data = players[index];
                      return Padding(
                        padding: index == (players.length - 1) ?
                        // 最後だけ
                        const EdgeInsets.all(AppNum.cardPadding * 0.7)
                            :
                        // 最初から最後の1つ手前まで
                        const EdgeInsets.only(top: AppNum.cardPadding * 0.7, left: AppNum.cardPadding * 0.7, right: AppNum.cardPadding * 0.7),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed("/player_detail", arguments: data);
                          },
                          child: Card(
                            color: AppColor.subColor,
                            child: Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(10),
                                  child: Image.asset(
                                    data.imageFile,
                                    width: AppNum.dropDownListImageSize,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget> [
                                    Padding(
                                      padding: const EdgeInsets.only(top: AppNum.resultsNamePadding, left: AppNum.resultsNamePadding, right: AppNum.resultsNamePadding),
                                      child: Text(
                                        '${data.position}  #${data.number}',
                                        style: const TextStyle(
                                            fontSize: AppNum.resultsNameFontSize * 0.6
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: AppNum.resultsNamePadding, left: AppNum.resultsNamePadding, right: AppNum.resultsNamePadding),
                                      child: Container(
                                        width: containerWidth,
                                        decoration: const BoxDecoration(
                                            border: Border(bottom: BorderSide(
                                              color: Colors.black,
                                              width: 0.8,
                                            ))
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,  // これで左寄せと右寄せを実現
                                          children: <Widget> [
                                            Text(
                                              data.name,
                                              style: const TextStyle(
                                                  fontSize: AppNum.resultsNameFontSize
                                              ),
                                            ),

                                            // Ratingsのデザイン
                                            Container(
                                              width: 30.0,
                                              height: 40.0,
                                              decoration: const BoxDecoration(
                                                color: AppColor.mainColor,
                                                shape: BoxShape.circle,
                                              ),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    width: 22,
                                                    height: 15,
                                                    decoration: BoxDecoration(
                                                      color: AppColor.subColor,
                                                      borderRadius: BorderRadius.circular(10),
                                                    ),
                                                    child: const Center(
                                                      child: Text(
                                                        'RT',
                                                        style: TextStyle(
                                                            fontSize: 12
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Center(
                                                      child: Text(
                                                        data.rating.toString(),
                                                        style: const TextStyle(
                                                            color: Colors.white
                                                        ),
                                                      )
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}