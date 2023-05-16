import 'package:flutter/material.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';
import 'package:people_living_flutterdemo/ui/pages/firm/FirmCollectView/firm_collect_view.dart';
import 'package:people_living_flutterdemo/ui/pages/firm/FirmHomeView/firm_home_view.dart';
import 'package:people_living_flutterdemo/ui/pages/firm/FirmMineView/firm_mine_view.dart';
import 'package:people_living_flutterdemo/ui/pages/firm/FirmPositionView/firm_position_view.dart';
import 'package:people_living_flutterdemo/ui/pages/main/initialize_items.dart';

import '../../../core/components/bottom_bar_item.dart';
import '../ContractView/contract_view.dart';
import '../HomeView/home_view.dart';
import '../PersonalView/personal_view.dart';
import '../roundNeck/roundNeck.dart';

class FirmmainScreen extends StatefulWidget {
  /// 企业端
  static const String routeName = '/firm';
  @override
  State<FirmmainScreen> createState() => _FirmmainScreenState();
}

class _FirmmainScreenState extends State<FirmmainScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: IndexedStack(
      //   index: _currentIndex,
      //   children: pages,
      // ),
      body: pages.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: items,
        fixedColor: m_colors.backColor, //选中颜色值
        selectedFontSize: 14.0,
        unselectedFontSize: 14.0,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

// tab页面
final List<Widget> pages = [
  firm_home_View(),
  firm_position_View(),
  firm_collect_View(),
  firm_mine_View(),
];

// tabitem
final List<BottomNavigationBarItem> items = [
  BKBottomBarItem('home', '首页'),
  BKBottomBarItem('work', '职位'),
  BKBottomBarItem('hy', '收藏'),
  BKBottomBarItem('my', '我的'),
];

