import 'package:flutter/material.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';
import 'package:people_living_flutterdemo/ui/widget/ItemWidget.dart';
import 'package:people_living_flutterdemo/ui/widget/bottomLine.dart';
import '../../../../core/models/index.dart';

class hop_project extends StatefulWidget {
  hop_project(this.projectList);
  List<Person_projectDto> projectList = [];

  @override
  State<hop_project> createState() => _hop_projectState();
}

class _hop_projectState extends State<hop_project> {
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
        offstage: widget.projectList.length == 0 ? true : false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: (widget.projectList).map((model) {
              return experienceCell(model);
            }).toList(),
          ),
        ),
      );
  }

  Widget experienceCell(Person_projectDto model) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(model.projectName ?? "", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15))
                ),
                SizedBox(height: 8),
                Text("${model.projectStartDate} - ${model.projectEndDate}", style: TextStyle(color: Colors.black38,fontSize: 12)),
              ],
            ),
            SizedBox(height: 8),

            Text(model.position ?? "",
                style: TextStyle(
                    fontSize: 13,
                    color: m_colors.content_01_color)),
            SizedBox(height: 4),
            Text("${model.companyName}|${model.industryName}",
                style: TextStyle(
                    fontSize: 13,
                    color: m_colors.content_01_color)),
            SizedBox(height: 16),
            Text(model.description ?? "",
                style: TextStyle(
                    fontSize: 13,
                    color: m_colors.content_02_color)),
            SizedBox(
              height: 8,
            ),
            ProjectItemsView(projectSkillList: model.projectSkillList),
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
                borderRadius: BorderRadius.all(Radius.circular(3)))),
        SizedBox(width: 2),
        Text("项目经历",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 16.0)),
      ],
    );
  }
}
