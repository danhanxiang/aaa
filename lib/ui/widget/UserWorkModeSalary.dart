import 'package:flutter/material.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';
import 'package:people_living_flutterdemo/core/extension/int_extension.dart';

class UserWorkModeSalary extends StatelessWidget {
  UserWorkModeSalary(this.workDayMode, this.expectSalary);
  String workDayMode;
  double expectSalary;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: m_colors.backColor,
            borderRadius: BorderRadius.all(Radius.circular(4))
          ),
          padding: EdgeInsets.symmetric(horizontal: 4.px, vertical: 2.px),
          child: Text(
            workDayMode,
            style: TextStyle(
              color: Colors.white, 
              fontSize: 12.px, 
              fontWeight: FontWeight.w600
            ),
          ),
        ),
        SizedBox(width: 8.px),
        Text(
          '${expectSalary / 1000}k/月',
          style: TextStyle(
            color: m_colors.backColor,
            fontSize: 15.px,
            fontWeight: FontWeight.w600
          ),
        ),
      ],
    );
  }
}