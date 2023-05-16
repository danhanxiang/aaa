import 'package:flutter/material.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';
import 'package:people_living_flutterdemo/core/extension/int_extension.dart';
import 'package:people_living_flutterdemo/core/models/FirmHomeModel/developer_detail_entity.dart';
import 'package:people_living_flutterdemo/ui/pages/firm/FirmHomeView/widgets/UserIcon.dart';
import 'package:people_living_flutterdemo/ui/widget/ItemWidget.dart';
import 'package:people_living_flutterdemo/ui/widget/UserWorkModeSalary.dart';


/// 开发者详情用户基本信息
class DeveloperInfo extends StatelessWidget {
  DeveloperInfo(this.data,{Key? key}): super(key: key);

  DeveloperDetailData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16.px, right: 16.px, bottom: 20.px),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserIcon(data.avatarUrl ?? 'https://minio.stage-ttchain.tntlinking.com/develop-image/67d0852d-76ac-4671-85c8-4c1057e6bc6f.jpg'),
              SizedBox(width: 16.px),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            data.realName ?? '',
                            style: TextStyle(
                              color: m_colors.title_01_color,
                              fontSize: 20.px,
                              fontWeight: FontWeight.w600
                            )
                          ),
                        ),
                        SizedBox(width: 6.px),
                        
                        UserWorkModeSalary(data.workModeDtoList?[0].workDayMode == 1
                                    ? '全日'
                                    : '半日', 
                                    data.workModeDtoList?[0].expectSalary ?? 0)
                    ],
                  ),
                  SizedBox(height: 8.px),

                  Text(
                    '${data.careerDto?.careerDirectionName}·工作经验${data.careerDto?.workYearsName}',
                    style: TextStyle(
                      color: m_colors.content_02_color,
                      fontSize: 15.px,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                  SizedBox(height: 6.px),
                ],
              )
              )
            ],
          ),
          SizedBox(height: 24.px),
          /// 标签
          ProjectItemsView(titleList: data.getTagTitle()),
        ],
      )
    );
  }

}