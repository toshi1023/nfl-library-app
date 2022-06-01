/// AppBarの共通クラス(戻る機能付き)

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../configs/const.dart';

class AppBackBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  const AppBackBar({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.mainColor,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 35
          ),
          onPressed: () => Navigator.pop(context),
        )
      ),
    );
  }
}