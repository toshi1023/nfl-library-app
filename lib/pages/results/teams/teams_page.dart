/// チーム検索の結果を表示する画面

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:nfl_library/components/common/search/select_box.dart';
import 'package:nfl_library/components/common/search/select_tag.dart';
import 'package:nfl_library/components/common/search/keyword_tag.dart';
import 'package:nfl_library/components/common/search/input.dart';
import 'package:nfl_library/controllers/search_controller.dart';
import 'package:nfl_library/domain/roster.dart';
import 'package:nfl_library/repositories/search_repository.dart';
import 'package:nfl_library/controllers/roster_controller.dart';
import 'package:nfl_library/repositories/roster_repository.dart';
import 'package:nfl_library/types/select_box_component_type.dart';
import 'package:provider/provider.dart';
import 'package:nfl_library/components/common/app_bar/app_main_bar.dart';
import 'package:nfl_library/components/common/bottom_bar/bottom_nav_bar.dart';
import 'package:nfl_library/components/results/teams/starters.dart';
import '../../../components/results/teams/rosters.dart';
import '../../../components/results/teams/formations.dart';
import '../../../configs/const.dart';
import '../../../domain/player2.dart';
import '../../../domain/roster.dart';

const List<Tab> tabs = <Tab>[
  Tab(text: 'Rosters'),
  Tab(text: 'Starters'),
  Tab(text: 'Formations')
];

class TeamsPage extends StatefulWidget {
  const TeamsPage({Key? key}) : super(key: key);

  @override
  _TeamsPageState createState() => _TeamsPageState();
}

class _TeamsPageState extends State<TeamsPage> {
  int? _selectYearItem = 0;
  int? _selectTeamItem = 0;
  List<String> _searchKeywords = [];
  final _searchController = SearchController(SearchRepository());
  final _rosterController = RosterController(RosterRepository());

  @override
  void initState() {
    super.initState();
  }

  /// 入力欄の値を受け取って検索処理を実行する
  /// 入力値はタグに追加する
  void callbackHandleInput(String value) {
    setState(() {
      _searchKeywords.add(value);
    });
    // 検索処理を実行
    print(_searchKeywords);
  }

  /// クリックしたタグを入力欄から除外する
  void callbackHandleDeleteTag(String value) {
    // タグを削除する処理
    setState(() {
      _searchKeywords.remove(value);
    });
  }

  /// 選択シーズンの更新処理
  void callbackChangeSeason(int value) {
    _selectYearItem = value;
  }
  /// 選択チームの更新処理
  void callbackChangeTeam(int value) {
    _selectTeamItem = value;
  }

  /// 選択シーズンの更新処理
  void callbackChangeSeason2(ISelectBox<int> value) {
    _selectYearItem = value.value;
  }

  /// 選択チームの更新処理
  void callbackChangeTeam2(ISelectBox<int> value) {
    _selectTeamItem = value.value;
  }

