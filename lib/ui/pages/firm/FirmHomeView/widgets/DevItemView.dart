import 'package:flutter/material.dart';
import 'package:people_living_flutterdemo/core/models/FirmHomeModel/dev_info_item_entity.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';
import 'package:people_living_flutterdemo/core/extension/int_extension.dart';
import 'package:people_living_flutterdemo/ui/pages/firm/FirmHomeView/developer_detail_view.dart';
import 'package:people_living_flutterdemo/ui/pages/firm/FirmHomeView/widgets/UserIcon.dart';
import 'package:people_living_flutterdemo/ui/widget/ItemWidget.dart';
import 'package:people_living_flutterdemo/ui/widget/UserWorkModeSalary.dart';

class DevItemView extends StatelessWidget {
  DevInfoItemDataList data;

  DevItemView({Key? key,required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: m_colors.divider_01_color, width: 1)
          )
        ),
        margin: EdgeInsets.only(left: 16.px, right: 16.px, bottom: 16.px),
        padding: EdgeInsets.only(bottom: 16.px),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserIcon(data.avatarUrl ?? ''),
            SizedBox(width: 16.px),
            Expanded(
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        data.realName ?? '',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.px,
                          fontWeight: FontWeight.w600
                        ),
                      )
                    ),
                    UserWorkModeSalary(data.workDayModeName ?? '', data.expectSalary ?? 0)
                  ],
                ),
                SizedBox(height: 6.px),
                Text(
                  '${data.careerDirectionName}-工作经验${data.workDayModeName}-${data.educationName}'),
                SizedBox(height: 12.px),
                ProjectItemsView(titleList: data.skillNameToList())
              ],
            ))
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(developer_detail_view.routeName,
            arguments: data.id.toString());
      });
  }
/** 
  /// 标签
  List<Widget> tagView(String skill) {
    List<Widget> childArray = [];
    if (skill.isNotEmpty) {
      List titles = skill.split(',');
      for (var title in titles) {
        childArray.add(Container(
          //margin: EdgeInsets.fromLTRB(0, 0, 4, 0),
          padding: EdgeInsets.all(10.px),
          decoration: const BoxDecoration(
              //设置四周圆角 角度
              borderRadius: BorderRadius.all(Radius.circular(2.0)),
              //设置四周边框
              //border: Border.all(width: 1, color: m_colors.backColor),
              color: m_colors.back_01_color),
          child: Text(
            title,
            style: TextStyle(fontSize: 14.px, color: m_colors.content_01_color),
          ),
        ));
      }
      if (childArray.length > 4) {
        return childArray.sublist(0, 4);
      } else {
        return childArray;
      }
    } else {
      return childArray;
    }
  }
*/
}

