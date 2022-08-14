/// 罰則ヤードの検索セレクトボックス

import 'package:flutter/material.dart';

import '../../../configs/const.dart';

class PenaltyYardSelectBox extends StatefulWidget {
  @override
  _PenaltyYardSelectBoxState createState() => _PenaltyYardSelectBoxState();
}

class _PenaltyYardSelectBoxState extends State<PenaltyYardSelectBox> {
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
      ..add(const DropdownMenuItem(
        value: 0,
        child: Center(child: Text('指定なし', textAlign: TextAlign.center, style: TextStyle(fontSize: AppNum.selectboxFontSize))),
      ))
      ..add(const DropdownMenuItem(
        value: 1,
        child: Center(child: Text('5ヤード', textAlign: TextAlign.center, style: TextStyle(fontSize: AppNum.selectboxFontSize))),
      ))
      ..add(const DropdownMenuItem(
        value: 2,
        child: Center(child: Text('10ヤード', textAlign: TextAlign.center, style: TextStyle(fontSize: AppNum.selectboxFontSize))),
      ))
      ..add(const DropdownMenuItem(
        value: 3,
        child: Center(child: Text('15ヤード', textAlign: TextAlign.center, style: TextStyle(fontSize: AppNum.selectboxFontSize))),
      ))
      ..add(const DropdownMenuItem(
        value: 4,
        child: Center(child: Text('15ヤード以上', textAlign: TextAlign.center, style: TextStyle(fontSize: AppNum.selectboxFontSize))),
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