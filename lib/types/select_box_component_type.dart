/// SelectBoxのパラメータ型定義
/// T: valueの型を定義
class ISelectBox<T> {
  final T value;         // ドロップダウンリストのvalue
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