/// チーム検索の結果を表示する画面

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nfl_library/components/common/custom_snackbar.dart';
import 'package:nfl_library/components/common/errors/error_container.dart';
import 'package:nfl_library/components/common/search/select_box.dart';
import 'package:nfl_library/components/common/search/select_tag.dart';
import 'package:nfl_library/components/common/search/keyword_tag.dart';
import 'package:nfl_library/components/common/search/input.dart';
import 'package:nfl_library/domain/roster.dart';
import 'package:nfl_library/types/api_response.dart';
import 'package:nfl_library/types/select_box_component_type.dart';
import 'package:nfl_library/providers/app_dependencies.dart';
import '../../../components/results/teams/rosters.dart';
import '../../../configs/const.dart';

const List<Tab> tabs = <Tab>[
  Tab(text: 'Rosters'),
  Tab(text: 'Starters'),
  Tab(text: 'Formations')
];

class TeamsPage extends StatefulWidget {
  const TeamsPage({Key? key}) : super(key: key);

  @override
  State<TeamsPage> createState() => _TeamsPageState();
}

// TickerProviderStateMixin: 複数のアニメーションのコントローラを生成するために必要
class _TeamsPageState extends State<TeamsPage> with TickerProviderStateMixin {
  int? _selectYearItem = 0; // 選択されたシーズン（TODO: フィルタリング機能で使用予定）
  int? _selectTeamItem = 0; // 選択されたチーム（TODO: フィルタリング機能で使用予定）
  final List<String> _searchKeywords = [];
  
  // スクロール連動アニメーション用
  late ScrollController _scrollController;
  late AnimationController _animationController;
  late Animation<double> _expandAnimation;
  bool _isSearchVisible = true;

