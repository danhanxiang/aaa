import 'package:flutter/material.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';
import 'package:people_living_flutterdemo/core/components/m_mainButton.dart';
import 'package:people_living_flutterdemo/core/extension/int_extension.dart';
import 'package:people_living_flutterdemo/core/extension/string_extension.dart';

class PlaceholderWidget extends StatelessWidget {
  const PlaceholderWidget({
    this.content = '',
    this.title = '暂无数据', 
    this.iconName = 'placeholder',
    this.imgWidth = 80,
    this.imgHeight = 80,
    this.btnTitle = '',
    this.onPressed = null
  });

  final String content;
  final String title;
  final String iconName;
  final double imgWidth;
  final double imgHeight;
  final String btnTitle;

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 120.px),
          Image.asset(iconName.png,
            fit: BoxFit.cover, width: imgWidth, height: imgHeight),
            
            Visibility(
              visible: content.length > 0,
              child: Column(children: [
              SizedBox(height: 16.px),
              Text(
                content, 
                style: TextStyle(
                  color: m_colors.title_01_color, 
                  fontSize: 15.px, 
                  fontWeight: FontWeight.w600)
                )
            ],)),

            SizedBox(height: 10.px),
            Text(
              title, 
              style: TextStyle(
                color: m_colors.content_02_color, 
                fontSize: 14.px)
              ),

            SizedBox(height: 16.px),
            button()
        ],
      ),
    );
  }


  Widget button(){
    return Visibility(
      visible: btnTitle.length > 0,
      child: MainButton(
        text: btnTitle, 
        width: 120.px,
        heigth: 41.px,
        OnPressed: this.onPressed,
      ));
  }
}