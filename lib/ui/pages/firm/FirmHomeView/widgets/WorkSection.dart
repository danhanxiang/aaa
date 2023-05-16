import 'package:flutter/material.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';
import 'package:people_living_flutterdemo/core/extension/int_extension.dart';
import 'package:people_living_flutterdemo/core/models/FirmHomeModel/developer_detail_entity.dart';
import 'DucationSection.dart';


class WorkSection extends StatelessWidget {
  WorkSection(this.data);

  DeveloperDetailData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24.px),
      margin: EdgeInsets.symmetric(horizontal: 16.px),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: m_colors.bordersColor)
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titleWidget('工作经历'),
          SizedBox(height: 16.px),
          Column(
            children: (data.workExperienceDtoList ?? []).map((model) {
              return workCell(model);
            }).toList(),
          ),
        ],
      )
    );
  }

  Widget workCell(DeveloperDetailDataWorkExperienceDtoList model){
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          contentAndTimeWidget( '${model.companyName}','${model.workStartTime} - ${model.workEndTime}'),
          SizedBox(height: 4.px),
          Text(
            '${model.industryName} | ${model.positionName}',
            style: TextStyle(
              color: m_colors.content_02_color, 
              fontSize: 13.px,
              fontWeight: FontWeight.w400
            ),
          )
        ],
      ),
    );
  }
}