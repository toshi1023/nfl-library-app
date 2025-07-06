/// SelectBoxのパラメータ型定義
class ISelectBox {
  final int value;         // ドロップダウンリストのvalue
  final String text;       // ドロップダウンリストのtext
  String? shortText;  // ドロップダウンリストの表示テキスト
  String? imageFile;       // 画像のパス(アイコンを含める場合は指定する)

  ISelectBox(
      {
        required this.value,
        required this.text,
        this.shortText,
        this.imageFile
      }
  );
}