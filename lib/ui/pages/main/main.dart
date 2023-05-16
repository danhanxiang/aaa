import 'package:flutter/material.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';
import 'package:people_living_flutterdemo/ui/pages/main/initialize_items.dart';

class BKMainScreen extends StatefulWidget {
  static const String routeName = '/';
  @override
  State<BKMainScreen> createState() => _BKMainScreenState();
}

class _BKMainScreenState extends State<BKMainScreen> {
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