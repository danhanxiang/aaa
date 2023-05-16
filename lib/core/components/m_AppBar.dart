import 'package:flutter/material.dart';

PreferredSizeWidget m_AppBar(BuildContext context, String title,
    { 
      Key? key,
      // 导航栏背景颜色 默认为主题色
      Color? color, 
      // 导航栏title颜色
      Color? titleColor,
      // 是否显示返回按钮
      bool isHiddenLeading = false,

      double elevation = 0.2,
      // 导航栏返回按钮图片样式
      String iconName = 'images/login/icon_Navipop_return.png',
      List<Widget>? action
     }) {
  return AppBar(
    key: key,
    centerTitle: true,
    automaticallyImplyLeading: !isHiddenLeading,
    title: Text(
      title,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
    ),
    leading: isHiddenLeading
        ? null : 
        IconButton(
            icon: Image.asset(iconName, width: 24, height: 24, fit: BoxFit.cover),
            onPressed: () => { Navigator.of(context).pop() },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          ),
    backgroundColor: color ?? Theme.of(context).colorScheme.primary,
    elevation: elevation,
    foregroundColor: titleColor ?? (color == Colors.white ? Colors.black : Colors.white),
    actions: action,
  );
}
