import 'package:flutter/material.dart';

class PositionTag extends StatelessWidget {
  final String title;
  final Color color;
  final Color backgroundColor;

  const PositionTag.origin(
      {Key? key,
        required this.title,
        this.color = Colors.black,
        this.backgroundColor = const Color.fromARGB(255, 233, 231, 231)})
      : super(key: key);

  factory PositionTag(String title) {
    switch (title) {
      default:
        return PositionTag.origin(title: title);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      margin: EdgeInsets.only(right: 6,bottom: 6),
      padding: EdgeInsets.only(right: 8, left:8, top: 4, bottom: 4),
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(4.0)),
      child: Text(
        title,
        style: TextStyle(fontSize: 12.0, color: color),
      ),
    );
  }
}
