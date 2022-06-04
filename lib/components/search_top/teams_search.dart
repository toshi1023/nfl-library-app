import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nfl_library/common/app_bar/app_main_bar.dart';
import '../../configs/const.dart';

class TeamsSearch extends StatelessWidget {
  @override
  const TeamsSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // メニューのcardのheightを定義
    final double cardSearchHeight = MediaQuery.of(context).size.height * 0.6;
    // cardのwidthを定義
    final double cardWidth = MediaQuery.of(context).size.width * AppNum.cardWidth;

    return Scaffold(
        backgroundColor: AppColor.backColor,
        body: Container(
            alignment: Alignment.center,
            child: Card (
                child: SizedBox (
                  width: cardWidth,
                  height: cardSearchHeight,
                )
            ),
        )
    );
  }
}