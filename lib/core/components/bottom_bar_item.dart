import 'package:flutter/material.dart';

class BKBottomBarItem extends BottomNavigationBarItem {

  BKBottomBarItem(String iconName, String title)
  : super(
    label: title,
    icon: Image.asset(
      'images/tabs/${iconName}_def@2x.png',
      fit: BoxFit.cover, width: 20, height: 20, 
      gaplessPlayback: true),  // 当image更换图片的时候会把之前的删掉在更改第一次换的时候会有空白
    activeIcon: Image.asset(
      'images/tabs/${iconName}_select@2x.png', 
      fit: BoxFit.cover, width: 20, height: 20, 
      gaplessPlayback: true),
  );
}

/* 当image更换图片的时候会把之前的删掉在更改第一次换的时候会有空白
  gaplessPlayback: true
  false: 之前图片 空白 当前图片
  true:  之前图片 当前图片
  二者区别没有空白
*/