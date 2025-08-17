import 'package:flutter/material.dart';

class CommonFunctions {
  /// スナックバーを表示する
  /// Parameters: 
  /// * [context] - BuildContext
  /// * [message] - 表示するメッセージ
  /// 
  /// Returns:
  /// void - スナックバーを表示するだけで、戻り値はない
  static void showErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: '閉じる',
          textColor: Colors.white,
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }
}