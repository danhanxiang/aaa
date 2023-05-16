import 'package:flutter/material.dart';
import '../../core/models/personModel/skillsClassModel.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';

class ProjectItemsView extends StatelessWidget {
  ProjectItemsView(
    {Key? key,
    this.titleList,
    this.projectSkillList
    }) : super(key: key);

  List<String>? titleList;
  List<SkillsClassModel>? projectSkillList;

  @override
  Widget build(BuildContext context) {

    return Wrap(
        spacing: 6.0,
        runSpacing: 6.0,
        children: _createContentList()
    );
  }

  List<Widget> _createContentList() {
    if (titleList != null) {
      return _createTitleViews(titleList ?? []);
    } else if (projectSkillList != null) {
      return _createModelTitleViews(projectSkillList ?? []);
    }
    return [];
  }

  List<Widget> _createModelTitleViews(List titles) {
    List<Widget> childArray = [];
    for (SkillsClassModel title in titles) {
      childArray.add(Container(
        margin: EdgeInsets.fromLTRB(0, 0, 4, 4),
        padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
        decoration: BoxDecoration(
            //设置四周圆角 角度
            borderRadius: BorderRadius.all(Radius.circular(2.0)),
            //设置四周边框
            //border: Border.all(width: 1, color: m_colors.backColor),
            color: m_colors.back_01_color),
        child: Text(
          title.skillName ?? "",
          style: TextStyle(fontSize: 12, color: m_colors.content_01_color),
        ),
      ));
    }
    return childArray;
  }

  List<Widget> _createTitleViews(List titles) {
    List<Widget> childArray = [];
    for (String title in titles) {
      childArray.add(Container(
        margin: EdgeInsets.fromLTRB(0, 0, 4, 4),
        padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
        decoration: BoxDecoration(
            //设置四周圆角 角度
            borderRadius: BorderRadius.all(Radius.circular(2.0)),
            //设置四周边框
            //border: Border.all(width: 1, color: m_colors.backColor),
            color: m_colors.back_01_color),
        child: Text(
          title,
          style: TextStyle(fontSize: 12, color: m_colors.content_01_color),
        ),
      ));
    }
    return childArray;
  }
}
