/// チームの検索セレクトボックス

import 'package:flutter/material.dart';
import 'package:nfl_library/configs/const.dart';

class TeamSelectBox extends StatefulWidget {
  final bool pageType;

  const TeamSelectBox({
    Key? key,
    required this.pageType,
  }) : super(key: key);

  @override
  _TeamSelectBoxState createState() => _TeamSelectBoxState();
}

class _TeamSelectBoxState extends State<TeamSelectBox> {
  // growable: trueにするとリストの拡張が可能になる
  final List<DropdownMenuItem<int>> _items = List.empty(growable: true);
  int? _selectItem = 0;

  @override
  void initState() {
    super.initState();
    setItems();
    _selectItem = _items[0].value;
  }

  void setItems() {
    // チーム名のフォントサイズを設定
    final double fontSize = widget.pageType ? 17.0 : 20.0;

    _items
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
              Text(
                'Buffalo Bills',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: fontSize)
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
                Text(
                  'Miami Dolphins',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: fontSize)
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
                Text(
                  'New England Patriots',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: fontSize)
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
                Text(
                  'New York Jets',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: fontSize)
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
                Text(
                    'Washington Commanders',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: fontSize)
                ),
              ],
            )
        ),
      ));
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
          items: _items,
          value: _selectItem,
          isExpanded: true,
          onChanged: (value) => {
            setState(() {
              _selectItem = value as int;
            }),
          },
        );
  }
}