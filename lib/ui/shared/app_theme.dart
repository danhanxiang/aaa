import 'package:flutter/material.dart';

/**
 *  全局主题管理类
*/
class BKAppThteme {

  static const double smallFontSize = 16;
  static const double normalFontSize = 22;
  static const double largeFontSize = 24;

  static final ThemeData norTheme = ThemeData(
    // 导航栏和tab的颜色
    // primarySwatch: Colors.purple,
    // 背景颜色
    scaffoldBackgroundColor: Colors.white24,
    // canvasColor: Colors.red,
    colorScheme: ColorScheme.fromSwatch(
      accentColor: Colors.blue,
      primarySwatch: Colors.blue,
      // backgroundColor: Color.fromARGB(255, 0, 215, 198), //主题颜色,
    ),

    // button的主题默认样式
    buttonBarTheme: ButtonBarThemeData(
      buttonHeight: 25,
      buttonMinWidth: 10
    ),
    // Theme.of(context).textTheme.bodyText1
    textTheme: TextTheme(
      // 更改bodyText1的默认样式
      bodyText1: TextStyle(fontSize: normalFontSize)
    )
  );

  // 暗黑模型
  static final ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.red,
    // button的主题默认样式
    buttonBarTheme: ButtonBarThemeData(
      buttonHeight: 25,
      buttonMinWidth: 10
    ),
    // Theme.of(context).textTheme.bodyText1
    textTheme: TextTheme(
      bodyText1: TextStyle(fontSize: normalFontSize)
    )
  );
}