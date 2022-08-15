/// 反則の詳細情報を表示する画面

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nfl_library/components/common/app_bar/app_back_bar.dart';
import '../../../domain/penalty.dart';
import '../../../configs/const.dart';

class RuleDetailPage extends StatelessWidget {
  @override
  const RuleDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double containerWidth;
    containerWidth = MediaQuery.of(context).size.width;
    // タップした反則情報を取得
    final penalty = ModalRoute.of(context)!.settings.arguments as Penalty;

    return Scaffold(
      appBar: const AppBackBar(),
      backgroundColor: AppColor.backColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(AppNum.cardPadding),
              child: Card(
                child: Column(
                  children: <Widget> [
                    // 反則名(英語表記)
                    Padding(
                      padding: const EdgeInsets.all(AppNum.cardPadding),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          penalty.englishName,
                          style: const TextStyle(
                            fontSize: AppNum.resultsNameFontSize,
                            fontFamily: 'Bree_Serif',
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),

                    // 反則名(日本語表記)
                    const Padding(
                      padding: EdgeInsets.only(left: AppNum.cardPadding, right: AppNum.cardPadding),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          '日本語名',
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
                              penalty.japaneseName,
                              style: const TextStyle(
                                  fontSize: AppNum.resultsNameFontSize
                              ),
                            )
                        ),
                      ),
                    ),

                    // 罰則ヤード
                    const Padding(
                      padding: EdgeInsets.only(left: AppNum.cardPadding, right: AppNum.cardPadding),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          '罰則ヤード',
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
                              '${penalty.yardInfo}ヤード',
                              style: const TextStyle(
                                  fontSize: AppNum.resultsNameFontSize
                              ),
                            )
                        ),
                      ),
                    ),

                    // Loss Of Down
                    const Padding(
                      padding: EdgeInsets.only(left: AppNum.cardPadding, right: AppNum.cardPadding),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Loss Of Down',
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
                              penalty.lossOfDownFlg ? 'あり' : 'なし',
                              style: const TextStyle(
                                  fontSize: AppNum.resultsNameFontSize
                              ),
                            )
                        ),
                      ),
                    ),

                    // ゲームクロック減算 & 退場
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
                                  'ゲームクロック減算',
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
                                    penalty.clockFlg ? 'あり' : 'なし',
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
                                  '資格没収(退場)',
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
                                    penalty.exitFlg ? 'あり' : 'なし',
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

                    // 反則詳細説明
                    Stack(
                      alignment: Alignment.topCenter,
                      children: [

                        // 説明文
                        Padding(
                          padding: const EdgeInsets.only(top: AppNum.cardPadding * 1.5, bottom: AppNum.cardPadding, left: AppNum.cardPadding, right: AppNum.cardPadding),
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppColor.subColor,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: AppNum.cardPadding * 2, bottom: AppNum.cardPadding, left: AppNum.cardPadding, right: AppNum.cardPadding),
                              child: Text(
                                  penalty.description
                              ),
                            ),
                          ),
                        ),

                        // 詳細ラベル
                        Container(
                          decoration: const BoxDecoration(
                            color: AppColor.mainColor,
                            shape: BoxShape.circle,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(AppNum.cardPadding * 0.8),
                            child: Text(
                              '詳細',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white
                              ),
                            ),
                          ),
                        )
                      ]
                    )
                  ]
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}