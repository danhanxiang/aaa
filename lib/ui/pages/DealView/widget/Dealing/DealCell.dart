import 'package:flutter/material.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';

class DealCell extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
          // padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                  width: 1,
                  color: m_colors.bordersColor
              ),
            boxShadow: [
              BoxShadow(
                color: m_colors.shadowsColor,
                offset: Offset(0, 3), // 阴影位置 从什么位置开始
                blurRadius: 10, // 阴影模糊层度
                spreadRadius: 0,//阴影模糊大小
              )
          ],
          ),
          height: 200,
          child: Text('sss'),
        );
  }
}