import 'package:flutter/material.dart';
import '../../../core/components/bottom_bar_item.dart';
import '../ContractView/contract_view.dart';
import '../HomeView/home_view.dart';
import '../PersonalView/personal_view.dart';
import '../roundNeck/roundNeck.dart';

// tab页面
final List<Widget> pages = [
    homeView(),
    positionView(),
    // roundNeck(),
    personalView(),
  ];

// tabitem
final List<BottomNavigationBarItem> items = [
    BKBottomBarItem('home', '首页'),
    BKBottomBarItem('work', '找工作'),
    // BKBottomBarItem('hy', '圆领'),
    BKBottomBarItem('my', '我的'),
  ];

  