import 'package:flutter/material.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';
import 'package:people_living_flutterdemo/core/extension/int_extension.dart';
import 'package:people_living_flutterdemo/core/models/FirmHomeModel/developer_detail_entity.dart';
import 'package:people_living_flutterdemo/ui/widget/ItemWidget.dart';
import 'DucationSection.dart';

class ProjectSection extends StatelessWidget {
  ProjectSection(this.data, [Key? key]) : super(key: key);

  DeveloperDetailData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24.px, horizontal: 16.px),
      // decoration: BoxDecoration(
      //   border: Border(
      //     bottom: BorderSide(color: m_colors.bordersColor)
      //   )
      // ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titleWidget('项目经历'),
          SizedBox(height: 16.px),
          Column(
            children: (data.projectDtoList ?? []).map((model) {
              return projectCell(model);
            }).toList(),
          ),
        ],
      )
    );
  }

  Widget projectCell(DeveloperDetailDataProjectDtoList model){
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          contentAndTimeWidget('${model.projectName}', '${model.projectStartDate} - ${model.projectEndDate}'),
          SizedBox(height: 4.px),
          Text(
            '${model.position}',
            style: TextStyle(
              color: m_colors.content_01_color,
              fontSize: 13.px,
              fontWeight: FontWeight.w400
            )
          ),
          SizedBox(height: 4.px),
          Text(
            '${model.companyName} | ${model.industryName}',
            style: TextStyle(
              color: m_colors.content_01_color,
              fontSize: 13.px,
              fontWeight: FontWeight.w400
            )
          ),
          SizedBox(height: 16.px),
          Text(
            '${model.description}', 
            style: TextStyle(
              color: m_colors.content_02_color,
              fontSize: 13.px,
              fontWeight: FontWeight.w400
            )
          ),

          SizedBox(height: 8.px),
          ProjectItemsView(
            titleList: model.getTagTitle()
          ),
        ],
      ),
    );
  }
}