  @override
  Widget build(BuildContext context) {
    final String? apiurl = dotenv.env['API_URL'];
    if(apiurl != null) print(apiurl);

    return Column(
      children: [
        // Padding(
        //   padding: const EdgeInsets.all(AppNum.cardPadding * 0.5),
        //   child: Row(
        //     children: [
        //       // 年代のメニューリスト
        //       FutureBuilder<List<ISelectBox<int>>>(
        //           future: _searchController.fetchSeasonList(),
        //           builder: (context, snapshot) {
        //             if(snapshot.hasData) {
        //               return SizedBox(
        //                   width: 110,
        //                   child: SelectBox<int>(selectList: snapshot.data!, title: 'Select Season', callback: callbackChangeSeason)
        //               );
        //             } else {
        //               return const CircularProgressIndicator();
        //             }
        //           }
        //       ),

        //       // チームのメニューリスト
        //       FutureBuilder<List<ISelectBox<int>>>(
        //           future: _searchController.fetchTeamList(),
        //           builder: (context, snapshot) {
        //             // if(snapshot.hasData) {
        //             //   return Expanded(flex: 1, child: SelectBox<int>(selectList: snapshot.data!, title: 'Select Team', callback: callbackChangeTeam));
        //             // } else {
        //             //   return const CircularProgressIndicator();
        //             // }
        //             if(snapshot.hasData) {
        //               return Expanded(
        //                 flex: 1, 
        //                 child: SelectTag<int>(selectList: snapshot.data!, callback: callbackChangeTeam2, selectionPrompt: 'チームを選択してください')
        //               );
        //             } else {
        //               return const CircularProgressIndicator();
        //             }
        //           }
        //       ),
        //     ],
        //   ),
        // ),
        Container(
          padding: const EdgeInsets.all(20),
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
              // 検索入力欄
              Input(
                label: '選手名で検索',
                callback: callbackHandleInput,
              ),
              const SizedBox(height: AppNum.sm), // 間隔を追加
              Container(
                alignment: Alignment.centerLeft,
                child: SingleChildScrollView(
                  // 横スクロールを可能にする
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      // 年代のメニューリスト
                      FutureBuilder<List<ISelectBox<int>>>(
                          future: _searchController.fetchSeasonList(),
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
                padding: const EdgeInsets.symmetric(vertical: AppNum.md),
                child: Row(
                  children: [
                    // 年代のメニューリスト
                    // FutureBuilder<List<ISelectBox<int>>>(
                    //     future: _searchController.fetchSeasonList(),
                    //     builder: (context, snapshot) {
                    //       if(snapshot.hasData) {
                    //         return SizedBox(
                    //             width: 110,
                    //             child: SelectTag<int>(selectList: snapshot.data!, callback: callbackChangeSeason2, selectionPrompt: 'シーズンを選択してください')
                    //         );
                    //       } else {
                    //         return const CircularProgressIndicator();
                    //       }
                    //     }
                    // ),

                    // チームのメニューリスト
                    FutureBuilder<List<ISelectBox<int>>>(
                        future: _searchController.fetchTeamList(),
                        builder: (context, snapshot) {
                          // if(snapshot.hasData) {
                          //   return Expanded(flex: 1, child: SelectBox<int>(selectList: snapshot.data!, title: 'Select Team', callback: callbackChangeTeam));
                          // } else {
                          //   return const CircularProgressIndicator();
                          // }
                          if(snapshot.hasData) {
                            return Expanded(
                              flex: 1, 
                              child: SelectTag<int>(selectList: snapshot.data!, callback: callbackChangeTeam2, selectionPrompt: 'チームを選択してください')
                            );
                          } else {
                            return const CircularProgressIndicator();
                          }
                        }
                    ),
                  ],
                ),
              ),
            ]
          ),
        ),

        FutureBuilder<List<Roster>>(
          future: _rosterController.fetchRosterList(),
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              return Expanded(
                  child: SingleChildScrollView(
                    child: Center(
                        child: Rosters(params: snapshot.data!)
                    ),
                  )
              );
            } else {
              return const Expanded(
                child: Center(
                    child: CircularProgressIndicator()
                ),
              );
            }
          },
        )
      ],
    );
  }
}


// final Map<String, dynamic> data = {
//   // ロスターの値
//   'rosters': [
//     Player(
//         'images/favorite_teams/San_Francisco_49ers_logo_mini.png',
//         'QB', 10, 'Jimmy Garoppolo', 83, 188, 89,
//         'Eastern Illinois University', 2014, 5, 109
//     ),
//     Player(
//         'images/favorite_teams/San_Francisco_49ers_logo_mini.png',
//         'WR', 19, 'Deebo Samuel', 89, 182, 97,
//         'South Carolina University', 2019, 2, 36
//     ),
//     Player(
//         'images/favorite_teams/San_Francisco_49ers_logo_mini.png',
//         'TE', 85, 'George Kittle', 97, 193, 113,
//         'Iowa University', 2017, 5, 146
//     ),
//     Player(
//         'images/favorite_teams/San_Francisco_49ers_logo_mini.png',
//         'QB', 10, 'Jimmy Garoppolo', 83, 188, 89,
//         'Eastern Illinois University', 2014, 5, 109
//     ),
//     Player(
//         'images/favorite_teams/San_Francisco_49ers_logo_mini.png',
//         'WR', 19, 'Deebo Samuel', 89, 182, 97,
//         'South Carolina University', 2019, 2, 36
//     ),
//     Player(
//         'images/favorite_teams/San_Francisco_49ers_logo_mini.png',
//         'TE', 85, 'George Kittle', 97, 193, 113,
//         'Iowa University', 2017, 5, 146
//     )
//   ],
// };