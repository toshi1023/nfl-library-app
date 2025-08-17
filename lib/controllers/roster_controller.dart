import 'package:nfl_library/domain/roster.dart';
import '../repositories/roster/roster_repository_interface.dart';
import 'package:nfl_library/types/api_response.dart';

class RosterController {
  final RosterRepositoryInterface _repository;

  RosterController(this._repository);

  /// 選手情報を取得
  Future<ApiResponse<List<Roster>>> fetchRosterList(int season, int teamId) async {
    return _repository.getRosterList(season, teamId);
  }
}