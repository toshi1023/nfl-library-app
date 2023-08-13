/// SelectBoxのパラメータ型定義
class ISelectBox {
  final int value;      // ドロップダウンリストのvalue
  final String text;    // ドロップダウンリストのtext
  String? imageFile;    // 画像のパス(アイコンを含める場合は指定する)

  ISelectBox(
      {
        required this.value,
        required this.text,
        this.imageFile
      }
  );
}