/// Penaltiesコンポーネントで使用する型定義
class Penalty {
  Penalty(
    this.id,
    this.englishName,
    this.japaneseName,
    this.description,
    this.statusType,
    this.yardInfo,
    this.lossOfDownFlg,
    this.afFlg,
    this.clockFlg,
    this.exitFlg
  );

  int id;
  String englishName;
  String japaneseName;
  String description;
  int statusType;
  int yardInfo;
  bool lossOfDownFlg;
  bool afFlg;
  bool clockFlg;
  bool exitFlg;
}