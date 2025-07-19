import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../configs/const.dart';

class BottomNavBar extends StatefulWidget {
  final int? selectedIndex;
  final void Function(int index)? onTap;
  const BottomNavBar({Key? key, this.selectedIndex, this.onTap}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final FloatingActionButtonLocation fabLocation = FloatingActionButtonLocation.endDocked;
  final NotchedShape? shape = const CircularNotchedRectangle();

  static final List<FloatingActionButtonLocation> centerLocations =
  <FloatingActionButtonLocation>[
    FloatingActionButtonLocation.centerDocked,
    FloatingActionButtonLocation.centerFloat,
  ];

  int _selectedIndex = 0;

  // タップ時の処理
  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // ページ遷移
    if(index == 0) {
      // ロスターがクリックされた時
      Navigator.of(context).pushNamed("/home");
    } else if (index == 1) {
      // ルールがクリックされた時
      Navigator.of(context).pushNamed("/rules");
    } else if (index == 2) {
      // お気に入りがクリックされた時
      Navigator.of(context).pushNamed("/logged_in_menu");
    } else if (index == 3) {
      // 設定がクリックされた時
      Navigator.of(context).pushNamed("/settings");
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "Roster"),
        BottomNavigationBarItem(icon: Icon(IconData(0xe0ef, fontFamily: 'MaterialIcons')), label: "Rule"),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorite"),
        BottomNavigationBarItem(icon: Icon(IconData(0xec76, fontFamily: 'MaterialIcons')), label: "Setting"),
      ],
      currentIndex: widget.selectedIndex!,
      type: BottomNavigationBarType.fixed,    // これがないと４つ目のメニューを設定するとボトムナビが非表示になる
      onTap: widget.onTap!,
      selectedItemColor: AppColor.deepBlue,
    );
    // return BottomAppBar(
    //   shape: shape,
    //   color: Colors.white,
    //   child: IconTheme(
    //     data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
    //     child: Row(
    //       children: <Widget>[
    //         IconButton(
    //           color: AppColor.mainColor,
    //           tooltip: 'Open navigation menu',
    //           icon: const Icon(Icons.menu),
    //           onPressed: () {
    //             Navigator.of(context).pushNamed("/logged_in_menu");
    //           },
    //         ),
    //         if (centerLocations.contains(fabLocation)) const Spacer(),
    //         IconButton(
    //           color: AppColor.mainColor,
    //           tooltip: 'Search',
    //           icon: const Icon(Icons.search),
    //           onPressed: () {},
    //         ),
    //         IconButton(
    //           color: AppColor.mainColor,
    //           tooltip: 'Rules',
    //           icon: const Icon(IconData(0xe0ef, fontFamily: 'MaterialIcons')),
    //           onPressed: () {},
    //         ),
    //         IconButton(
    //           color: AppColor.mainColor,
    //           tooltip: 'Favorite',
    //           icon: const Icon(Icons.favorite),
    //           onPressed: () {},
    //         ),
    //         IconButton(
    //           color: AppColor.mainColor,
    //           tooltip: 'Setting',
    //           icon: const Icon(IconData(0xec76, fontFamily: 'MaterialIcons')),
    //           onPressed: () {
    //             // 設定がクリックされた時
    //             Navigator.of(context).pushNamed("/settings");
    //           },
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}