import 'package:flutter/material.dart';
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
      home: const MyHomePage(title: 'NFL Library'),
      routes: <String, WidgetBuilder> {
        '/home': (BuildContext context) => const MyHomePage(title: 'NFL Library'),
        '/logged_in_menu': (BuildContext context) => const NotLoggedInMenu(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppMainBar(),
      backgroundColor: AppColor.backColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
