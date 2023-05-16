import 'package:flutter/material.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';
import 'package:people_living_flutterdemo/ui/widget/bottomLine.dart';
import '../../../../core/models/index.dart';

class hop_experience extends StatefulWidget {
  hop_experience(this.experience);

  List<Person_workExperienceDto> experience;

  @override
  State<hop_experience> createState() => _hop_experienceState();
}

class _hop_experienceState extends State<hop_experience> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SectionHeader(),
      experienceList()
    ]);
  }
  // 列表
  Widget experienceList() {
    return Offstage(
        offstage: widget.experience.length == 0 ? true : false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: (widget.experience).map((model) {
              return experienceCell(model);
            }).toList(),
          ),
        ),
      );
  }

  Widget experienceCell(Person_workExperienceDto model) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${model.companyName}",style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
                Text("${model.workStartTime}-${model.workEndTime}", style: TextStyle(color: Colors.black38,fontSize: 12)),
              ],
            ),
            SizedBox(height: 8),
            
            Text("${model.industryName}｜${model.positionName}",
            style: TextStyle(fontSize: 13,color: m_colors.content_01_color)
            ),
            bottomLine()
          ],
        )
      ]),
    );
  }

  Widget SectionHeader() {
    return Row(
      children: [
        Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(3)))
              ),
        SizedBox(width: 2),
        Text("工作经历",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 16.0)),
      ],
    );
  }
}
