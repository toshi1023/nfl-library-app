/// タグ選択の検索欄

import 'package:flutter/material.dart';

import '../../../configs/const.dart';
import '../../../types/select_box_component_type.dart';
import '../../../configs/const.dart';

class SelectTag<T> extends StatefulWidget {
  const SelectTag({
    Key? key,
    required this.selectList,
    required this.callback,
    this.selectionPrompt = '選択してください',
  }) : super(key: key);
  /// 検索内容の配列
  final List<ISelectBox<T>> selectList;
  /// 検索欄の説明書き
  final String selectionPrompt;
  /// 検索を実行するコールバック関数
  final void Function(ISelectBox<T>) callback;

  @override
  _SelectTagState<T> createState() => _SelectTagState<T>();
}

/// タグ選択の検索欄の状態を管理するクラス
class _SelectTagState<T> extends State<SelectTag<T>> with SingleTickerProviderStateMixin {
  ISelectBox<T>? _selectedItem;
  bool _isExpanded = false;  // 展開状態を管理
  late AnimationController _animationController;
  late Animation<double> _expandAnimation;

  @override
  void initState() {
    super.initState();
    // 初期値として最初のアイテムを選択
    if (widget.selectList.isNotEmpty) {
      // widgetはState<T>を継承していることでプロパティが付与されており、そこに親ウィジェットから渡されたデータが格納されている
      _selectedItem = widget.selectList.first;
    }
    
    // アニメーションコントローラーの初期化
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    
    // 展開アニメーション（0.0から1.0まで）
    _expandAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    // アニメーション完了時の処理
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.dismissed && mounted) {
        // 収納アニメーション完了時に状態をリセット
        setState(() {
          _isExpanded = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _expandAnimation,
      builder: (context, child) {
        return Column(
          children: [
            // 通常時は選択されたタグのみ表示
            _buildSelectedTag(),
            
            // 展開時は全てのタグを表示（アニメーション付き）
            SizeTransition(
              sizeFactor: _expandAnimation,
              child: FadeTransition(
                opacity: _expandAnimation,
                child: _isExpanded ? _buildExpandedTags() : const SizedBox.shrink(),
              ),
            ),
          ],
        );
      },
    );
  }

  /// 選択されたタグのみを表示するウィジェット
  Widget _buildSelectedTag() {
    if (_selectedItem == null) return const SizedBox.shrink();
    
    return GestureDetector(
      onTap: () {
        if (_isExpanded) {
          // 既に展開されている場合は収納
          _animationController.reverse();
        } else {
          // 展開されていない場合は展開
          setState(() {
            _isExpanded = true;
          });
          _animationController.forward();
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: AppNum.md, vertical: AppNum.sm),
        decoration: BoxDecoration(
          color: const Color(0xFF1E3A8A),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (_selectedItem!.imageFile != null) ...[
              Image.asset(
                _selectedItem!.imageFile!,
                width: AppNum.dropDownListImageSize,
              ),
              const SizedBox(width: AppNum.sm),
            ],
            Text(
              _selectedItem!.text,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: AppNum.sm),
            AnimatedRotation(
              turns: _isExpanded ? 0.5 : 0.0,
              duration: const Duration(milliseconds: 300),
              child: const Icon(
                Icons.arrow_drop_down,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 展開時の全タグ表示ウィジェット
  Widget _buildExpandedTags() {
    return Container(
      padding: const EdgeInsets.all(AppNum.md),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(AppNum.md),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        children: [
          // 閉じるボタン
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.selectionPrompt,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: AppNum.md,
                ),
              ),
              GestureDetector(
                onTap: () {
                  // 収納アニメーションを開始
                  _animationController.reverse();
                },
                child: const Icon(Icons.close),
              ),
            ],
          ),
          const SizedBox(height: AppNum.md),
          // タグリスト
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: widget.selectList
                  .map((item) => _buildFilterChip(item))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  /// 検索条件のチップを生成する
  Widget _buildFilterChip(ISelectBox<T> item) {
    final bool isSelected = _selectedItem?.value == item.value;
    return Container(
      margin: const EdgeInsets.only(right: AppNum.sm),
      child: FilterChip(
        label: item.imageFile != null ? Row(
          children: [
            Image.asset(
              item.imageFile!,
              width: AppNum.dropDownListImageSize,
            ),
            Text(
              item.text,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey[700],
                fontWeight: FontWeight.w600,
              ),
            ),
          ]
        ) : 
          Text(
            item.text,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.grey[700],
              fontWeight: FontWeight.w600,
            ),
          ),
        selected: isSelected,
        onSelected: (selected) {
          setState(() {
            _selectedItem = selected ? item : null;
            // コールバック関数を実行
            widget.callback(item);
          });
          // 収納アニメーションを開始
          _animationController.reverse();
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
}