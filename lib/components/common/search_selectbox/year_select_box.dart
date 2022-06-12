/// 年代の検索セレクトボックス

import 'package:flutter/material.dart';

class YearSelectBox extends StatefulWidget {
  @override
  _YearSelectBoxState createState() => _YearSelectBoxState();
}

class _YearSelectBoxState extends State<YearSelectBox> {
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
        child: Center(child: Text('2012', textAlign: TextAlign.center, style: TextStyle(fontSize: 20.0))),
        value: 2012,
      ))
      ..add(const DropdownMenuItem(
        child: Center(child: Text('2013', textAlign: TextAlign.center, style: TextStyle(fontSize: 20.0))),
        value: 2013,
      ))
      ..add(const DropdownMenuItem(
        child: Center(child: Text('2014', textAlign: TextAlign.center, style: TextStyle(fontSize: 20.0))),
        value: 2014,
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