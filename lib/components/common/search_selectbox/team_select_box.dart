/// チームの検索セレクトボックス

import 'package:flutter/material.dart';
import 'package:nfl_library/configs/const.dart';

class TeamSelectBox extends StatefulWidget {
  const TeamSelectBox({Key? key}) : super(key: key);

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