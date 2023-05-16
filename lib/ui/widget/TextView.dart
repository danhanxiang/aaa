import 'package:flutter/material.dart';

class TextView extends StatelessWidget {
  TextView({
    this.controller,
    this.maxHeight = 265, 
    this.minHeight = 0,
    this.maxLines, 
    this.maxLength = 0,
    this.autofocus = true,
    this.hintText = '',
    this.onChanged
  });

  final double minHeight;
  final double maxHeight;
  final int? maxLines;
  final int maxLength;
  bool autofocus;
  String hintText;

  final TextEditingController? controller;

  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: maxHeight, //设置最大高度
        minHeight: minHeight, //设置最新高度
      ),
      // decoration: BoxDecoration(
      //   color: Colors.grey[200],
      //   borderRadius: BorderRadius.all(Radius.circular(10))
      // ),
      padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0, bottom: 4.0),
      child: TextField(
        controller: controller,
        autofocus: autofocus, //为true,自动获取焦点
        maxLines: maxLines, //为null不限制行数
        maxLength: maxLength,
        // keyboardType: TextInputType.multiline, //键盘模式
        decoration: InputDecoration.collapsed(
          hintText: hintText,
        ),
        onChanged: onChanged,
      ),
    );
  }
}