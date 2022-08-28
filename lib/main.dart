import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:nfl_library/pages/accounts/account_register_page.dart';
import 'package:nfl_library/pages/accounts/account_edit_page.dart';
import 'package:nfl_library/pages/accounts/password_reset_page.dart';
import 'package:nfl_library/pages/accounts/login_page.dart';
import 'package:nfl_library/pages/search/search_top_page.dart';
import 'package:nfl_library/pages/menus/logged_in_menu_page.dart';
import 'package:nfl_library/pages/menus/not_logged_in_menu_page.dart';
import 'package:nfl_library/pages/results/teams/teams_page.dart';
import 'package:nfl_library/pages/settings/settings_page.dart';
import 'package:nfl_library/pages/results/teams/player_detail_page.dart';
import 'package:nfl_library/pages/results/rules/rules_page.dart';
import 'package:nfl_library/pages/results/rules/rule_detail_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  await dotenv.load(fileName: '.env');
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
        '/logged_in_menu': (BuildContext context) => const LoggedInMenuPage(),
        '/login': (BuildContext context) => const LoginPage(),
        '/account_register': (BuildContext context) => const AccountRegisterPage(),
        '/account_edit': (BuildContext context) => const AccountEditPage(),
        '/password_reset': (BuildContext context) => const PasswordResetPage(),
        '/settings': (BuildContext context) => const SettingsPage(),
        '/results': (BuildContext context) => const TeamsPage(),
        '/player_detail': (BuildContext context) => const PlayerDetailPage(),
        '/rules': (BuildContext context) => const RulesPage(),
        '/rule_detail': (BuildContext context) => const RuleDetailPage()
      },
    );
  }
}
