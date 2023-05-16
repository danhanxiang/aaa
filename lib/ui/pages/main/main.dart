import 'package:flutter/material.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';
import 'package:people_living_flutterdemo/core/components/bottom_bar_item.dart';
import 'package:people_living_flutterdemo/core/extension/int_extension.dart';
import 'package:people_living_flutterdemo/ui/pages/DealView/DealView.dart';
import 'package:people_living_flutterdemo/ui/pages/HomeView/home_view.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/personal_view.dart';

class BKMainScreen extends StatefulWidget {
  /// 开发者端
  static const String routeName = '/';
  @override
  State<BKMainScreen> createState() => _BKMainScreenState();
}

class _BKMainScreenState extends State<BKMainScreen> {
  int _currentIndex = 0;

  // tab页面
final List<Widget> pages = [
  homeView(),
  DealView(),
  personalView(),
];

// tabitem
final List<BottomNavigationBarItem> items = [
  BKBottomBarItem('home', '首页'),
  BKBottomBarItem('work', '找工作'),
  BKBottomBarItem('my', '我的'),
];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      // body: pages.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: items,
        fixedColor: m_colors.backColor, //选中颜色值
        selectedFontSize: 14.px,
        unselectedFontSize: 14.px,
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