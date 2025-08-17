import '../controllers/search_controller.dart';
import '../controllers/roster_controller.dart';
import '../repositories/roster/roster_repository_interface.dart';
import '../repositories/roster/roster_repository.dart';
import '../repositories/search/search_repository_interface.dart';
import '../repositories/search/search_repository.dart';

/// 依存性注入(DI)クラス
class AppDependencies {
  // Repositoryクラスのインスタンスを生成
  static RosterRepositoryInterface get _rosterRepository => RosterRepository();
  static SearchRepositoryInterface get _searchRepository => SearchRepository();

  // Controllerクラスのインスタンスを生成
  static RosterController get rosterController => RosterController(_rosterRepository);
  static SearchController get searchController => SearchController(_searchRepository);
}