class RosterStarter {
  final int id;
  final int season;
  final int odflg;
  final int rosterId;

  RosterStarter({
    required this.id,
    required this.season,
    required this.odflg,
    required this.rosterId
  });

  factory RosterStarter.fromJson(Map<String, dynamic> json) {
    return RosterStarter(
        id: json['id'],
        season: json['season'],
        odflg: json['odflg'],
        rosterId: json['roster_id']
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['season'] = season;
    data['odflg'] = odflg;
    data['roster_id'] = rosterId;
    return data;
  }
}