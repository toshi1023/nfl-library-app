/// Rosters & Startersコンポーネントで使用する型定義
class Player {
  Player(
      this.imageFile,
      this.position,
      this.number,
      this.name,
      this.rating,
      this.height,
      this.weight,
      this.university,
      this.draftYear,
      this.draftCount,
      this.draftRanking
  );

  String imageFile;
  String position;
  int number;
  String name;
  int rating;
  int height;
  int weight;
  String university;
  int draftYear;
  int draftCount;
  int draftRanking;
}