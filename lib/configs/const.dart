/// 定数を管理するクラスファイル

import 'dart:ui';

// 色の設定を管理
class AppColor {
  /// アプリのメインカラー
  static const Color mainColor = Color(0xff374A7B);
  /// アプリの背景カラー
  static const Color backColor = Color(0xffEAEEF0);
  /// アプリの第二カラー(リストの背景色等に使用)
  static const Color subColor = Color(0xffEFF3F5);
  /// アプリのアクティブカラー
  static const Color activeColor = Color(0xFFFFE0B2);
}

// 数値に関する設定を管理
class AppNum {
  // iPhone画面サイズ
  // static const double iphoneHeight8 = 667.0;
  // static const double iphoneWidth8 = 375.0;

  // 全体共通
  /// Cardのmargin設定(20.0)
  static const double cardMargin = 20.0;
  /// Cardのpadding設定(20.0
  static const double cardPadding = 20.0;
  /// Cardのwidthを固定値で設定する際の掛け率(ContainerやSizedBoxを使用する際に活用)
  static const double cardWidth = 0.85;
  /// ラベルに使用する文字のmargin設定
  static const double labelMargin = 6.0;
  /// AppMainBarに使用するNFLロゴのwidthサイズ
  static const double appBarLogo = 38.0;
  /// タブの文字サイズ
  static const double tabFont = 20.0;
  /// フォームラベルの文字サイズ
  static const double formLabelFontSize = 15.0;
  /// フォームのパディング横サイズ
  static const double formWidth = 25.0;
  /// フォームのパディング縦サイズ
  static const double formHeight = 20.0;
  /// フォームのボタンの上余白
  static const double formButtonTop = 10.0;
  /// フォームのボタンの下余白
  static const double formButtonBottom = 20.0;
  /// Cardのタイトルの文字サイズ
  static const double cardTitleSize = 17.0;
  /// select_boxコンポーネントに使用する画像のサイズ
  static const double dropDownListImageSize = 30.0;
  /// ボタンのサイズ調整として使用するpaddingの設定値
  static const double buttonPadding = 50.0;

  // AppBar用の定数
  static const double appTabBarHeight = 100.0;

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
  /// 18.0
  static const double resultsNameFontSize = 18.0;
  /// 3.0
  static const double resultsNamePadding = 3.0;
  /// 8.0
  static const double resultsChipFontSize = 8.0;
  /// 3.0
  static const double resultsChipPadding = 3.0;

  // select box用定数
  static const double selectboxFontSize = 17.0;

  // 共通サイズ
  /// 4.0
  static const double xs = 4.0;
  /// 8.0
  static const double sm = 8.0;
  /// 16.0
  static const double md = 16.0;
  /// 24.0
  static const double lg = 24.0;
  /// 32.0
  static const double xl = 32.0;
}

// imagesを管理
class AppImages {
  /// AppMainBarに使用するNFLロゴのイメージパス
  static const String nflLogoImage = 'images/nfl_logo/nfl_logo_resize.jpg';
}