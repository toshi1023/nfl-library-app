/// 反則検索の結果を表示する画面

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nfl_library/components/common/app_bar/app_main_bar.dart';
import '../../../components/results/rules/penalties.dart';
import '../../../components/common/bottom_bar/bottom_nav_bar.dart';
import '../../../configs/const.dart';
import '../../../domain/penalty.dart';

class RulesPage extends StatelessWidget {
  @override
  const RulesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      )
    ];

    return Penalties(penalties: penalties);
  }
}