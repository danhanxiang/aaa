import 'package:flutter/material.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';
import 'package:people_living_flutterdemo/core/components/m_AppBar.dart';
import 'package:people_living_flutterdemo/core/components/m_mainButton.dart';
import 'package:people_living_flutterdemo/core/service/personal_api/personal_api.dart';

import '../../../../core/models/index.dart';

class choose_skillsView extends StatefulWidget {
  static const String routeName = '/choose_skills';
  choose_skillsView({Key? key, required this.projectDtoModel})
      : super(key: key);

  Person_projectDto projectDtoModel;
  @override
  State<choose_skillsView> createState() => _choose_skillsViewState();
}

class _choose_skillsViewState extends State<choose_skillsView> {
  List<SkillsModel> SkillsModelLists = [];
  List<SkillsClassModel> selectedSkillsLists = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    PersonalService.getSkillsList("", (object) {
      if (object.isSuccess) {
        setState(() {
          selectedSkillsLists = widget.projectDtoModel.projectSkillList ?? [];
          SkillsModelLists = object.data;
          // for (SkillsClassModel selectedSkillsModel in selectedSkillsLists) {
          //   selectedSkillsModel.selected = true;
          //   for (SkillsModel skillsModel in SkillsModelLists) {
          //     skillsModel.children =
          //         changeSkills(skillsModel.children!, selectedSkillsModel);
          //   }
          // }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: m_AppBar(context, "选择技能标签"),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
            margin: EdgeInsets.only(bottom: 50),
            child: ListView(
              children: [
                Container(
                    padding: EdgeInsets.only(bottom: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "使用技能(已选)",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: m_colors.title_01_color),
                        ),
                        _CreateSeleteSkillView(
                            selectedlist: selectedSkillsLists,
                            onDelete: (deleteModel) {
                              setState(() {
                                for (SkillsModel skillsModel
                                    in SkillsModelLists) {
                                  List<SkillsClassModel> list1 = changeSkills(
                                      skillsModel.children!, deleteModel);
                                  skillsModel.children = list1;
                                }
                              });
                            }),
                      ],
                    )),
                Text(
                  "常见技术标签",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: m_colors.title_01_color),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: SkillsModelLists.map((e) {
                      return Container(
                        padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(e.skillName ?? "",
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: m_colors.content_01_color)),
                            SizedBox(height: 16),
                            _createSkillsView(
                              list: e.children ?? [],
                              selectedSkills: selectedSkillsLists,
                              onSelected: (selectedModelList) {
                                setState(() {
                                  selectedSkillsLists = selectedModelList;
                                });
                              },
                            )
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
          ),
          //按钮保存
          Positioned(
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(16, 17, 16, 30),
              child: m_Button(
                text: "保存",
                OnPressed: () {
                  Navigator.of(context).pop(selectedSkillsLists);
                },
              ),
            ),
            bottom: 10,
            left: 0,
            right: 0,
            height: 100,
          )
        ],
      ),
    );
  }
}

//选择的view
class _CreateSeleteSkillView extends StatefulWidget {
  _CreateSeleteSkillView(
      {Key? key,
      required this.selectedlist,
      required this.onDelete(SkillsClassModel model)})
      : super(key: key);
  List<SkillsClassModel> selectedlist;
  Function(SkillsClassModel model) onDelete;

  @override
  State<_CreateSeleteSkillView> createState() => __CreateSeleteSkillViewState();
}

class __CreateSeleteSkillViewState extends State<_CreateSeleteSkillView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
      child: Wrap(
        runSpacing: 8.0,
        spacing: 8.0,
        children: widget.selectedlist.map((e) {
          return GestureDetector(
              onTap: () {
                print("点击删除${e.skillName}");
                setState(() {
                  widget.selectedlist = removeSkills(widget.selectedlist, e);
                  e.selected = false;
                  widget.onDelete(e);
                });
              },
              child: Container(
                  height: 33,
                  padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                  decoration: BoxDecoration(
                      //设置四周圆角 角度
                      borderRadius: BorderRadius.all(Radius.circular(2.0)),
                      //设置四周边框
                      border: Border.all(width: 1, color: m_colors.backColor),
                      color: m_colors.back_02_color),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(e.skillName ?? "",
                          style: TextStyle(
                              fontSize: 12, color: m_colors.backColor)),
                      SizedBox(width: 4),
                      Image.asset(
                        "images/person/icon_person_skills_delete.png",
                        width: 14,
                        height: 14,
                        fit: BoxFit.cover,
                      )
                    ],
                  )));
        }).toList(),
      ),
    );
  }
}

//未选中的所有view
class _createSkillsView extends StatefulWidget {
  _createSkillsView(
      {Key? key,
      required this.list,
      required this.selectedSkills,
      required this.onSelected(List<SkillsClassModel> selectedSkills)})
      : super(key: key);
  List<SkillsClassModel> list;
  List<SkillsClassModel> selectedSkills;
  Function(List<SkillsClassModel> selectedSkills) onSelected;

  @override
  State<_createSkillsView> createState() => __createSkillsViewState();
}

class __createSkillsViewState extends State<_createSkillsView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        spacing: 8.0,
        runSpacing: 8.0,
        children: widget.list.map((e) {
          return GestureDetector(
              onTap: () {
                print("点击${e.skillName}");
                setState(() {
                  if (e.selected!) {
                    widget.selectedSkills =
                        removeSkills(widget.selectedSkills, e);
                    // widget.selectedSkills.remove(e);
                  } else {
                    widget.selectedSkills.add(e);
                  }
                  e.selected = !e.selected!;
                  widget.onSelected(widget.selectedSkills);
                });
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                decoration: BoxDecoration(
                    //设置四周圆角 角度
                    borderRadius: BorderRadius.all(Radius.circular(2.0)),
                    //设置四周边框
                    border: e.selected!
                        ? Border.all(width: 1, color: m_colors.backColor)
                        : Border.all(width: 1, color: Colors.transparent),
                    color: m_colors.back_02_color),
                child: Text(e.skillName ?? "",
                    style: TextStyle(
                        fontSize: 12,
                        color: e.selected!
                            ? m_colors.backColor
                            : m_colors.title_01_color)),
              ));
        }).toList(),
      ),
    );
  }
}

//删除某个技能标签
List<SkillsClassModel> removeSkills(
    List<SkillsClassModel> list, SkillsClassModel removeModel) {
  List<SkillsClassModel> newList = list;
  for (int i = 0; i < newList.length; i++) {
    SkillsClassModel model = newList[i];
    if (model.id! == removeModel.id!) {
      newList.removeAt(i);
    }
  }
  return newList;
}

//改变某个技能标签的状态
List<SkillsClassModel> changeSkills(
    List<SkillsClassModel> list, SkillsClassModel ChangeModel) {
  for (SkillsClassModel model in list) {
    if (model.id! == ChangeModel.id!) {
      model.selected = ChangeModel.selected;
    }
  }

  return list;
}
