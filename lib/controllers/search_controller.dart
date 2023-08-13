import 'package:nfl_library/domain/team.dart';
import 'package:nfl_library/repositories/search_repository_interface.dart';
import '../types/select_box_component_type.dart';

class SearchController {
  final SearchRepositoryInterface _repository;

  SearchController(this._repository);

  /// 検索用のチーム情報を取得
  Future<List<ISelectBox>> fetchTeamList() async {
    return _repository.getSearchTeamList();
  }

  /// 検索用のシーズン情報を取得
  Future<List<ISelectBox>> fetchSeasonList() async {
    return _repository.getSearchSeasonList();
  }
}