/// 反則一覧コンポーネント

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../configs/const.dart';
import '../../../domain/penalty.dart';
import '../../common/search_selectbox/select_box.dart';
import '../../../types/select_box_component_type.dart';

class Penalties extends StatelessWidget {
  // 反則一覧のデータ格納用変数
  final List<Penalty> penalties;

  @override
  const Penalties({Key? key, required this.penalties}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double containerWidth;
    // 検索用ドロップダウンリストのレイアウト設定
    const double selectBoxHeight = AppNum.cardPadding / 5;
    final yardSelectList = [
      ISelectBox(value: 0, text: '指定なし'),
      ISelectBox(value: 1, text: '5ヤード'),
      ISelectBox(value: 2, text: '10ヤード'),
      ISelectBox(value: 3, text: '15ヤード'),
      ISelectBox(value: 4, text: '15ヤード以上'),
    ];
    final odSelectList = [
      ISelectBox(value: 0, text: '指定なし'),
      ISelectBox(value: 1, text: 'オフェンス'),
      ISelectBox(value: 2, text: 'ディフェンス'),
      ISelectBox(value: 3, text: 'キック'),
    ];
    int _status = 0;
    int _yard = 0;

    containerWidth = MediaQuery.of(context).size.width * 0.6;

    /// 選択ステータスの更新処理
    void callbackChangeStatus(int value) {
      _status = value;
      print(_status);
    }
    /// 選択罰則ヤードの更新処理
    void callbackChangeYard(int value) {
      _yard = value;
      print(_yard);
    }

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
                  // 攻守キックのメニューリスト
                  SelectBox(selectList: odSelectList, title: 'Select Status', callback: callbackChangeStatus),

                  // 反則のメニューリスト
                  SelectBox(selectList: yardSelectList, title: 'Select Penalty', callback: callbackChangeYard),
                ],
              ),
            ),
            Card(
              margin: const EdgeInsets.all(AppNum.cardMargin),
              child: Column(
                children: [
                  const Padding(
                    padding: const EdgeInsets.only(top: AppNum.cardPadding),
                    child: Center(
                      child: Text(
                        'Penalty',
                        style: TextStyle(
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

                    itemCount: penalties.length,
                    itemBuilder: (context, index) {
                      final data = penalties[index];
                      return Padding(
                        padding: index == (penalties.length - 1) ?
                        // 最後だけ
                        const EdgeInsets.all(AppNum.cardPadding * 0.7)
                            :
                        // 最初から最後の1つ手前まで
                        const EdgeInsets.only(top: AppNum.cardPadding * 0.7, left: AppNum.cardPadding * 0.7, right: AppNum.cardPadding * 0.7),
                        child: InkWell(
                          onTap: () {
                            // 反則詳細ページへ遷移
                            Navigator.of(context).pushNamed("/rule_detail", arguments: data);
                          },
                          child: Card(
                            color: AppColor.subColor,
                            child: Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                                  decoration: const BoxDecoration(
                                    color: AppColor.mainColor,
                                    shape: BoxShape.circle,
                                  ),
                                  width: 60,
                                  height: 35,
                                  child: Center(
                                    child: Text(
                                      data.statusType == 0 ? '共通' :
                                      data.statusType == 1 ? '攻撃' :
                                      data.statusType == 2 ? '守備' :
                                      'キック',
                                      style: const TextStyle(
                                        fontSize: AppNum.resultsNameFontSize * 0.6,
                                        color: Colors.white
                                      ),
                                    ),
                                  )
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget> [
                                    Padding(
                                      padding: const EdgeInsets.all(AppNum.resultsNamePadding),
                                      child: Container(
                                        width: containerWidth,
                                        decoration: const BoxDecoration(
                                            border: Border(bottom: BorderSide(
                                              color: Colors.black,
                                              width: 0.8,
                                            ))
                                        ),
                                        child: Text(
                                          data.englishName,
                                          style: const TextStyle(
                                              fontSize: AppNum.resultsNameFontSize * 0.8
                                          ),
                                        ),
                                      ),
                                    ),

                                    // 反則のフラグ用チップ
                                    Row(
                                      children: [
                                        // ダウン喪失のフラグ
                                        if(data.lossOfDownFlg) Container(
                                          margin: const EdgeInsets.only(left: AppNum.resultsChipPadding),
                                          decoration: BoxDecoration(
                                              color: Colors.blueAccent,
                                              borderRadius: BorderRadius.circular(15)
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.all(AppNum.resultsChipPadding),
                                            child: Text(
                                              'ダウン喪失',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: AppNum.resultsChipFontSize
                                              ),
                                            ),
                                          ),
                                        ),

                                        // オートマティックファーストダウンのフラグ
                                        if(data.afFlg) Container(
                                          margin: const EdgeInsets.only(left: AppNum.resultsChipPadding),
                                          decoration: BoxDecoration(
                                              color: Colors.blueAccent,
                                              borderRadius: BorderRadius.circular(15)
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.all(AppNum.resultsChipPadding),
                                            child: Text(
                                              '1stDown',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: AppNum.resultsChipFontSize
                                              ),
                                            ),
                                          ),
                                        ),

                                        // ゲームクロック減算のフラグ
                                        if(data.clockFlg) Container(
                                          margin: const EdgeInsets.only(left: AppNum.resultsChipPadding),
                                          decoration: BoxDecoration(
                                              color: Colors.blueAccent,
                                              borderRadius: BorderRadius.circular(15)
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.all(AppNum.resultsChipPadding),
                                            child: Text(
                                              '時間減算',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: AppNum.resultsChipFontSize
                                              ),
                                            ),
                                          ),
                                        ),

                                        // 退場のフラグ
                                        if(data.exitFlg) Container(
                                          margin: const EdgeInsets.only(left: AppNum.resultsChipPadding),
                                          decoration: BoxDecoration(
                                              color: Colors.blueAccent,
                                              borderRadius: BorderRadius.circular(15)
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.all(AppNum.resultsChipPadding),
                                            child: Text(
                                              '退場',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: AppNum.resultsChipFontSize
                                              ),
                                            ),
                                          ),
                                        ),

                                        // ヤード情報
                                        Container(
                                          margin: const EdgeInsets.only(left: AppNum.resultsChipPadding),
                                          decoration: BoxDecoration(
                                            color: Colors.blueAccent,
                                            borderRadius: BorderRadius.circular(15)
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child: Text(
                                              '${data.yardInfo}ヤード',
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: AppNum.resultsChipFontSize
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
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