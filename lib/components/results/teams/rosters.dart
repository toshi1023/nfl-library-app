/// ロスターを表示するコンポーネント

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../configs/const.dart';

class Rosters extends StatelessWidget {
  @override
  const Rosters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double containerWidth;

    containerWidth = MediaQuery.of(context).size.width * 0.6;

    return SingleChildScrollView(
      child: Card(
          margin: const EdgeInsets.all(AppNum.cardMargin),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(AppNum.cardPadding * 0.7),
                child: Card(
                  color: AppColor.subColor,
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: Image.asset(
                          'images/favorite_teams/San_Francisco_49ers_logo_mini.png',
                          width: AppNum.dropDownListImageSize,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget> [
                          const Padding(
                            padding: EdgeInsets.all(AppNum.resultsNamePadding),
                            child: Text(
                              'QB  #10',
                              style: TextStyle(
                                fontSize: AppNum.resultsNameFontSize * 0.6
                              ),
                            ),
                          ),
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
                              child: const Text(
                                'Jimmy Garoppolo',
                                style: TextStyle(
                                  fontSize: AppNum.resultsNameFontSize
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
      ),
    );
  }
}