import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../configs/const.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key,
    this.fabLocation = FloatingActionButtonLocation.endDocked,
    this.shape = const CircularNotchedRectangle()}
  ) : super(key: key);

  final FloatingActionButtonLocation fabLocation;
  final NotchedShape? shape;

  static final List<FloatingActionButtonLocation> centerLocations =
  <FloatingActionButtonLocation>[
    FloatingActionButtonLocation.centerDocked,
    FloatingActionButtonLocation.centerFloat,
  ];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: shape,
      color: Colors.white,
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Row(
          children: <Widget>[
            IconButton(
              color: AppColor.mainColor,
              tooltip: 'Open navigation menu',
              icon: const Icon(Icons.menu),
              onPressed: () {
                Navigator.of(context).pushNamed("/logged_in_menu");
              },
            ),
            if (centerLocations.contains(fabLocation)) const Spacer(),
            IconButton(
              color: AppColor.mainColor,
              tooltip: 'Search',
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              color: AppColor.mainColor,
              tooltip: 'Rules',
              icon: const Icon(IconData(0xe0ef, fontFamily: 'MaterialIcons')),
              onPressed: () {},
            ),
            IconButton(
              color: AppColor.mainColor,
              tooltip: 'Favorite',
              icon: const Icon(Icons.favorite),
              onPressed: () {},
            ),
            IconButton(
              color: AppColor.mainColor,
              tooltip: 'Setting',
              icon: const Icon(IconData(0xec76, fontFamily: 'MaterialIcons')),
              onPressed: () {
                // 設定がクリックされた時
                Navigator.of(context).pushNamed("/settings");
              },
            ),
          ],
        ),
      ),
    );
  }
}