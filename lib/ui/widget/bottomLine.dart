import 'package:flutter/material.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';

class bottomLine extends StatelessWidget {
  bottomLine({this.color = m_colors.divider_02_color, this.height = 12});
  final Color? color;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: height),
        Divider(color: color)
      ]
    );
  }
}
