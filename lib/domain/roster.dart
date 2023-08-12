import './team.dart';
import './player.dart';
import './position.dart';
import './roster_starter.dart';

class Roster {
  final int id;
  final int season;
  final int teamId;
  final int playerId;
  final int positionId;
  final int number;
  int? rating;
  final int experience;
  final Team team;
  final Player player;
  final Position position;
  RosterStarter? rosterStarter;

  Roster({
    required this.id,
    required this.season,
    required this.teamId,
    required this.playerId,
    required this.positionId,
    required this.number,
    this.rating,
    required this.experience,
    required this.team,
    required this.player,
    required this.position,
    this.rosterStarter
  });

  factory Roster.fromJson(Map<String, dynamic> json) {
    return Roster(
        id: json['id'],
        season: json['season'],
        teamId: json['team_id'],
        playerId: json['player_id'],
        positionId: json['position_id'],
        number: json['number'],
        rating: json['rating'],
        experience: json['experience'],
        team: Team.fromJson(json['team']),
        player: Player.fromJson(json['player']),
        position: Position.fromJson(json['position']),
        rosterStarter: json['roster_starter'] != null ?
            RosterStarter.fromJson(json['roster_starter'])
          :
            null
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['season'] = season;
    data['team_id'] = teamId;
    data['player_id'] = playerId;
    data['position_id'] = positionId;
    data['number'] = number;
    data['rating'] = rating;
    data['experience'] = experience;
    data['team'] = team!.toJson();
    data['player'] = player!.toJson();
    data['position'] = position!.toJson();
    if(rosterStarter != null){
      data['roster_starter'] = rosterStarter!.toJson();
    }

    return data;
  }
}
