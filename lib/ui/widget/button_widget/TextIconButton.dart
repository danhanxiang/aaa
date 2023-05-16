import 'package:flutter/material.dart';

/// ---
/// Description: 图片 + 文字 button
/// Author: MQTwist
/// Github: https://github.com/MQTwist
/// Blog: https://www.jianshu.com/u/47a35e62c1bf
/// LastEditors: mq943691300@163.com
/// Date: 2022-11-16 14:26:54
/// LastEditTime: 2022-11-17 17:00:57
/// FilePath: /flutter_application_1/lib/custom/text_icon_button.dart
/// Copyright © 2022 MQTwist, All Rights Reserved.
/// ---
class TextIconButton extends StatelessWidget {
  /// 图文类型 默认图片在左
  final TextIconButtonType type;

  /// icon
  final Widget icon;

  /// text
  final Widget text;

  /// 间距
  final double margin;

  /// 点击事件
  final Function()? onTap;

  const TextIconButton({
    Key? key,
    required this.icon,
    required this.text,
    this.type = TextIconButtonType.imageLeft,
    this.margin = 2,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late Widget widget;
    switch (type) {
      case TextIconButtonType.imageLeft:
        widget = _row(icon, text);
        break;
      case TextIconButtonType.imageRight:
        widget = _row(text, icon);
        break;
      case TextIconButtonType.imageTop:
        widget = _column(icon, text);
        break;
      case TextIconButtonType.imageBottom:
        widget = _column(text, icon);
        break;
      default:
        widget = _row(icon, text);
    }
    return widget;
  }

  _row(Widget left, Widget right) {
    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          left,
          SizedBox(width: margin),
          right,
        ],
      ),
    );
  }

  _column(Widget top, Widget bottom) {
    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          top,
          SizedBox(height: margin),
          bottom,
        ],
      ),
    );
  }
}

enum TextIconButtonType {
  imageLeft,
  imageRight,
  imageTop,
  imageBottom,
}