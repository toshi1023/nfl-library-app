/// 定数を管理するクラスファイル

import 'dart:ui';

// 色の設定を管理
class AppColor {
  static const Color mainColor = Color(0xff374A7B);
  static const Color backColor = Color(0xffEAEEF0);
  static const Color subColor = Color(0xffEFF3F5);
}

// 数値に関する設定を管理
class AppNum {
  // iPhone画面サイズ
  static const double iphoneHeight8 = 667.0;
  static const double iphoneWidth8 = 375.0;
  // 全体共通
  static const double cardMargin = 20.0;
  static const double cardPadding = 20.0;
  static const double cardWidth = 0.85;
  static const double subtitle = 6.0;
  static const double appBarLogo = 38.0;
  static const double tabFont = 20.0;               // タブの文字サイズ
  static const double formLabelFontSize = 15.0;     // ラベルの文字サイズ
  static const double formWidth = 25.0;             // フォームのパディング横サイズ
  static const double formHeight = 20.0;            // フォームのパディング縦サイズ
  static const double formButtonTop = 10.0;         // フォームのボタンの上余白
  static const double formButtonBottom = 20.0;      // フォームのボタンの下余白
  static const double cardTitleSize = 17.0;
  static const double dropDownListImageSize = 30.0;
  static const double buttonPadding = 50.0;

  // menue系列用定数
  static const double menuFontSize = 17.0;
  static const double lockIconSize = 70.0;
  static const double logoImageSize = 70.0;

  // SearchTopPageのコンポーネント用定数
  static const double searchPaddingForm = 20.0;

  // SettingsPageのコンポーネント用定数
  static const double settingMainFontSize = 15.0;
  static const double settingLabelWidth = 150.0;
  static const double settingPaddingForm = 20.0;

  // results系列用定数
  static const double resultsNameFontSize = 18.0;
  static const double resultsNamePadding = 3.0;
}

// タイトルを管理
class AppTitleWord {
  static const String menuTitleTop = '検索TOP';
  static const String menuTitleAccountEdit = 'アカウント編集';
  static const String menuTitleSetting = '設定';
}

// imagesを管理
class AppImages {
  static const String nflLogoImage = 'images/nfl_logo/nfl_logo_resize.jpg';
}