  @override
  void initState() {
    super.initState();
    
    _scrollController = ScrollController();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),  // Tweenのbeginからendまでのアニメーションを300msの間で実行する設定
      vsync: this, // 画面が更新されるタイミングでのみアニメーションを更新(this: TickerProviderStateMixinのcreateTicker()をAnimationControllerが使用するため)
    );

    // vsyncのおかげで以下が自動的に行われる：
    // 1. アプリがバックグラウンドに移動したとき
    // → アニメーションが自動的に一時停止
    // 2. 画面外にスクロールしたとき
    // → そのWidgetのアニメーションが停止
    // 3. 画面に戻ってきたとき
    // → アニメーションが自動的に再開
    // ★これらすべてがvsync: thisの一行で実現される！
    
    // Tween
    // - アニメーションの開始値と終了値を定義
    // - begin: 1.0 = 100%表示（元のサイズ）
    // - end: 0.0 = 0%表示（完全に隠れる）
    // CurvedAnimation
    // - アニメーションの動きの滑らかさを制御
    // - curve: Curves.easeInOut = ゆっくり始まって、ゆっくり終わる
    _expandAnimation = Tween<double>(
      begin: 1.0, // 完全表示
      end: 0.0,    // 完全収納
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    
    // スクロール監視
    _scrollController.addListener(_onScroll);
  }

  /// スクロール方向に応じて検索エリアの表示/非表示を切り替える
  void _onScroll() {
    if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
      // 下スクロール時：非表示
      if (_isSearchVisible) {
        _isSearchVisible = false;
        _animationController.forward();
      }
    } else if (_scrollController.position.userScrollDirection == ScrollDirection.forward) {
      // 上スクロール時：表示
      if (!_isSearchVisible) {
        _isSearchVisible = true;
        _animationController.reverse();
      }
    }
  }

  @override
  void dispose() {
    // disposeによりイベントリスナーやアニメーションのメモリを解放する
    // イベントリスナー等の解除をしないとメモリーリークの原因になる
    _scrollController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  /// 入力欄の値を受け取って検索処理を実行する
  /// 入力値はタグに追加する
  void callbackHandleInput(String value) {
    if (value.isNotEmpty) {
      setState(() {
        _searchKeywords.add(value);
      });
      // 検索処理を実行
    }
  }

  /// クリックしたタグを入力欄から除外する
  void callbackHandleDeleteTag(String value) {
    // タグを削除する処理
    setState(() {
      _searchKeywords.remove(value);
    });
  }

  /// 選択シーズンの更新処理
  void callbackChangeSeason(ISelectBox<int> value) {
    setState(() {
      _selectYearItem = value.value;
    });
    // シーズン選択時にバリデーションを実行
    _validateSelectionWithSnackBar();
  }

  /// 選択チームの更新処理
  void callbackChangeTeam(ISelectBox<int> value) {
    setState(() {
      _selectTeamItem = value.value;
    });
    // チーム選択時にバリデーションを実行
    _validateSelectionWithSnackBar();
  }

  /// バリデーション: season と teamId の両方が選択されているかチェック（SnackBar表示版）
  bool _validateSelectionWithSnackBar() {
    if (_selectYearItem == null || _selectYearItem == 0) {
      _showErrorSnackBar('シーズンを選択してください');
      return false;
    }
    if (_selectTeamItem == null || _selectTeamItem == 0) {
      _showErrorSnackBar('チームを選択してください');
      return false;
    }
    return true;
  }

  /// バリデーション: season と teamId の両方が選択されているかチェック（UI表示用）
  bool _isValidSelection() {
    return (_selectYearItem != null && _selectYearItem != 0) && 
           (_selectTeamItem != null && _selectTeamItem != 0);
  }

  /// エラーメッセージをSnackBarで表示
  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: '閉じる',
          textColor: Colors.white,
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        // 検索エリア（Input部分のみアニメーション）
        Container(
          padding: const EdgeInsets.all(AppNum.sm),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            children: [
              // アニメーション付き検索入力欄(SizeTransition：サイズ変更（高さや幅を変更）を実現)
              SizeTransition(
                // SizeTransitionで囲った範囲のサイズの収縮、拡張を管理
                sizeFactor: _expandAnimation,
                child: Column(
                  children: [
                    Input(
                      label: '選手名で検索',
                      callback: callbackHandleInput,
                    ),
                    const SizedBox(height: AppNum.sm), // 間隔を追加
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: SingleChildScrollView(
                  // 横スクロールを可能にする
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      // 年代のメニューリスト
                      FutureBuilder<List<ISelectBox<int>>>(
                          future: AppDependencies.searchController.fetchSeasonList(),
                          builder: (context, snapshot) {
                            if(snapshot.hasData) {
                              return SizedBox(
                                  width: 110,
                                  height: 35,
                                  child: SelectBox<int>(selectList: snapshot.data!, title: 'シーズンを選択してください', callback: callbackChangeSeason, backgroundColor: AppColor.lightGray, textColor: AppColor.gray)
                              );
                            } else {
                              return const CircularProgressIndicator();
                            }
                          }
                      ),
                      const SizedBox(width: AppNum.sm), // 間隔を追加
                      ..._searchKeywords.map((keyword) => KeywordTag(text: keyword, onTap: callbackHandleDeleteTag))
                    ]
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: AppNum.sm),
                child: Row(
                  children: [
                    // チームのメニューリスト
                    FutureBuilder<List<ISelectBox<int>>>(
                        future: AppDependencies.searchController.fetchTeamList(),
                        builder: (context, snapshot) {
                          if(snapshot.hasData) {
                            return Expanded(
                              flex: 1, 
                              child: SelectTag<int>(selectList: snapshot.data!, callback: callbackChangeTeam, selectionPrompt: 'チームを選択してください')
                            );
                          } else {
                            return const CircularProgressIndicator();
                          }
                        }
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // スクロール連動するメインコンテンツエリア
        Expanded(
          child: true
            ? FutureBuilder<ApiResponse<List<Roster>>>(
                // future: AppDependencies.rosterController.fetchRosterList(_selectYearItem!, _selectTeamItem!),
                future: AppDependencies.rosterController.fetchRosterList(2019, 31),
                builder: (context, snapshot) {
                  if(snapshot.hasData) {
                    // エラーページを表示するフラグが立つ場合はエラーページを表示
                    if(snapshot.data != null && snapshot.data!.isErrorPage) {
                      return ErrorContainer(message: snapshot.data!.message.join('\n'));
                    } else if (snapshot.data != null && snapshot.data!.status == 422) {
                      // バリデーションエラーがある場合はスナックバーでメッセージを表示
                      if(snapshot.data!.validationMessages != null) {
                        final List<String> errorMessages = snapshot.data!.validationMessages!.entries.map((entry) {
                          return entry.value is List && entry.value.isNotEmpty ? entry.value.first.toString() : '';
                        }).where((msg) => msg.isNotEmpty).toList();
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          _showErrorSnackBar(errorMessages.join('\n'));
                        });
                        return Center(
                          child: ErrorContainer(message: errorMessages.join('\n'))
                        );
                      }
                    } else if(snapshot.data != null && snapshot.data!.data != null) {
                      // スクロール監視用のSingleChildScrollView
                      return SingleChildScrollView(
                        controller: _scrollController, // スクロール監視用
                        child: Center(
                            child: Rosters(params: snapshot.data!.data)
                        ),
                      );
                    }
                    return const Center(
                        child: CircularProgressIndicator()
                    );
                  } else if(snapshot.hasError) {
                    return ErrorContainer(message: snapshot.error.toString());
                  } else {
                    return const Center(
                        child: CircularProgressIndicator()
                    );
                  }
                },
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.warning, size: 50, color: Colors.orange),
                    SizedBox(height: 16),
                    Text('シーズンとチームを選択してください'),
                  ],
                ),
              ),
        )
      ],
    );
  }
}
