class Position {
  final int id;
  final int abstractCategory;
  final int category;
  final String name;

  Position({
    required this.id,
    required this.abstractCategory,
    required this.category,
    required this.name
  });

  factory Position.fromJson(Map<String, dynamic> json) {
    return Position(
        id: json['id'],
        abstractCategory: json['abstract_category'],
        category: json['category'],
        name: json['name']
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['abstract_category'] = abstractCategory;
    data['category'] = category;
    data['name'] = name;
    return data;
  }
}