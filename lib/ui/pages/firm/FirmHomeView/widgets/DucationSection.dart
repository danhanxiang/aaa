import 'package:flutter/material.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';
import 'package:people_living_flutterdemo/core/extension/int_extension.dart';
import 'package:people_living_flutterdemo/core/models/FirmHomeModel/developer_detail_entity.dart';


class DucationSection extends StatelessWidget {
  DucationSection(this.data);

  DeveloperDetailData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20.px, bottom: 24.px),
      margin: EdgeInsets.symmetric(horizontal: 16.px),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: m_colors.bordersColor)
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titleWidget('教育经历'),
          SizedBox(height: 16.px),
          Column(
            children: (data.educationDtoList ?? []).map((model) {
              return ducationCell(model);
          }).toList(),
        ),
      ],
    ));
  }

  /// 教育基本信息
  Widget ducationCell(DeveloperDetailDataEducationDtoList model){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          contentAndTimeWidget('${model.collegeName}', '${model.inSchoolStartTime}-${model.inSchoolEndTime}'),
          SizedBox(height: 4.px),
          Text(
            '${model.educationName} | ${model.trainingModeName} | ${model.major}',
            style: TextStyle(
              color: m_colors.content_02_color, 
              fontSize: 13.px,
              fontWeight: FontWeight.w400
            ),
          ),
        ],
      ),
    );
  }
}

Widget titleWidget(String title){
    return Text(
      title,
      style: TextStyle(
        color: m_colors.title_01_color, 
        fontSize: 15.px, 
        fontWeight: FontWeight.w600
      ),
    );
  }

  Widget contentAndTimeWidget(String title, String time){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            title,
            maxLines: 2,
            style: TextStyle(
              color: m_colors.content_01_color,
              fontSize: 15.px,
              fontWeight: FontWeight.w600
            )
          )
        ),
        Text(
          time,
          style: TextStyle(
            color: m_colors.content_02_color,
            fontSize: 13.px,
            fontWeight: FontWeight.w400
      )
        )
      ],
    );
  }