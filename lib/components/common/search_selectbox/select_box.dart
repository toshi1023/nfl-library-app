/// ラベルなしのセレクトボックス

import 'package:flutter/material.dart';

import '../../../configs/const.dart';
import '../../../types/select_box_component_type.dart';

class SelectBox extends StatefulWidget {
  const SelectBox({
    Key? key,
    required this.selectList,
    required this.title,
    required this.callback
  }) : super(key: key);
  final List<ISelectBox> selectList;
  final String title;
  final void Function(int) callback;

  @override
  _SelectBoxState createState() => _SelectBoxState();
}

class _SelectBoxState extends State<SelectBox> {
  // growable: trueにするとリストの拡張が可能になる
  // final List<DropdownMenuItem<int>> _items = List.empty(growable: true);
  int? _selectItem = 0;
  // 検索用ドロップダウンリストのレイアウト設定
  final double selectBoxHeight = AppNum.cardPadding / 5;

  @override
  void initState() {
    super.initState();
    _selectItem = widget.selectList[0].value;
  }

  /// ドロップダウンリストのwidgetを生成
  Widget generateDropdownMenuItem(ISelectBox data, {Color? textColor = Colors.white}) {
    return DropdownMenuItem(
      value: data.value,
      child: Center(child:
      data.imageFile == null ?
      // テキストのみの場合
      Text(data.text, textAlign: TextAlign.center, style: TextStyle(fontSize: AppNum.selectboxFontSize, color: textColor))
          :
      // アイコン画像の設定をする場合
      Row(
        children: <Widget> [
          Container(
            margin: const EdgeInsets.all(10),
            child: Image.asset(
              data.imageFile!,
              width: AppNum.dropDownListImageSize,
            ),
          ),
          Text(
              data.text,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: AppNum.selectboxFontSize, color: textColor)
          ),
        ],
      )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Card(
          color: const Color(0xA6374A7B),
            // margin: const EdgeInsets.only(top: AppNum.cardMargin),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: selectBoxHeight * 0.5, bottom: selectBoxHeight * 0.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget> [
                  // ドロップダウンリストに表示する値
                  Padding(
                    padding: const EdgeInsets.only(left: AppNum.cardPadding * 0.5),
                    child: generateDropdownMenuItem(widget.selectList.firstWhere((element) => element.value == _selectItem))
                  ),

                  // 三角のアイコン
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: const Icon(Icons.arrow_drop_down, color: Colors.white),
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
                    child: SingleChildScrollView(
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
                          Center(
                            child: Text(
                              widget.title,
                              style: const TextStyle(
                                  fontSize: AppNum.menuFontSize * 2,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Bree_Serif'
                              ),
                            ),
                          ),

                          // データ一覧
                          ListView.builder(
                            // 要素の高さに合わせてどうこう調整してくれるもの
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),

                              itemCount: widget.selectList.length,
                              itemBuilder: (context, index) {
                                final data = widget.selectList[index];
                                return Padding(
                                  padding: const EdgeInsets.only(top: AppNum.cardPadding * 0.5, bottom: AppNum.cardPadding * 0.5, left: AppNum.cardPadding, right: AppNum.cardPadding),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        _selectItem = data.value;
                                        widget.callback(data.value!);   // コールバック関数を実行
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: Card(
                                        color: _selectItem == data.value ? AppColor.activeColor : AppColor.subColor,
                                        child: generateDropdownMenuItem(data, textColor: Colors.black)
                                    ),
                                  ),
                                );
                              }
                          ),
                        ],
                      ),
                    )
                );
              });
        }
    );
  }
}