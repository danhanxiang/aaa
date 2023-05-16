import 'package:flutter/material.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_string.dart';

class PlaceholderWidget extends StatelessWidget {
  const PlaceholderWidget({this.title = '暂无数据', this.iconName = 'placeholder.png'});

  final String title;
  final String iconName;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 100),
          Image.asset(iconName.img,
            fit: BoxFit.cover, width: 80, height: 80),
            SizedBox(height: 6),
            Text(title, style:  TextStyle(color: m_colors.content_02_color, fontSize: 14)),
        ],
      ),
    );
  }
}