/// AppBarの共通クラス

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../configs/const.dart';

class AppBothBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  const AppBothBar({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      automaticallyImplyLeading: false,  // 戻るボタンが自動で付くのを防ぐ
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
      actions: [
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
                size: 33,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed("/logged_in_menu");
              },
            )
        ),
      ],
      backgroundColor: AppColor.mainColor,
    );
  }
}