/// 検索の入力欄

import 'package:flutter/material.dart';

import '../../../configs/const.dart';
import '../../../types/select_box_component_type.dart';
import '../../../configs/const.dart';

class Input extends StatefulWidget {
  const Input({
    Key? key,
    this.label = '検索',
    required this.callback
  }) : super(key: key);
  /// 検索欄のラベル
  final String label;
  /// 検索を実行するコールバック関数
  final void Function(String) callback;

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  String? _value = null;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(AppNum.md),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: TextField(
        onChanged: (value) {
          setState(() {
            _value = value;
            // 検索処理を実行
            widget.callback(value);
          });
        },
        decoration: InputDecoration(
          hintText: widget.label,
          hintStyle: const TextStyle(color: AppColor.lightGray),
          prefixIcon: const Icon(Icons.search, color: AppColor.lightGray),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
        ),
      ),
    );
  }
}