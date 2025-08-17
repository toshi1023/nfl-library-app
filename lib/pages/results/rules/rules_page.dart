/// 反則検索の結果を表示する画面

import 'package:flutter/material.dart';
import '../../../components/results/rules/penalties.dart';
import '../../../configs/const.dart';
import '../../../domain/penalty.dart';
import '../../../components/common/search/select_box.dart';
import '../../../types/select_box_component_type.dart';
import '../../../utils/app_dependencies.dart';

class RulesPage extends StatelessWidget {
  @override
  const RulesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final List<Penalty> penalties = [
      Penalty(
        1,
        'Illegal Use Of Hand', '不正な手の使用',
        '相手選手を対するに当たり、手や腕の使い方のルールが決まっており、それに反する行為をすること。攻守共通してフェイスマスクを押す行為も含まれるが、ボールキャリアーに限り対象外となる。',
        0, 10, false, false, false, false
      ),
      Penalty(
        2,
        'False Start', 'フォルス・スタート',
        'ボールがスナップされる前に、攻撃側の選手が攻撃と勘違いされるような動きをすること。',
        1, 5, false, false, false, false
      ),
      Penalty(
        3,
        'Illegal Formation', '不正なフォーメーション',
        '攻撃側はスナップするとき、特定の位置に選手がいる必要があったり、逆にいてはならなかったり、フォーメーションに関するルールがある。このルールに反するとイリーガル・フォーメーション。'
        + '具体的には次の3点が当てはまる。'
        + '(1) スクリメージラインから1ヤード以内の選手（ライン上の選手）が7人以上いること。'
        + '(2) NFLでは、ラインの内側が無資格番号(50-79)の選手であること。'
        + '(3) NFLでは、ラインの両端やバックが有資格番号(1-49、80-89)の選手であること。',
        1, 5, false, false, false, false
      ),
      Penalty(
        4,
        'Encroachment', 'エンクローチメント',
        'スナップする前に守備選手が、ニュートラルゾーンを越えて攻撃選手に接触すること。',
        2, 5, false, false, false, false
      ),
      Penalty(
        5,
        'Holding', 'ホールディング',
        'ボールを持っていない選手に対して、タックルしたり、つかんだり、その他妨害したりすること。',
        2, 5, false, true, false, false
      ),
      Penalty(
        6,
        'Roughing the Kicker', 'ラフィング・ザ・キッカー',
        '明らかに蹴った後のキッカーやパンターに突き当たったり、投げつけたりの乱暴行為をすること。',
        3, 15, false, true, false, false
      ),
      Penalty(
          7,
          'Roughing the Kicker', 'ラフィング・ザ・キッカー',
          '明らかに蹴った後のキッカーやパンターに突き当たったり、投げつけたりの乱暴行為をすること。',
          3, 15, false, true, false, false
      ),
      Penalty(
          8,
          'Roughing the Kicker', 'ラフィング・ザ・キッカー',
          '明らかに蹴った後のキッカーやパンターに突き当たったり、投げつけたりの乱暴行為をすること。',
          3, 15, false, true, false, false
      )
    ];

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
    ISelectBox<int> _status;
    ISelectBox<int> _yard;

    /// 選択ステータスの更新処理
    void callbackChangeStatus(ISelectBox<int> value) {
      _status = value;
      print(_status);
    }
    /// 選択罰則ヤードの更新処理
    void callbackChangeYard(ISelectBox<int> value) {
      _yard = value;
      print(_yard);
    }

    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(AppNum.sm),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: SingleChildScrollView(
            // 横スクロールを可能にする
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                // 種別のメニューリスト
                FutureBuilder<List<ISelectBox<int>>>(
                    future: AppDependencies.searchController.fetchSeasonList(),
                    builder: (context, snapshot) {
                      if(snapshot.hasData) {
                        return SizedBox(
                            width: (screenWidth / 2) - (AppNum.sm / 2),
                            height: 35,
                            child: SelectBox<int>(selectList: odSelectList, title: '種別を選択してください', callback: callbackChangeStatus, backgroundColor: AppColor.lightGray, textColor: AppColor.gray)
                        );
                      } else {
                        return const CircularProgressIndicator();
                      }
                    }
                ),
                const SizedBox(width: AppNum.sm), // 間隔を追加
                // 罰則ヤードのメニューリスト
                FutureBuilder<List<ISelectBox<int>>>(
                    future: AppDependencies.searchController.fetchSeasonList(),
                    builder: (context, snapshot) {
                      if(snapshot.hasData) {
                        return SizedBox(
                            width: (screenWidth / 2) - (AppNum.sm / 2),
                            height: 35,
                            child: SelectBox<int>(selectList: yardSelectList, title: '罰則ヤードを選択してください', callback: callbackChangeYard, backgroundColor: AppColor.lightGray, textColor: AppColor.gray)
                        );
                      } else {
                        return const CircularProgressIndicator();
                      }
                    }
                ),
              ]
            ),
          ),
        ),
        Expanded(
            child: SingleChildScrollView(
                child: Center(
                    child: Penalties(penalties: penalties)
                )
            )
        ),
      ],
    );
  }
}