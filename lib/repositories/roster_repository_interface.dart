// Fake Server
import '../../../domain/roster.dart';

abstract class RosterRepositoryInterface {
  /// 選手情報を取得するAPIを実行
  Future<List<Roster>> getRosterList();
}
