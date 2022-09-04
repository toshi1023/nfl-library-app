/// チーム検索ページ

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../configs/const.dart';

class TeamsSearch extends StatefulWidget {
  const TeamsSearch({Key? key}) : super(key: key);

  @override
  _TeamsSearchState createState() => _TeamsSearchState();
}

class _TeamsSearchState extends State<TeamsSearch> {
  @override
  // growable: trueにするとリストの拡張が可能になる
  final List<DropdownMenuItem<int>> _teamitems = List.empty(growable: true);
  @override
  final List<DropdownMenuItem<int>> _yearitems = List.empty(growable: true);
  int? _selectTeamItem = 0;
  int? _selectYearItem = 0;

  @override
  void initState() {
    super.initState();
    setTeamItems();
    _selectTeamItem = _teamitems[0].value;
    setYearItems();
    _selectYearItem = _yearitems[0].value;
  }

  // チームのデータをセット
  void setTeamItems() {
    _teamitems
      ..add(DropdownMenuItem(
        value: 1,
        child: Center(
            child: Row(
              children: <Widget> [
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Image.asset(
                    'images/favorite_teams/San_Francisco_49ers_logo_mini.png',
                    width: AppNum.dropDownListImageSize,
                  ),
                ),
                const Text(
                    'Buffalo Bills',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: AppNum.selectboxFontSize)
                ),
              ],
            )
        ),
      ))
      ..add(DropdownMenuItem(
        value: 2,
        child: Center(
            child: Row(
              children: <Widget> [
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Image.asset(
                    'images/favorite_teams/San_Francisco_49ers_logo_mini.png',
                    width: AppNum.dropDownListImageSize,
                  ),
                ),
                const Text(
                    'Miami Dolphins',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: AppNum.selectboxFontSize)
                ),
              ],
            )
        ),
      ))
      ..add(DropdownMenuItem(
        value: 3,
        child: Center(
            child: Row(
              children: <Widget> [
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Image.asset(
                    'images/favorite_teams/San_Francisco_49ers_logo_mini.png',
                    width: AppNum.dropDownListImageSize,
                  ),
                ),
                const Text(
                    'New England Patriots',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: AppNum.selectboxFontSize)
                ),
              ],
            )
        ),
      ))
      ..add(DropdownMenuItem(
        value: 4,
        child: Center(
            child: Row(
              children: <Widget> [
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Image.asset(
                    'images/favorite_teams/San_Francisco_49ers_logo_mini.png',
                    width: AppNum.dropDownListImageSize,
                  ),
                ),
                const Text(
                    'New York Jets',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: AppNum.selectboxFontSize)
                ),
              ],
            )
        ),
      ))
      ..add(DropdownMenuItem(
        value: 5,
        child: Center(
            child: Row(
              children: <Widget> [
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Image.asset(
                    'images/favorite_teams/San_Francisco_49ers_logo_mini.png',
                    width: AppNum.dropDownListImageSize,
                  ),
                ),
                const Text(
                    'Washington Commanders',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: AppNum.selectboxFontSize)
                ),
              ],
            )
        ),
      ));
  }

  // 年代のデータをセット
  void setYearItems() {
    _yearitems
      ..add(const DropdownMenuItem(
        value: 2012,
        child: Center(child: Text('2012年', textAlign: TextAlign.center, style: TextStyle(fontSize: AppNum.selectboxFontSize))),
      ))
      ..add(const DropdownMenuItem(
        value: 2013,
        child: Center(child: Text('2013年', textAlign: TextAlign.center, style: TextStyle(fontSize: AppNum.selectboxFontSize))),
      ))
      ..add(const DropdownMenuItem(
        value: 2014,
        child: Center(child: Text('2014年', textAlign: TextAlign.center, style: TextStyle(fontSize: AppNum.selectboxFontSize))),
      ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.backColor,
        body: Center(
            // alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(AppNum.cardPadding),
                  child: Card (
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(AppNum.searchPaddingForm),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                      margin: const EdgeInsets.only(top: AppNum.labelMargin),
                                      child: const Text(
                                        '年代',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: AppNum.formLabelFontSize
                                        ),
                                      )
                                  ),
                                ),

                                // 年代のドロップダウンリスト
                                DropdownButton(
                                  items: _yearitems,
                                  value: _selectYearItem,
                                  isExpanded: true,
                                  onChanged: (value) => {
                                    setState(() {
                                      _selectYearItem = value as int;
                                    }),
                                  },
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(AppNum.searchPaddingForm),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                      margin: const EdgeInsets.only(top: AppNum.labelMargin),
                                      child: const Text(
                                        'チーム',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: AppNum.formLabelFontSize
                                        ),
                                      )
                                  ),
                                ),

                                // チームのドロップダウンリスト
                                DropdownButton(
                                  items: _teamitems,
                                  value: _selectTeamItem,
                                  isExpanded: true,
                                  onChanged: (value) => {
                                    setState(() {
                                      _selectTeamItem = value as int;
                                    }),
                                  },
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(AppNum.searchPaddingForm),
                            child: ElevatedButton(
                              onPressed: () {
                                // ロスターページへ遷移
                                Navigator.of(context).pushNamed("/results");
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.only(left: AppNum.buttonPadding, right: AppNum.buttonPadding),
                                primary: AppColor.mainColor, //ボタンの背景色
                                shape: const RoundedRectangleBorder(
                                  // ボタンの形に丸みをおびせる
                                  borderRadius: BorderRadius.all(Radius.circular(18.0)),
                                ),
                              ),
                              child: const Text(
                                '検索',
                                style: TextStyle(fontSize: 17),
                              ),
                            ),
                          )
                        ],
                      )
                  ),
                ),
              ],
            ),
        )
    );
  }
}