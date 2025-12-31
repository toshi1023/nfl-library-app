/// ロスターを表示するコンポーネント

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nfl_library/domain/roster.dart';
import '../../../configs/const.dart';
import '../../../domain/player2.dart';

class Rosters extends StatelessWidget {
  // 選手一覧のデータ格納用変数
  // final List<Player> players;
  final List<Roster>? params;

  @override
  // const Rosters({Key? key, required this.players}) : super(key: key);
  const Rosters({Key? key, this.params}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double containerWidth;
    // 検索用ドロップダウンリストのレイアウト設定
    const double selectBoxHeight = AppNum.cardPadding / 5;

    containerWidth = MediaQuery.of(context).size.width * 0.6;

    // final Map<String, dynamic> data = Provider.of<Map<String, dynamic>>(context);
    // final List<Player> players = data['rosters'];

    // SingleChildScrollViewで高さ指定が必要
    return Column(
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
        ListView.builder( // ListViewはスクロールが自動でつく
          // スクロールする要素の中(SingleChildScrollView)にスクロールする要素(ListView)を追加してしまうと、
          // ListViewがどっちのスクロールに高さを合わせればいいか分からなくなるため、エラーを発生させる

          // 要素の高さに合わせてどうこう調整してくれるもの
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),

          itemCount: params?.length,
          itemBuilder: (context, index) {
            // 選手情報がない場合
            if(params == null || params!.isEmpty) {
              return const Center(
                child: Text(
                  '選手情報がありません',
                  style: TextStyle(
                    fontSize: AppNum.md,
                  ),
                ),
              );
            } else {
              // 選手情報がある場合
              final data = params![index];
              return Padding(
                padding: index == (params != null ? params!.length - 1 : 0) ?
                // 最後だけ
                const EdgeInsets.all(AppNum.cardPadding * 0.7)
                    :
                // 最初から最後の1つ手前まで
                const EdgeInsets.only(top: AppNum.xs, left: AppNum.cardPadding * 0.7, right: AppNum.cardPadding * 0.7),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed("/player_detail", arguments: data);
                  },
                  child: Card(
                    color: AppColor.subColor,
                    child: Padding(
                      padding: const EdgeInsets.all(AppNum.xs),
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: data.player.imageFile != null ? Image.asset(
                              data.player.imageUrl,
                              width: AppNum.dropDownListImageSize,
                            ) : null,
                          ),
                          Flexible(
                            fit: FlexFit.tight,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget> [
                                Text(
                                  '${data.position.name}  #${data.number}',
                                  style: const TextStyle(
                                      fontSize: AppNum.resultsNameFontSize * 0.6
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: AppNum.resultsNamePadding, left: AppNum.resultsNamePadding, right: AppNum.resultsNamePadding),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,  // これで左寄せと右寄せを実現
                                    children: <Widget> [
                                      Text(
                                        data.player.firstname + data.player.lastname,
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
                                                data.rating == null ? '-' : data.rating.toString(),
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
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }
          },
        )

      ],
    );
  }
}