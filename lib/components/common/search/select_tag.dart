/// タグ選択の検索欄

import 'package:flutter/material.dart';

import '../../../configs/const.dart';
import '../../../types/select_box_component_type.dart';
import '../../../configs/const.dart';

class SelectTag<T> extends StatefulWidget {
  const SelectTag({
    Key? key,
    required this.selectList,
    required this.callback
  }) : super(key: key);
  /// 検索内容の配列
  final List<ISelectBox<T>> selectList;
  /// 検索を実行するコールバック関数
  final void Function(ISelectBox<T>) callback;

  @override
  _SelectTagState<T> createState() => _SelectTagState<T>();
}

/// タグ選択の検索欄の状態を管理するクラス
class _SelectTagState<T> extends State<SelectTag<T>> {
  ISelectBox<T>? _selectedItem;

  @override
  void initState() {
    super.initState();
    // 初期値として最初のアイテムを選択
    if (widget.selectList.isNotEmpty) {
      // widgetはState<T>を継承していることでプロパティが付与されており、そこに親ウィジェットから渡されたデータが格納されている
      _selectedItem = widget.selectList.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: widget.selectList
            .map((item) => _buildFilterChip(item))
            .toList(),
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
            // コールバック関数を実行（選択されたアイテムのvalueを文字列として渡す）
            widget.callback(item);
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
}