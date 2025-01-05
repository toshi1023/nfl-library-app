/// 設定のメニュー画面

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nfl_library/components/common/app_bar/app_back_bar.dart';
import 'package:nfl_library/components/common/bottom_bar/bottom_nav_bar.dart';
import '../../configs/const.dart';

class SettingsPage extends StatelessWidget {
  @override
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBackBar(),
        backgroundColor: AppColor.backColor,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(AppNum.cardPadding),
                  child: Card(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                              margin: const EdgeInsets.all(AppNum.labelMargin),
                              child: const Text(
                                'Teams設定',
                                style: TextStyle(fontSize: AppNum.cardTitleSize),
                              )
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(AppNum.settingPaddingForm),
                          child: Column(
                            children: const <Widget> [
                              SettingTabs(label: 'シーズン検索', type: 1),
                              SettingTabs(label: 'チーム検索', type: 2)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(AppNum.cardPadding),
                  child: Card(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                              margin: const EdgeInsets.all(AppNum.labelMargin),
                              child: const Text(
                                'Rules設定',
                                style: TextStyle(fontSize: AppNum.cardTitleSize),
                              )
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(AppNum.settingPaddingForm),
                          child: Column(
                            children: const <Widget> [
                              SettingTabs(label: '攻守ステータス検索', type: 3),
                              SettingTabs(label: '罰則ヤード検索', type: 4),
                              SettingTabs(label: '反則名の表記', type: 5),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

class SettingTabs extends StatefulWidget {

  //　変数定義すると、UIのところから"widget.変数名" で呼ぶことができる。
  final String label;
  final int type;

  const SettingTabs({
    Key? key,
    required this.label,
    required this.type,
  }) : super(key: key);

  // createState()　で"State"（Stateを継承したクラス）を返す
  @override
  _SettingTabsState createState() => _SettingTabsState();
}

class _SettingTabsState extends State<SettingTabs> {

  bool _active = true;
  bool _lang_active = false;

  // switchのステータス管理
  void _changeSwitch(bool e, int type) {
    type == 5 ? setState(() => _lang_active = e) : setState(() => _active = e);

    switch(type) {
      case 1:
        // シーズン検索の設定を保存
        break;
      case 2:
        // チーム検索の設定を保存
        break;
      case 3:
        // 攻守ステータス検索の設定を保存
        break;
      case 4:
        // 罰則ヤード検索の設定を保存
        break;
      case 5:
        // 反則名の表記設定を保存
        break;
    }
  }

  // switchの言語表記以外のステータスを返す
  Widget SettingStatus (bool active) {
    if(active) {
      return const Text(
        '表示する',
        style: TextStyle(
            color: Colors.cyan,
            fontSize: AppNum.settingMainFontSize
        ),
      );
    }
    return const Text(
      '非表示にする',
      style: TextStyle(
          color: Colors.red,
          fontSize: AppNum.settingMainFontSize
      ),
    );
  }

  // switchの言語表記設定のステータスを返す
  Widget SettingLanguageStatus (bool active) {
    if(active) {
      return const Text(
        '日本語表記',
        style: TextStyle(
            color: Colors.cyan,
            fontSize: AppNum.settingMainFontSize
        ),
      );
    }
    return const Text(
      '英語表記',
      style: TextStyle(
          color: Colors.red,
          fontSize: AppNum.settingMainFontSize
      ),
    );
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: <Widget>[
            SizedBox(
              width: AppNum.settingLabelWidth,
              child: Text(
                widget.label,
                style: const TextStyle(
                    fontSize: AppNum.settingMainFontSize
                ),
              ),
            ),
            Switch(
              value: widget.type == 5 ? _lang_active : _active,
              activeColor: Colors.indigo,
              activeTrackColor: Colors.blueAccent,
              inactiveThumbColor: Colors.black12,
              inactiveTrackColor: Colors.grey,
              onChanged: (event) => _changeSwitch(event, widget.type),
            )
          ],
        ),
        Row(
          children: [
            const SizedBox(
              width: AppNum.settingLabelWidth,
            ),
            widget.type == 5 ? SettingLanguageStatus(_lang_active) : SettingStatus(_active)
          ],
        ),
      ],
    );
  }
}