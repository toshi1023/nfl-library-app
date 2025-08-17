// Fake Server
import '../../../domain/roster.dart';
import '../../types/api_response.dart';

abstract class RosterRepositoryInterface {
  /// 選手情報を取得するAPIを実行
  Future<ApiResponse<List<Roster>>> getRosterList(int season, int teamId);
}
