// Fake Server
import '../../../domain/team.dart';

abstract class SearchRepositoryInterface {
  /// 検索条件用のチーム情報を取得するAPIを実行
  Future<List<Team>> getSearchTeamList();
}
