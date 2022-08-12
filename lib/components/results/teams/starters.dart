/// ロスターを表示するコンポーネント

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../configs/const.dart';
import '../../../domain/player.dart';
import '../../common/search_selectbox/team_select_box.dart';
import '../../common/search_selectbox/year_select_box.dart';
import './change_button.dart';

class Starters extends StatefulWidget {
  // 選手一覧のデータ格納用変数
  final List<Player> players;

  const Starters({Key? key, required this.players}) : super(key: key);

  @override
  _StartersState createState() => _StartersState();
}

class _StartersState extends State<Starters> {
  int _odflg = 0;

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

    final List<Player> players = widget.players;

    // SingleChildScrollViewで高さ指定が必要
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget> [
            Padding(
              padding: const EdgeInsets.all(AppNum.cardPadding),
              child: Column(
                children: [

                  // 年代のドロップダウンリスト
                  Padding(
                    padding: const EdgeInsets.only(left: AppNum.cardPadding * 3),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.only(top: selectBoxHeight, bottom: selectBoxHeight),
                        child: YearSelectBox(),
                      ),
                    ),
                  ),

                  // チームのドロップダウンリスト
                  const Card(
                      margin: EdgeInsets.only(top: AppNum.cardMargin),
                      child: Padding(
                        padding: EdgeInsets.only(top: selectBoxHeight, bottom: selectBoxHeight),
                        child: TeamSelectBox(),
                      )
                  ),
                ],
              ),
            ),

            // オフェンス・ディフェンス切り替えボタン
            ChangeButton(
              odflg: _odflg,
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
                        _odflg == 0 ? 'Offence Starters' : 'Defence Starters',
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