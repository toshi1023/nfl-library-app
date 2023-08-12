import 'package:nfl_library/domain/roster.dart';
import '../repositories/roster_repository.dart';
import '../repositories/roster_repository_interface.dart';

class RosterController {
  final RosterRepositoryInterface _repository;

  RosterController(this._repository);

  /// 選手情報を取得
  Future<List<Roster>> fetchRosterList() async {
    return _repository.getRosterList();
  }
}