import 'package:flutter/material.dart';
import 'package:nfl_library/components/account/login_page.dart';
import 'package:nfl_library/components/search_top/search_top_page.dart';
import 'package:nfl_library/components/menus/logged_in_menu_page.dart';
import 'package:nfl_library/components/menus/not_logged_in_menu_page.dart';
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
      home: const SearchTopPage(),
      routes: <String, WidgetBuilder> {
        '/home': (BuildContext context) => const SearchTopPage(),
        '/logged_in_menu': (BuildContext context) => const NotLoggedInMenuPage(),
        '/login': (BuildContext context) => const LoginPage(),
      },
    );
  }
}
