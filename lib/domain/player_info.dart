import './roster.dart';

class PlayerInfo {
  final List<Roster> rosters;

  PlayerInfo({
    required this.rosters,
  });

  factory PlayerInfo.fromJson(Map<String, dynamic> json) {
    return PlayerInfo(
        rosters: json['rosters'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rosters'] = rosters;
    return data;
  }
}