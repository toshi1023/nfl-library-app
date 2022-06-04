import 'package:flutter/material.dart';
import 'package:nfl_library/components/search_top/search_top.dart';
import 'package:nfl_library/components/Menus/logged_in_menu.dart';
import 'package:nfl_library/components/Menus/not_logged_in_menu.dart';
import 'package:nfl_library/configs/const.dart';
import 'common/app_bar/app_main_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  // riverpodのproviderを使用
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SearchTop(),
      routes: <String, WidgetBuilder> {
        '/home': (BuildContext context) => const SearchTop(),
        '/logged_in_menu': (BuildContext context) => const NotLoggedInMenu(),
      },
    );
  }
}
