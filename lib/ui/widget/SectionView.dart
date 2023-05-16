import 'package:flutter/material.dart';
import 'package:people_living_flutterdemo/core/extension/int_extension.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';

class SectionView extends StatelessWidget {
  SectionView(this.title, this.imgURl);

  String title;
  String imgURl;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 24.px, bottom: 16.px),
      child: Row(
        children: [
          Image.asset(
            imgURl,
            width: 12.px,
            height: 12.px,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 4.px),
          Text(
            title,
            style: TextStyle(fontSize: 13.px, color: m_colors.content_02_color),
          )
        ],
      ),
    );
  } 
}