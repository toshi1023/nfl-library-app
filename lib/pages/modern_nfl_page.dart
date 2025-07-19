import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ModernNFLRoster extends StatefulWidget {
  final List<Roster>? params;

  const ModernNFLRoster({Key? key, this.params}) : super(key: key);

  @override
  _ModernNFLRosterState createState() => _ModernNFLRosterState();
}

class _ModernNFLRosterState extends State<ModernNFLRoster>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  String _searchQuery = '';
  String _selectedPosition = 'All';

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _animationController.forward();
  }

  // ダミーデータを生成
  List<Roster> _getDummyData() {
    return [
      Roster(
        id: 1,
        number: 12,
        player: Player(
          firstname: 'Tom',
          lastname: 'Brady',
          college: 'Michigan',
          imageFile: null,
          imageUrl: 'https://via.placeholder.com/150',
        ),
        position: Position(name: 'QB'),
        rating: 97,
      ),
      Roster(
        id: 2,
        number: 87,
        player: Player(
          firstname: 'Travis',
          lastname: 'Kelce',
          college: 'Cincinnati',
          imageFile: null,
          imageUrl: 'https://via.placeholder.com/150',
        ),
        position: Position(name: 'TE'),
        rating: 96,
      ),
      Roster(
        id: 3,
        number: 22,
        player: Player(
          firstname: 'Derrick',
          lastname: 'Henry',
          college: 'Alabama',
          imageFile: null,
          imageUrl: 'https://via.placeholder.com/150',
        ),
        position: Position(name: 'RB'),
        rating: 94,
      ),
      Roster(
        id: 4,
        number: 99,
        player: Player(
          firstname: 'Aaron',
          lastname: 'Donald',
          college: 'Pittsburgh',
          imageFile: null,
          imageUrl: 'https://via.placeholder.com/150',
        ),
        position: Position(name: 'DT'),
        rating: 99,
      ),
      Roster(
        id: 5,
        number: 13,
        player: Player(
          firstname: 'Odell',
          lastname: 'Beckham Jr.',
          college: 'LSU',
          imageFile: null,
          imageUrl: 'https://via.placeholder.com/150',
        ),
        position: Position(name: 'WR'),
        rating: 88,
      ),
      Roster(
        id: 6,
        number: 8,
        player: Player(
          firstname: 'Lamar',
          lastname: 'Jackson',
          college: 'Louisville',
          imageFile: null,
          imageUrl: 'https://via.placeholder.com/150',
        ),
        position: Position(name: 'QB'),
        rating: 92,
      ),
      Roster(
        id: 7,
        number: 10,
        player: Player(
          firstname: 'Tyreek',
          lastname: 'Hill',
          college: 'West Alabama',
          imageFile: null,
          imageUrl: 'https://via.placeholder.com/150',
        ),
        position: Position(name: 'WR'),
        rating: 91,
      ),
      Roster(
        id: 8,
        number: 17,
        player: Player(
          firstname: 'Davante',
          lastname: 'Adams',
          college: 'Fresno State',
          imageFile: null,
          imageUrl: 'https://via.placeholder.com/150',
        ),
        position: Position(name: 'WR'),
        rating: 95,
      ),
    ];
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.grey[50]!,
            Colors.grey[100]!,
          ],
        ),
      ),
      child: Column(
        children: [
          // 検索とフィルターセクション
          _buildSearchAndFilter(),

          // 選手リスト
          Expanded(
            child: _buildPlayersList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchAndFilter() {
    return Container(
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
          // 検索バー
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search players...',
                hintStyle: TextStyle(color: Colors.grey[500]),
                prefixIcon: Icon(Icons.search, color: Colors.grey[500]),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),

          // ポジションフィルター
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: ['All', 'QB', 'RB', 'WR', 'TE', 'DT', 'LB', 'DB', 'K']
                  .map((position) => _buildFilterChip(position))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String position) {
    final bool isSelected = _selectedPosition == position;
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: FilterChip(
        label: Text(
          position,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey[700],
            fontWeight: FontWeight.w600,
          ),
        ),
        selected: isSelected,
        onSelected: (selected) {
          setState(() {
            _selectedPosition = position;
          });
        },
        backgroundColor: Colors.grey[200],
        selectedColor: const Color(0xFF1E3A8A),
        elevation: isSelected ? 3 : 0,
        showCheckmark: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  Widget _buildPlayersList() {
    final filteredPlayers = _getFilteredPlayers();

    // データがない場合の表示
    if (filteredPlayers.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.sports_football,
              size: 80,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 20),
            Text(
              'No players found',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Try adjusting your search or filters',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: filteredPlayers.length,
      itemBuilder: (context, index) {
        return AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            final animationValue = Curves.easeOutBack.transform(
              (_animationController.value - (index * 0.1)).clamp(0.0, 1.0),
            );

            return Transform.translate(
              offset: Offset(0, 50 * (1 - animationValue)),
              child: Opacity(
                opacity: animationValue,
                child: _buildPlayerCard(filteredPlayers[index], index),
              ),
            );
          },
        );
      },
    );
  }

  List<Roster> _getFilteredPlayers() {
    // widget.paramsがnullまたは空の場合、ダミーデータを使用
    final dataToUse = (widget.params == null || widget.params!.isEmpty)
        ? _getDummyData()
        : widget.params!;

    return dataToUse.where((player) {
      final matchesSearch = player.player.firstname
          .toLowerCase()
          .contains(_searchQuery.toLowerCase()) ||
          player.player.lastname
              .toLowerCase()
              .contains(_searchQuery.toLowerCase());

      final matchesPosition = _selectedPosition == 'All' ||
          player.position.name == _selectedPosition;

      return matchesSearch && matchesPosition;
    }).toList();
  }

  Widget _buildPlayerCard(Roster player, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Material(
        elevation: 8,
        shadowColor: Colors.black.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          onTap: () {
            // Navigator.of(context).pushNamed("/player_detail", arguments: player);
            // デバッグ用：詳細画面への遷移をコメントアウト
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${player.player.firstname} ${player.player.lastname} selected'),
                duration: const Duration(seconds: 1),
              ),
            );
          },
          borderRadius: BorderRadius.circular(20),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white,
                  Colors.grey[50]!,
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  // プレイヤー画像
                  _buildPlayerImage(player),
                  const SizedBox(width: 20),

                  // プレイヤー情報
                  Expanded(
                    child: _buildPlayerInfo(player),
                  ),

                  // レーティングと詳細ボタン
                  Column(
                    children: [
                      _buildRatingBadge(player),
                      const SizedBox(height: 15),
                      _buildDetailsButton(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPlayerImage(Roster player) {
    return Hero(
      tag: 'player_${player.id}',
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFF1E3A8A),
              const Color(0xFF3B82F6),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF1E3A8A).withOpacity(0.3),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: player.player.imageFile != null
              ? Image.network(
            player.player.imageUrl,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return _buildInitialsAvatar(player);
            },
          )
              : _buildInitialsAvatar(player),
        ),
      ),
    );
  }

  Widget _buildInitialsAvatar(Roster player) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF1E3A8A),
            const Color(0xFF3B82F6),
          ],
        ),
      ),
      child: Center(
        child: Text(
          '${player.player.firstname[0]}${player.player.lastname[0]}',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildPlayerInfo(Roster player) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ポジションと背番号
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFF1E3A8A).withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            '${player.position.name} #${player.number}',
            style: const TextStyle(
              color: Color(0xFF1E3A8A),
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 10),

        // プレイヤー名
        Text(
          '${player.player.firstname} ${player.player.lastname}',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1F2937),
          ),
        ),
        const SizedBox(height: 8),

        // 追加情報
        Row(
          children: [
            Icon(
              Icons.school_outlined,
              size: 16,
              color: Colors.grey[600],
            ),
            const SizedBox(width: 6),
            Text(
              player.player.college ?? 'Unknown',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRatingBadge(Roster player) {
    final rating = player.rating ?? 0;
    Color ratingColor;

    if (rating >= 90) {
      ratingColor = const Color(0xFF10B981); // Green
    } else if (rating >= 80) {
      ratingColor = const Color(0xFF3B82F6); // Blue
    } else if (rating >= 70) {
      ratingColor = const Color(0xFFF59E0B); // Yellow
    } else {
      ratingColor = const Color(0xFFEF4444); // Red
    }

    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: ratingColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: ratingColor.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              'OVR',
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            rating.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailsButton() {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Color(0xFF6B7280),
      ),
    );
  }
}

// ダミーのデータクラス（実際のプロジェクトでは既存のものを使用）
class Roster {
  final int id;
  final int number;
  final Player player;
  final Position position;
  final int? rating;

  Roster({
    required this.id,
    required this.number,
    required this.player,
    required this.position,
    this.rating,
  });
}

class Player {
  final String firstname;
  final String lastname;
  final String? college;
  final String? imageFile;
  final String imageUrl;

  Player({
    required this.firstname,
    required this.lastname,
    this.college,
    this.imageFile,
    required this.imageUrl,
  });
}

class Position {
  final String name;

  Position({required this.name});
}

// テストページ用のウィジェット
class NFLRosterTestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'NFL Roster',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF1E3A8A),
        elevation: 0,
      ),
      body: const ModernNFLRoster(
        params: null, // nullを渡すことでダミーデータが使用される
      ),
    );
  }
}