/// 罰則ヤードの検索セレクトボックス

import 'package:flutter/material.dart';

import '../../../configs/const.dart';

class PenaltyYardSelectBox extends StatefulWidget {
  @override
  _PenaltyYardSelectBoxState createState() => _PenaltyYardSelectBoxState();
}

class _PenaltyYardSelectBoxState extends State<PenaltyYardSelectBox> {
  // growable: trueにするとリストの拡張が可能になる
  final List<DropdownMenuItem<int>> _items = List.empty(growable: true);
  int? _selectItem = 0;
  // 検索用ドロップダウンリストのレイアウト設定
  final double selectBoxHeight = AppNum.cardPadding / 5;

  @override
  void initState() {
    super.initState();
    setItems();
    _selectItem = _items[0].value;
  }

  void setItems() {
    _items
      ..add(const DropdownMenuItem(
        value: 0,
        child: Center(child: Text('指定なし', textAlign: TextAlign.center, style: TextStyle(fontSize: AppNum.selectboxFontSize))),
      ))
      ..add(const DropdownMenuItem(
        value: 1,
        child: Center(child: Text('5ヤード', textAlign: TextAlign.center, style: TextStyle(fontSize: AppNum.selectboxFontSize))),
      ))
      ..add(const DropdownMenuItem(
        value: 2,
        child: Center(child: Text('10ヤード', textAlign: TextAlign.center, style: TextStyle(fontSize: AppNum.selectboxFontSize))),
      ))
      ..add(const DropdownMenuItem(
        value: 3,
        child: Center(child: Text('15ヤード', textAlign: TextAlign.center, style: TextStyle(fontSize: AppNum.selectboxFontSize))),
      ))
      ..add(const DropdownMenuItem(
        value: 4,
        child: Center(child: Text('15ヤード以上', textAlign: TextAlign.center, style: TextStyle(fontSize: AppNum.selectboxFontSize))),
      ));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Card(
            margin: const EdgeInsets.only(top: AppNum.cardMargin),
            child: Padding(
              padding: EdgeInsets.only(top: selectBoxHeight * 1.5, bottom: selectBoxHeight * 1.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget> [
                  // ドロップダウンリストに表示する値
                  Padding(
                    padding: const EdgeInsets.only(left: AppNum.cardPadding),
                    child: _items.firstWhere((element) => element.value == _selectItem),
                  ),

                  // 三角のアイコン
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: const Icon(Icons.arrow_drop_down),
                    ),
                  ),
                ],
              ),
            )
        ),
        onTap: () async {
          await showModalBottomSheet(
            //モーダルの背景の色、透過
              backgroundColor: Colors.transparent,
              //ドラッグ可能にする（高さもハーフサイズからフルサイズになる様子）
              isScrollControlled: true,
              context: context,
              builder: (BuildContext context) {
                return Container(
                    margin: const EdgeInsets.only(top: 120),
                    decoration: const BoxDecoration(
                      //モーダル自体の色
                      color: Colors.white,
                      //角丸にする
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      children: [
                        // 閉じるボタン
                        InkWell(
                          child: const Padding(
                            padding: EdgeInsets.all(AppNum.cardPadding),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Icon(
                                Icons.close,
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),

                        // メニュータイトル
                        const Center(
                          child: Text(
                            'Select Penalty',
                            style: TextStyle(
                                fontSize: AppNum.menuFontSize * 2,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Bree_Serif'
                            ),
                          ),
                        ),

                        // チーム一覧
                        ListView.builder(
                          // 要素の高さに合わせてどうこう調整してくれるもの
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),

                            itemCount: _items.length,
                            itemBuilder: (context, index) {
                              final data = _items[index];
                              return Padding(
                                padding: const EdgeInsets.only(top: AppNum.cardPadding * 0.5, bottom: AppNum.cardPadding * 0.5, left: AppNum.cardPadding, right: AppNum.cardPadding),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _selectItem = data.value;
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: Card(
                                      color: _selectItem == data.value ? AppColor.activeColor : AppColor.subColor,
                                      child: data
                                  ),
                                ),
                              );
                            }
                        ),
                      ],
                    )
                );
              });
        }
    );
  }
}