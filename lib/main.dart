import 'package:flutter/material.dart';
import 'package:nfl_library/pages/accounts/account_register_page.dart';
import 'package:nfl_library/pages/accounts/login_page.dart';
import 'package:nfl_library/pages/search/search_top_page.dart';
import 'package:nfl_library/pages/menus/logged_in_menu_page.dart';
import 'package:nfl_library/pages/menus/not_logged_in_menu_page.dart';
import 'package:nfl_library/pages/results/teams/teams_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nfl_library/pages/settings/settings_page.dart';

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
        '/account_register': (BuildContext context) => const AccountRegisterPage(),
        '/settings': (BuildContext context) => const SettingsPage(),
        '/results': (BuildContext context) => const TeamsPage(),
      },
    );
  }
}
