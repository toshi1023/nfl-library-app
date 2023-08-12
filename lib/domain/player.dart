// class Player {
//   Player(
//       this.imageFile,
//       this.position,
//       this.number,
//       this.name,
//       this.rating,
//       this.height,
//       this.weight,
//       this.university,
//       this.draftYear,
//       this.draftCount,
//       this.draftRanking
//   );
//
//   String imageFile;
//   String position;
//   int number;
//   String name;
//   int rating;
//   int height;
//   int weight;
//   String university;
//   int draftYear;
//   int draftCount;
//   int draftRanking;
// }

class Player {
  final int id;
  final String firstname;
  final String lastname;
  final String birthday;
  final double height;
  final double weight;
  final String college;
  String? draftedTeam;
  String? draftedRound;
  String? draftedRank;
  int? draftedYear;
  String? imageFile;
  final String birthdayDate;
  final String imageUrl;

  Player(
    {
      required this.id,
      required this.firstname,
      required this.lastname,
      required this.birthday,
      required this.height,
      required this.weight,
      required this.college,
      this.draftedTeam,
      this.draftedRound,
      this.draftedRank,
      this.draftedYear,
      this.imageFile,
      required this.birthdayDate,
      required this.imageUrl
    }
  );

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
        id: json['id'],
        firstname: json['firstname'],
        lastname: json['lastname'],
        birthday: json['birthday'],
        height: json['height'].toDouble(),    // Laravel側で小数点を勝手に省略された場合、int型にキャストされるため
        weight: json['weight'].toDouble(),    // Laravel側で小数点を勝手に省略された場合、int型にキャストされるため
        college: json['college'],
        draftedTeam: json['drafted_team'],
        draftedRound: json['drafted_round'],
        draftedRank: json['drafted_rank'],
        draftedYear: json['drafted_year'],
        imageFile: json['image_file'],
        birthdayDate: json['birthday_date'],
        imageUrl: json['image_url']
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['birthday'] = birthday;
    data['height'] = height;
    data['weight'] = weight;
    data['college'] = college;
    data['drafted_team'] = draftedTeam;
    data['drafted_round'] = draftedRound;
    data['drafted_rank'] = draftedRank;
    data['drafted_year'] = draftedYear;
    data['image_file'] = imageFile;
    data['birthday_date'] = birthdayDate;
    data['image_url'] = imageUrl;
    return data;
  }
}