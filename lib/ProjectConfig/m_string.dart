import 'package:flutter/material.dart';

// 扩展 String 类型
extension ImageLoad on String {
  /// 获取图片全路径
  String get img => 'assets/images/$this';

  /// 获取 icon 全路径
  String get icon => 'assets/icons/$this';
}


/// 获取图片全路径
String getImg(String name) {
  return 'assets/images/$name';
}

/// 获取 icon 全路径
String getIcon(String name) {
  return 'assets/icons/$name';
}
/*
  ///【 使用】
// 加载图片，以屏幕宽度限定，所以没指定宽高
Image.asset(
  // 直接写名字
  getImg('img_01.jpeg'),
)
// 加载 icon
Image.asset(
  // 直接些名字
  getIcon('icon_home.png'),
  // 指定图片宽高
  width: 24,
  height: 24,
)

*/