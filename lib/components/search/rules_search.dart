import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../common/app_bar/app_main_bar.dart';
import '../../configs/const.dart';

class RulesSearch extends StatefulWidget {
  const RulesSearch({Key? key}) : super(key: key);

  @override
  _RulesSearchState createState() => _RulesSearchState();
}

class _RulesSearchState extends State<RulesSearch> {
  @override
  // growable: trueにするとリストの拡張が可能になる
  final List<DropdownMenuItem<int>> _statusitems = List.empty(growable: true);
  @override
  final List<DropdownMenuItem<int>> _penaltyitems = List.empty(growable: true);
  int? _selectStatusItem = 0;
  int? _selectPenaltyItem = 0;

  @override
  void initState() {
    super.initState();
    setStatusItems();
    _selectStatusItem = _statusitems[0].value;
    setPenaltyItems();
    _selectPenaltyItem = _penaltyitems[0].value;
  }

  // 攻守ステータスのデータをセット
  void setStatusItems() {
    _statusitems
      ..add(const DropdownMenuItem(
        value: 0,
        child: Center(child: Text('指定なし', textAlign: TextAlign.center, style: TextStyle(fontSize: AppNum.selectboxFontSize))),
      ))
      ..add(const DropdownMenuItem(
        value: 1,
        child: Center(child: Text('オフェンス', textAlign: TextAlign.center, style: TextStyle(fontSize: AppNum.selectboxFontSize))),
      ))
      ..add(const DropdownMenuItem(
        value: 2,
        child: Center(child: Text('ディフェンス', textAlign: TextAlign.center, style: TextStyle(fontSize: AppNum.selectboxFontSize))),
      ))
      ..add(const DropdownMenuItem(
        value: 3,
        child: Center(child: Text('キック', textAlign: TextAlign.center, style: TextStyle(fontSize: AppNum.selectboxFontSize))),
      ));
  }

  // 反則のデータをセット
  void setPenaltyItems() {
    _penaltyitems
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
    return Scaffold(
        backgroundColor: AppColor.backColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(AppNum.cardPadding),
                child: Card (
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(AppNum.searchPaddingForm),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                    margin: const EdgeInsets.only(top: AppNum.labelMargin),
                                    child: const Text(
                                      '攻守ステータス',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: AppNum.formLabelFontSize
                                      ),
                                    )
                                ),
                              ),

                              // 攻守ステータスのドロップダウンリスト
                              DropdownButton(
                                items: _statusitems,
                                value: _selectStatusItem,
                                isExpanded: true,
                                onChanged: (value) => {
                                  setState(() {
                                    _selectStatusItem = value as int;
                                  }),
                                },
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(AppNum.searchPaddingForm),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                    margin: const EdgeInsets.only(top: AppNum.labelMargin),
                                    child: const Text(
                                      '罰則ヤード',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: AppNum.formLabelFontSize
                                      ),
                                    )
                                ),
                              ),

                              // 反則のドロップダウンリスト
                              DropdownButton(
                                items: _penaltyitems,
                                value: _selectPenaltyItem,
                                isExpanded: true,
                                onChanged: (value) => {
                                  setState(() {
                                    _selectPenaltyItem = value as int;
                                  }),
                                },
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(AppNum.searchPaddingForm),
                          child: ElevatedButton(
                            onPressed: () {
                              // 反則一覧ページへ遷移
                              Navigator.of(context).pushNamed("/rules");
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.only(left: AppNum.buttonPadding, right: AppNum.buttonPadding),
                              primary: AppColor.mainColor, //ボタンの背景色
                              shape: const RoundedRectangleBorder(
                                // ボタンの形に丸みをおびせる
                                borderRadius: BorderRadius.all(Radius.circular(18.0)),
                              ),
                            ),
                            child: const Text(
                              '検索',
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                        )
                      ],
                    )
                ),
              ),
            ],
          ),
        )
    );
  }
}