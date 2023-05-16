import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';
import 'package:people_living_flutterdemo/core/components/m_AppBar.dart';
import 'package:people_living_flutterdemo/core/components/m_mainButton.dart';
import 'package:people_living_flutterdemo/core/service/personal_api/personal_api.dart';
import 'package:people_living_flutterdemo/ui/shared/app_size_fit.dart';
import 'package:people_living_flutterdemo/ui/widget/sheet.dart';

import '../../../../core/models/index.dart';

class choose_skillsView extends StatefulWidget {
  static const String routeName = '/choose_skills';
  choose_skillsView({Key? key, required this.projectSkillList, required this.careerDirectionId})
      : super(key: key);
  String careerDirectionId;
  // Person_projectDto projectDtoModel;
  List<SkillsClassModel>? projectSkillList;
  @override
  State<choose_skillsView> createState() => _choose_skillsViewState();
}

class _choose_skillsViewState extends State<choose_skillsView> {
  /// 所有标签
  List<SkillsModel> SkillsModelLists = [];
  /// 选中标签
  List<SkillsClassModel> selectedSkillsLists = [];
  /// 搜索标签
  late List<SkillsClassModel> searchTagList = [];
  /// 是否显示搜索列表页
  bool isShowSearch = false;
  late TextEditingController textController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textController = TextEditingController(text: '');
    getAllTags();
  }

  getAllTags(){
    List<SkillsClassModel> selectList = widget.projectSkillList ?? [];
    PersonalService.getSkillsList(widget.careerDirectionId, selectList, (object) {
      if (object.isSuccess) {
        setState(() {
          selectedSkillsLists = widget.projectSkillList ?? [];
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

  /// 获取搜索标签接口
  getSearchTags(String searchText){
    EasyLoading();
    PersonalService.getSearchTags(searchText, (object) {
      EasyLoading.dismiss();
      if (object.isSuccess) {
        setState(() {
          searchTagList = object.data;
        });
      }
    });
  }

  /// 添加自定义标签
  getDiyTag(String tag) {
    EasyLoading();
    PersonalService.getAddDiyTag(widget.careerDirectionId, tag, (object) {
      EasyLoading.dismiss();
      if (object.isSuccess) {
        setState(() {
          selectedSkillsLists.add(object.data);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: m_AppBar(context, "选择技能标签"),
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            searchBar(context),
            isShowSearch ? searchList(context):
            Expanded(child: allTag(context))
          ],
        ),
      ),
    );
  }

  Widget allTag(BuildContext context) {
    return Column(
        children: [
          content(context),
          bottomBtn(context)
        ],
    );
  }

  /// 底部保存按钮
  Widget bottomBtn(BuildContext context) {
    return Container(
        height: 100,
        width: BKSizeFit.screenWidth,
        padding: EdgeInsets.fromLTRB(0, 17, 0, 30),
        child: m_Button(
          text: "保存",
          OnPressed: () {
            Navigator.of(context).pop(selectedSkillsLists);
          },
        ),
      );
  }

  /// 内容widget
  Widget content(BuildContext context) {
    return Expanded(
      child: ListView(
          children: [
            tagsList(context)
          ],
        ),
    );
  }

  /// 选择标签view
  Widget tagsList(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        diyTag(context),
        selectItem(context),
        allItems(context)
      ],
    );
  }

  Widget searchBar(BuildContext context){
    return Container(
      height: 50,
      margin: EdgeInsets.only(bottom: 10),
      child: CupertinoSearchTextField(
        controller: textController,
        placeholder: '搜索使用的技能标签',
        placeholderStyle: TextStyle(color: m_colors.disableColor, fontSize: 15),
        prefixInsets: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          border: Border.all(width: 1, color: m_colors.disableColor),
          color: Colors.white),
          onChanged: (value) {
            setState(() {
              getSearchTags(value);
              isShowSearch = value.length > 0;
            });
          },
      ),
    );
  }
  
  Widget diyTag(BuildContext context) {
    return Row(children: [
        Text('没有找到我的技能标签?',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15, color: m_colors.title_01_color)),
        TextButton(onPressed: (){
          showAddTagAlertDialog(context, (tag){
            getDiyTag(tag);
          });
        }, child: Text('手动添加', style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15, color: m_colors.backColor),))
      ]);
  }

  /// 选中标签
  Widget selectItem(BuildContext context) {
    return Container(
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
      ));
  }

  /// 所有标签
  Widget allItems(BuildContext context) {
    return Container(
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: SkillsModelLists.map((e) {
        return Container(
          padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(e.skillName ?? "", 
              style: TextStyle(fontSize: 13,fontWeight: FontWeight.w600, color: m_colors.content_01_color)),
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
    );
  }


  /// 搜索view
  Widget searchList(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: searchTagList.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedSkillsLists.add(searchTagList[index]);
                  isShowSearch = false;
                  textController.text = '';
                });
              },
              child: Container(
                height: 60,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(searchTagList[index].skillName ?? '', style: TextStyle(fontWeight:  FontWeight.w400, fontSize: 18, color: m_colors.title_01_color)),
                    SizedBox(height: 18),
                    Divider(height: 1, color: m_colors.disableColor)
                  ]),
              ),
            );
          },
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
                print("点击：${e.skillName}, ${widget.selectedSkills.length}");
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

  /// 当前标签选中
  isSelectTag(SkillsClassModel tag){
    widget.selectedSkills.map((e) {
      if (e.id == tag.id) {
        return true;
      }
    });
    return false;
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
