import 'package:flutter/material.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';
import 'package:people_living_flutterdemo/core/components/bottom_bar_item.dart';
import 'package:people_living_flutterdemo/ui/pages/roundNeck/roundNeck.dart';

//tabs
import '../HomeView/home_view.dart'; //首页界面
import '../ContractView/contract_view.dart'; //合约界面
import '../PersonalView/personal_view.dart'; //我的界面

class Tabs extends StatefulWidget {
  final index;
  Tabs({this.index = 0});
    static const String routeName = '/';

  @override
  State<Tabs> createState() => _TabsState(this.index);
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;
  _TabsState(index) {
    _currentIndex = index;
  }
  List images = [
    ['images/tabs/home_def@2x.png', 'images/tabs/home_select@2x.png'],
    ['images/tabs/hy_def@2x.png', 'images/tabs/hy_select@2x.png'],
    ['images/tabs/my_def@2x.png', 'images/tabs/my_select@2x.png'],
    ['images/tabs/my_def@2x.png', 'images/tabs/my_select@2x.png']
  ];

  final List<BottomNavigationBarItem> bottomTabs = [
    BKBottomBarItem('home', '首页'),
    BKBottomBarItem('hy', '合约'),
    BKBottomBarItem('hy', '圆领'),
    BKBottomBarItem('my', '我的'),
  ];

  final List<Widget> _pageLists = [
    positionView(),
    homeView(),
    roundNeck(),
    personalView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageLists.elementAt(_currentIndex),
      
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, //索引
        items: bottomTabs,
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
