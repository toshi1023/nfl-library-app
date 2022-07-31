/// AppBarの共通クラス

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../configs/const.dart';

class AppMainBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  const AppMainBar(this.tabs, {Key? key}) : super(key: key);

  final List<Tab>? tabs;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      automaticallyImplyLeading: false,  // 戻るボタンが自動で付くのを防ぐ
      title: Column(
        children: [
          Image.asset(
            AppImages.nflLogoImage,
            width: AppNum.appBarLogo,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 2.0),
            child: Text('LIBRARY', style: TextStyle(
              fontSize: 14,
              fontFamily: 'Playfair_Display'
            )),
          ),
        ],
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
      bottom: tabs != null ? TabBar(
        indicatorColor: Colors.white,
        labelStyle: const TextStyle(
            fontSize: AppNum.tabFont,
            fontWeight: FontWeight.bold,
            fontFamily: 'Dancing_Script'
        ),
        tabs: tabs!,
      ) : null,
    );
  }
}