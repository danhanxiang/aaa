import 'package:flutter/material.dart';

PreferredSizeWidget m_AppBar(BuildContext context, String title,
    { 
      // 导航栏背景颜色 默认为主题色
      Color? color, 
      // 导航栏title颜色
      Color? titleColor,
      // 是否显示返回按钮
      bool isHiddenLeading = false,
      // 导航栏返回按钮图片样式
      String iconName = 'images/login/icon_Navipop_return.png',
     }) {
  return AppBar(
    automaticallyImplyLeading: !isHiddenLeading,
    title: Text(
      title,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
    leading: isHiddenLeading
        ? null : 
        IconButton(
            icon: Image.asset(iconName, width: 24, height: 24, fit: BoxFit.cover),
            onPressed: () => {Navigator.of(context).pop("返回")},
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          ),
    backgroundColor: color ?? Theme.of(context).colorScheme.primary,
    elevation: 0.2,
    foregroundColor: titleColor ?? (color == Colors.white ? Colors.black : Colors.white),
  );
}
