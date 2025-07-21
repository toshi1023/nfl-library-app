import 'package:flutter/material.dart';
import 'package:nfl_library/configs/const.dart';

class KeywordTag extends StatelessWidget {
  const KeywordTag({
    Key? key,
    required this.text,
    required this.onTap
  }) : super(key: key);

  final String text;
  final void Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: Chip(
        label: Text(
          text,
          style: const TextStyle(
            color: AppColor.darkGray,
            fontWeight: FontWeight.w600,
          ),
        ),
        onDeleted: () {
          onTap(text);
        },
        backgroundColor: Colors.grey[200],
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppNum.md),
        ),
      ),
    );
  }
}