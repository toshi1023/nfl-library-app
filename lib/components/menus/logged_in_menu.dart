/// ログイン済みの場合のメニュー画面

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nfl_library/common/app_bar/app_back_bar.dart';
import '../../configs/const.dart';

class LoggedInMenu extends StatelessWidget {
  @override
  const LoggedInMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // お気に入りチームのcardのheightを定義
    final double cardFavoriteHeight = MediaQuery.of(context).size.height * 0.25;
    // メニューのcardのheightを定義
    final double cardMenuHeight = MediaQuery.of(context).size.height * 0.5;
    // cardのwidthを定義
    final double cardWidth = MediaQuery.of(context).size.width * AppNum.cardWidth;
    // 年代表記のpadding設定
    const double yearPadding = 3.0;
    // メニュー一覧を格納
    const Map<String, int> menuList = <String, int>{
      AppTitleWord.menuTitleTop: 0xf013d,
      AppTitleWord.menuTitleAccountEdit: 0xe498,
      AppTitleWord.menuTitleSetting: 0xec76
    };

    return Scaffold(
        appBar: const AppBackBar(),
        backgroundColor: AppColor.backColor,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget> [
              Center(
                child: Card(
                  margin: const EdgeInsets.all(AppNum.cardMargin),
                  child: SizedBox(
                    width: cardWidth,
                    height: cardFavoriteHeight,
                    child: Row(
                      children: <Widget> [
                        Expanded(
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                margin: const EdgeInsets.all(AppNum.subtitle),
                                child: const Text('お気に入りチーム')
                              ),
                            ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            decoration: const BoxDecoration(color: AppColor.mainColor),
                            margin: const EdgeInsets.all(AppNum.subtitle),
                            padding: const EdgeInsets.all(yearPadding),
                            child: const Text(
                              '2013年',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                child: Card(
                  margin: const EdgeInsets.all(AppNum.cardMargin),
                  child: Column(
                    children: [
                      SizedBox(
                        width: cardWidth,
                        height: cardMenuHeight,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                  margin: const EdgeInsets.all(AppNum.subtitle),
                                  child: const Text('メニュー')
                              ),
                            ),

                            // 上下中央に配置できないため、きく
                            Expanded(
                              child: ListView.builder(
                                  padding: const EdgeInsets.only(left: 30, right: 30),
                                  itemCount: menuList.length,
                                  itemBuilder: (context, int index) {
                                    String key = menuList.keys.elementAt(index);
                                    return Container(
                                      decoration: const BoxDecoration(
                                          border: Border(bottom: BorderSide(
                                            color: Colors.black,
                                            width: 0.8,
                                          ))
                                      ),
                                      child: ListTile(
                                        leading: Icon(
                                            IconData(menuList[key]!, fontFamily: 'MaterialIcons')
                                        ),
                                        title: Text(
                                          key,
                                          style: const TextStyle(
                                            fontSize: 20
                                          )
                                        ),
                                      ),
                                    );
                                  }
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}

// class MenuList extends StatefulWidget {
//   const MenuList({Key? key}) : super(key: key);
//
//   @override
//   State<MenuList> createState() => _MenuListState();
// }
//
// class _MenuListState extends State<MenuList> {
//   // メニュー一覧を格納
//   final List<String> menuList = <String>[
//     AppTitleWord.menuTitleTop,
//     AppTitleWord.menuTitleAccountEdit,
//     AppTitleWord.menuTitleSetting
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return LimitedBox(
//         maxHeight: ,
//         child: ListView.builder(
//           padding: const EdgeInsets.all(8),
//           itemCount: menuList.length,
//           itemBuilder: (context, int index) {
//             return SizedBox(
//               height: 50,
//               child: Center(child: Text(menuList[index])),
//             );
//           }
//       )
//     );
//   }
// }