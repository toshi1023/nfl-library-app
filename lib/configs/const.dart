/// 定数を管理するクラスファイル

import 'dart:ui';

// 色の設定を管理
class AppColor {
  static const Color mainColor = Color(0xff374A7B);
  static const Color backColor = Color(0xffEAEEF0);
}

// 数値に関する設定を管理
class AppNum {
  // iPhone画面サイズ
  static const double iphoneHeight8 = 667.0;
  static const double iphoneWidth8 = 375.0;
  // 全体共通
  static const double cardMargin = 20.0;
  static const double cardWidth = 0.85;
  static const double subtitle = 6.0;
  static const double appBarLogo = 38.0;
  static const double lockIcon = 100.0;
  static const double tabFont = 20.0;
  static const double formLabel = 15.0;

  // TopSearchのコンポーネント用定数
  static const double searchCard = 40.0;
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