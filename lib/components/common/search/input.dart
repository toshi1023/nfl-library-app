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
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // TextFieldを可変幅にする(SizedBoxとElevatedButtonのスペースを除いた残りの幅を活用する)
        Expanded(
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(AppNum.md),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: TextField(
              // テキストフィールドは独自の内部状態をもつ為、コントローラーを介して管理が必要
              controller: _textController,
              decoration: InputDecoration(
                hintText: widget.label,
                hintStyle: const TextStyle(color: AppColor.gray),
                prefixIcon: const Icon(Icons.search, color: AppColor.gray),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: AppNum.sm), // 間隔を追加
        ElevatedButton(
          // 検索処理を実行
          onPressed: () {
            widget.callback(_textController.text ?? '');
            // TextFieldの内容をクリア
            _textController.clear();
          },
          style: ElevatedButton.styleFrom(
            primary: AppColor.mainColor, // ボタンの背景色
            onPrimary: Colors.white, // ボタンのテキスト色
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppNum.xl),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
          child: const Text('検索', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold))
        )
      ],
    );
  }
}