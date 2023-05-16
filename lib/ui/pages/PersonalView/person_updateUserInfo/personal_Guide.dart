import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';
import 'package:people_living_flutterdemo/core/components/m_AppBar.dart';
import 'package:people_living_flutterdemo/core/extension/int_extension.dart';
import 'package:people_living_flutterdemo/ui/shared/app_size_fit.dart';

class personal_Guide extends StatelessWidget {
  static const String routeName = '/personal_Guide';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: m_AppBar(context, '', elevation: 0.0),
      body: content(),
    );
  }

  Widget content() {
    return Container(
      padding: EdgeInsets.fromLTRB(16.px, 0, 16.px, BKSizeFit.navHeight),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '从其他应用分享上传', 
              style: TextStyle(
                fontWeight: FontWeight.bold, 
                color: m_colors.title_01_color,
                fontSize: 18.px
              )
            ),
            SizedBox(height: 10.px),
            Text(
              '将简历保存到第三方应用，点击打开详情，点击右上角的更多，选择使用“天天数链 ”导入',
              style: TextStyle(
                fontWeight: FontWeight.w400, 
                color: m_colors.content_02_color,
                fontSize: 12.px
              )
            ),
            SizedBox(height: 10.px),
            Image(image: AssetImage('assets/images/upload_gif.gif'))
          ],
        ),
      ),
    );
  }
}