/// 攻守ステータスの検索セレクトボックス

import 'package:flutter/material.dart';

class OffenceDefenceKickSelectBox extends StatefulWidget {
  @override
  _OffenceDefenceKickSelectBoxState createState() => _OffenceDefenceKickSelectBoxState();
}

class _OffenceDefenceKickSelectBoxState extends State<OffenceDefenceKickSelectBox> {
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
        child: Center(child: Text('指定なし', textAlign: TextAlign.center, style: TextStyle(fontSize: 20.0))),
        value: 0,
      ))
      ..add(const DropdownMenuItem(
        child: Center(child: Text('オフェンス', textAlign: TextAlign.center, style: TextStyle(fontSize: 20.0))),
        value: 1,
      ))
      ..add(const DropdownMenuItem(
        child: Center(child: Text('ディフェンス', textAlign: TextAlign.center, style: TextStyle(fontSize: 20.0))),
        value: 2,
      ))
      ..add(const DropdownMenuItem(
        child: Center(child: Text('キック', textAlign: TextAlign.center, style: TextStyle(fontSize: 20.0))),
        value: 3,
      ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DropdownButton(
          items: _items,
          value: _selectItem,
          isExpanded: true,
          onChanged: (value) => {
            setState(() {
              _selectItem = value as int;
            }),
          },
        ),
      ),
    );
  }
}