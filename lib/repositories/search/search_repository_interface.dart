// Fake Server
import '../../../domain/team.dart';
import '../../types/select_box_component_type.dart';

abstract class SearchRepositoryInterface {
  /// 検索条件用のチーム情報を取得するAPIを実行
  Future<List<ISelectBox<int>>> getSearchTeamList();

  /// 検索条件用のシーズン情報を取得するAPIを実行
  Future<List<ISelectBox<int>>> getSearchSeasonList();
}
