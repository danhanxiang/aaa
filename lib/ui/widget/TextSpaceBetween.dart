import 'package:flutter/material.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';

class TextSpaceBetween extends StatelessWidget {
  String title; 
  FontWeight titleFontWeight;
  String detail;
  TextSpaceBetween(
    {Key? key,
    this.titleFontWeight = FontWeight.w300,
    required this.title,
    required this.detail
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, 
              style: const TextStyle(
                fontSize: 13, 
                color: m_colors.content_02_color, 
                // fontWeight: titleFontWeight
                )),
              Text(detail, 
              style: const TextStyle(
                fontSize: 14, 
                color: m_colors.title_01_color, 
                fontWeight: FontWeight.bold)),
            ]);
  }
}