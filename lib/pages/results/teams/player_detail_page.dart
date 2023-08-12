/// 選手の詳細情報を表示する画面

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nfl_library/components/common/app_bar/app_back_bar.dart';
import 'package:nfl_library/components/results/teams/rosters.dart';
import '../../../domain/player2.dart';
import '../../../configs/const.dart';

class PlayerDetailPage extends StatelessWidget {
  @override
  const PlayerDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double imageSize = 130.0;  // 選手画像のサイズ
    final double containerWidth;
    containerWidth = MediaQuery.of(context).size.width;
    // タップした選手情報を取得
    final player = ModalRoute.of(context)!.settings.arguments as Player;

    return Scaffold(
      appBar: const AppBackBar(),
      backgroundColor: AppColor.backColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
            'images/logos/49ers_logo.jpg',
              fit: BoxFit.fill,        // widthを横幅いっぱいにしてもいい感じに調整してくれる
              width: double.infinity,
              // 色を半透明にする
              color: const Color.fromRGBO(255, 255, 255, 0.3),
              colorBlendMode: BlendMode.modulate,
            ),
            Padding(
              padding: const EdgeInsets.all(AppNum.cardPadding),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [

                  // 選手画像以外の選手情報
                  Padding(
                    padding: const EdgeInsets.only(top: imageSize * 0.5),
                    child: Card(
                      child: Column(
                        children: <Widget> [

                          // 選手名
                          const Padding(
                            padding: EdgeInsets.only(top: imageSize * 0.5, left: AppNum.cardPadding, right: AppNum.cardPadding),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                '名前',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: AppNum.formLabelFontSize
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: AppNum.cardPadding, right: AppNum.cardPadding, bottom: AppNum.cardPadding),
                            child: Container(
                              width: containerWidth,
                              decoration: const BoxDecoration(
                                  border: Border(bottom: BorderSide(
                                    color: Colors.black,
                                    width: 0.8,
                                  ))
                              ),
                              child: Center(
                                child: Text(
                                  player.name,
                                  style: const TextStyle(
                                    fontSize: AppNum.resultsNameFontSize
                                  ),
                                )
                              ),
                            ),
                          ),

                          // 身長・体重
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(left: AppNum.cardPadding, right: AppNum.cardPadding),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        '身長',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: AppNum.formLabelFontSize
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: AppNum.cardPadding, bottom: AppNum.cardPadding),
                                    child: Container(
                                      width: containerWidth * 0.35,
                                      decoration: const BoxDecoration(
                                          border: Border(bottom: BorderSide(
                                            color: Colors.black,
                                            width: 0.8,
                                          ))
                                      ),
                                      child: Center(
                                          child: Text(
                                            '${player.height}cm',
                                            style: const TextStyle(
                                                fontSize: AppNum.resultsNameFontSize
                                            ),
                                          )
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(left: AppNum.cardPadding, right: AppNum.cardPadding),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        '体重',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: AppNum.formLabelFontSize
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: AppNum.cardPadding, bottom: AppNum.cardPadding),
                                    child: Container(
                                      width: containerWidth * 0.35,
                                      decoration: const BoxDecoration(
                                          border: Border(bottom: BorderSide(
                                            color: Colors.black,
                                            width: 0.8,
                                          ))
                                      ),
                                      child: Center(
                                          child: Text(
                                            '${player.weight}kg',
                                            style: const TextStyle(
                                                fontSize: AppNum.resultsNameFontSize
                                            ),
                                          )
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),

                          // 出身大学
                          const Padding(
                            padding: EdgeInsets.only(left: AppNum.cardPadding, right: AppNum.cardPadding),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                '出身大学',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: AppNum.formLabelFontSize
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: AppNum.cardPadding, right: AppNum.cardPadding, bottom: AppNum.cardPadding),
                            child: Container(
                              width: containerWidth,
                              decoration: const BoxDecoration(
                                  border: Border(bottom: BorderSide(
                                    color: Colors.black,
                                    width: 0.8,
                                  ))
                              ),
                              child: Center(
                                child: Text(
                                  player.university,
                                  style: const TextStyle(
                                      fontSize: AppNum.resultsNameFontSize
                                  ),
                                )
                              ),
                            ),
                          ),

                          // ドラフト(年)
                          const Padding(
                            padding: EdgeInsets.only(left: AppNum.cardPadding, right: AppNum.cardPadding),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'ドラフト(年)',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: AppNum.formLabelFontSize
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: AppNum.cardPadding, right: AppNum.cardPadding, bottom: AppNum.cardPadding),
                            child: Container(
                              width: containerWidth,
                              decoration: const BoxDecoration(
                                  border: Border(bottom: BorderSide(
                                    color: Colors.black,
                                    width: 0.8,
                                  ))
                              ),
                              child: Center(
                                  child: Text(
                                    '${player.draftYear}年',
                                    style: const TextStyle(
                                        fontSize: AppNum.resultsNameFontSize
                                    ),
                                  )
                              ),
                            ),
                          ),

                          // ドラフト(巡回数)・ドラフト(順位)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(left: AppNum.cardPadding, right: AppNum.cardPadding),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'ドラフト(巡回数)',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: AppNum.formLabelFontSize
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: AppNum.cardPadding, bottom: AppNum.cardPadding * 2),
                                    child: Container(
                                      width: containerWidth * 0.35,
                                      decoration: const BoxDecoration(
                                          border: Border(bottom: BorderSide(
                                            color: Colors.black,
                                            width: 0.8,
                                          ))
                                      ),
                                      child: Center(
                                          child: Text(
                                            '${player.draftCount}th',
                                            style: const TextStyle(
                                                fontSize: AppNum.resultsNameFontSize
                                            ),
                                          )
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(left: AppNum.cardPadding, right: AppNum.cardPadding),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'ドラフト(順位)',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: AppNum.formLabelFontSize
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: AppNum.cardPadding, bottom: AppNum.cardPadding * 2),
                                    child: Container(
                                      width: containerWidth * 0.35,
                                      decoration: const BoxDecoration(
                                          border: Border(bottom: BorderSide(
                                            color: Colors.black,
                                            width: 0.8,
                                          ))
                                      ),
                                      child: Center(
                                          child: Text(
                                            '${player.draftRanking}th pick',
                                            style: const TextStyle(
                                                fontSize: AppNum.resultsNameFontSize
                                            ),
                                          )
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),

                  // ポジション & 背番号
                  Padding(
                    padding: const EdgeInsets.only(top: imageSize * 0.7, left: AppNum.cardPadding),
                    child: Row(
                      children: [
                        Container(
                          width: 30,
                          height: 25,
                          decoration: const BoxDecoration(
                            color: AppColor.mainColor,
                          ),
                          child: Center(
                            child: Text(
                              player.position,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: AppNum.resultsNameFontSize
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            '#${player.number}',
                            style: const TextStyle(
                              fontSize: AppNum.resultsNameFontSize
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  // Ratingsのデザイン
                  Padding(
                    padding: const EdgeInsets.only(top: imageSize * 0.45, right: AppNum.cardPadding),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 60.0,
                        height: 70.0,
                        decoration: const BoxDecoration(
                          color: AppColor.mainColor,
                          shape: BoxShape.circle,
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: 40,
                              height: 30,
                              decoration: BoxDecoration(
                                color: AppColor.subColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                child: Text(
                                  'RT',
                                  style: TextStyle(
                                      fontSize: 20
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                player.rating.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 22
                                ),
                              )
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // 選手画像
                  Container(
                    width: imageSize,
                    height: imageSize,
                    decoration: BoxDecoration(
                      color: const Color(0xff7c94b6),
                      image: DecorationImage(
                        image: AssetImage(player.imageFile),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: const BorderRadius.all( Radius.circular(imageSize * 0.5)),
                      border: Border.all(
                        color: Colors.white,
                        width: 7.0,
                      ),
                    ),
                  ),
                ]
              ),
            )
          ],
        ),
      ),
    );
  }
}