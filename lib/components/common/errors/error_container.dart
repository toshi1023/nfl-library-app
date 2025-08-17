import 'package:flutter/material.dart';
import 'package:nfl_library/configs/const.dart';

class ErrorContainer extends StatelessWidget {
  final String message;

  const ErrorContainer({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context)  {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error, size: 50, color: Colors.red),
          Padding(
            padding: const EdgeInsets.all(AppNum.md),
            child: Text('データの取得に失敗しました\n${message}',
            ),
          ),
        ],
      ),
    );
  }
}