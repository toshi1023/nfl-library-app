/// 選手の詳細情報を表示する画面

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nfl_library/components/common/app_bar/app_back_bar.dart';
import 'package:nfl_library/components/results/teams/rosters.dart';
import '../../../configs/const.dart';

class PlayerDetailPage extends StatelessWidget {
  @override
  const PlayerDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBackBar(),
      backgroundColor: AppColor.backColor,
      body: Column(
        children: [
          Image.asset(
            'images/logos/49ers_logo.jpg',
            fit: BoxFit.fill,        // widthを横幅いっぱいにしてもいい感じに調整してくれる
            width: double.infinity,
            // 色を半透明にする
            color: const Color.fromRGBO(255, 255, 255, 0.3),
            colorBlendMode: BlendMode.modulate,
          ),
        ],
      ),
    );
  }
}