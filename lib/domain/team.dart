class Team {
  final int id;
  final String city;
  final String name;
  String? imageFile;
  String? backImageFile;

  Team({
    required this.id,
    required this.city,
    required this.name,
    this.imageFile,
    this.backImageFile
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
        id: json['id'],
        city: json['city'],
        name: json['name'],
        imageFile: json['image_file'],
        backImageFile: json['back_image_file']
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['city'] = city;
    data['name'] = name;
    data['image_file'] = imageFile;
    data['back_image_file'] = backImageFile;
    return data;
  }
}