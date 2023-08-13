import 'package:nfl_library/domain/team.dart';
import 'package:nfl_library/repositories/search_repository_interface.dart';

class SearchController {
  final SearchRepositoryInterface _repository;

  SearchController(this._repository);

  /// 検索用のチーム情報を取得
  Future<List<Team>> fetchTeamList() async {
    return _repository.getSearchTeamList();
  }
}