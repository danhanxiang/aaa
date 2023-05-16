import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    // primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.white24,
    // canvasColor: Colors.red,
    colorScheme: ColorScheme.fromSwatch(
      accentColor: Color.fromRGBO(72, 80, 255, 1),
        primarySwatch: createMaterialColor(Color.fromARGB(255, 255, 255, 255)),
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

/// 自定义 MaterialColor
MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;
  
  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}