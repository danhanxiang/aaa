import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_pickers/pickers.dart';
import 'package:flutter_pickers/style/default_style.dart';
import 'package:flutter_pickers/time_picker/model/date_mode.dart';
import 'package:flutter_pickers/time_picker/model/pduration.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';
import 'package:people_living_flutterdemo/core/components/m_AppBar.dart';
import 'package:people_living_flutterdemo/core/components/m_mainButton.dart';
import 'package:people_living_flutterdemo/ProjectConfig/tools.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/person_updateUserInfo/personal_choose_skills.dart';
import 'package:people_living_flutterdemo/core/service/personal_api/personal_api.dart';
import '../../../../core/components/m_textFiled.dart';
import '../../../../core/models/index.dart';

class add_projectView extends StatefulWidget {
  static const String routeName = '/add_project';
  add_projectView({Key? key, required this.StateMap}) : super(key: key);
  Map StateMap;
  @override
  State<add_projectView> createState() => _add_projectViewState();
}

class _add_projectViewState extends State<add_projectView> {
  Person_projectDto projectDtoModel = Person_projectDto();
  String type = ""; //页面状态

  String projectNameStr = ""; //项目名称
  TextEditingController projectController = TextEditingController();
  PDuration? JoinindustryStr; //项目开始时间 ;
  PDuration? EndindustryStr; //项目结束时间
  //担任角色
  String roleNameStr = "";
  TextEditingController roleController = TextEditingController();
  //所在公司
  String companyNameStr = "";
  TextEditingController companyController = TextEditingController();
  //所在行业
  String industryTypeStr = "";
  String industryTypeStr_two = "";
  String industryTypeID_two = "";

  List<IndustryModel> industryTypeList = [];
  Map industryTypeTextDic = {};

  //项目描述
  String describe = "";
  TextEditingController describeController = TextEditingController();

  //使用技能
  List<String> selectedSkillsIDList = [];
  List<String> selectedSkillsTextList = [];
  List<SkillsClassModel> selectedSkillsModelList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PersonalService.getIndustryList((object) {
      setState(() {
        industryTypeList = object.data;
        for (IndustryModel industry in industryTypeList) {
          List list = [];
          for (var item in industry.children!) {
            list.add(item.name);
          }
          industryTypeTextDic[industry.name] = list;
        }
      });
    });
    //赋值
    type = widget.StateMap["type"]; //type==1 新增   ==2 //删除修改
    if (type == "1") {
      print("新增");
    } else if (type == "2") {
      projectDtoModel = widget.StateMap["model"];

      setState(() {
        //项目名称
        projectNameStr = projectDtoModel.projectName ?? "";
        projectController.text = projectNameStr;
        //项目开始时间
        if (projectDtoModel.projectStartDate != null) {
          DateTime time =
              DateTime.parse("${projectDtoModel.projectStartDate}-01");
          JoinindustryStr = PDuration(
              year: time.year, month: time.month, day: time.day); //入学时间 ;
        }
        //项目结束时间
        if (projectDtoModel.projectEndDate != null) {
          DateTime time =
              DateTime.parse("${projectDtoModel.projectEndDate}-01");
          EndindustryStr = PDuration(
              year: time.year, month: time.month, day: time.day); //入学时间 ;
        }

        //担任角色
        roleNameStr = projectDtoModel.position ?? "";
        roleController.text = roleNameStr;
        //所在公司
        companyNameStr = projectDtoModel.companyName ?? "";
        companyController.text = companyNameStr;
        //所在行业
        industryTypeStr = "";
        industryTypeStr_two = projectDtoModel.industryName ?? "";
        industryTypeID_two = projectDtoModel.industryId.toString();

        //项目描述
        describeController.text = projectDtoModel.description ?? "";
        describe = projectDtoModel.description ?? "";
        
        //使用技能
        selectedSkillsModelList = projectDtoModel.projectSkillList!;
        for (SkillsClassModel model in selectedSkillsModelList) {
          selectedSkillsIDList.add(model.id.toString());
          selectedSkillsTextList.add(model.skillName ?? "");
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: m_AppBar(context, "编辑项目"),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                m_textFiled(
                  onChanged: (value) {
                    setState(() {
                      projectNameStr = value;
                    });
                  },
                  hintText: "请填写项目名称",
                  //TextEditingtext: ScrollNameStr,
                  TextEditingcontoll: projectController,
                ),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2 - 10,
                      child: m_textFiledBtn(
                        onTap: () {
                          Pickers.showDatePicker(context,
                              mode: DateMode.YM,
                              selectDate: JoinindustryStr,
                              maxDate: PDuration(
                                  year: DateTime.now().year,
                                  hour: DateTime.now().month),
                              pickerStyle: ClosePickerStyle(
                                  haveRadius: true,
                                  title: "请选择开始时间"), onChanged: (p) {
                            setState(() {
                              JoinindustryStr = p;
                            });
                          });
                        },
                        hintText: "选择开始时间",
                        TextEditingtext: JoinindustryStr == null
                            ? ""
                            : "${JoinindustryStr!.year}-${JoinindustryStr!.month}",
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      height: 40,
                      child: Text(
                        "至",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2 - 10,
                      child: m_textFiledBtn(
                        onTap: () {
                          Pickers.showDatePicker(context,
                              mode: DateMode.YM,
                              selectDate: EndindustryStr,
                              minDate: JoinindustryStr,
                              pickerStyle: ClosePickerStyle(
                                  haveRadius: true,
                                  title: "选择结束时间"), onChanged: (p) {
                            setState(() {
                              EndindustryStr = p;
                            });
                          });
                        },
                        hintText: "选择结束时间",
                        TextEditingtext: EndindustryStr == null
                            ? ""
                            : "${EndindustryStr!.year}-${EndindustryStr!.month}",
                      ),
                    ),
                  ],
                ),
                m_textFiled(
                  onChanged: (value) {
                    setState(() {
                      roleNameStr = value;
                    });
                  },
                  hintText: "请填写担任角色",
                  //TextEditingtext: ScrollNameStr,
                  TextEditingcontoll: roleController,
                ),
                m_textFiled(
                  onChanged: (value) {
                    setState(() {
                      companyNameStr = value;
                    });
                  },
                  hintText: "请填写所在公司",
                  //TextEditingtext: ScrollNameStr,
                  TextEditingcontoll: companyController,
                ),
                m_textFiledBtn(
                  onTap: () {
                    Pickers.showMultiLinkPicker(context,
                        data: industryTypeTextDic,
                        columeNum: 2,
                        selectData: [industryTypeStr, industryTypeStr_two],
                        pickerStyle: ClosePickerStyle(
                          haveRadius: true,
                          title: "请选择行业",
                        ), onChanged: (p, index) {
                      setState(() {
                        industryTypeStr = industryTypeList[index[0]].name!;
                        industryTypeStr_two = industryTypeList[index[0]]
                            .children![index[1]]
                            .name!;

                        industryTypeID_two =
                            (industryTypeList[index[0]].children![index[1]].id)
                                .toString();
                      });
                    });
                  },
                  hintText: "请选择行业",
                  TextEditingtext: industryTypeStr.length <= 0
                      ? industryTypeStr_two
                      : "${industryTypeStr}-${industryTypeStr_two}",
                ),
                m_textFiledBtn(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(choose_skillsView.routeName, arguments: projectDtoModel)
                        .then((value) {
                      List<SkillsClassModel>? list =
                          value as List<SkillsClassModel>?;
                      setState(() {
                        selectedSkillsIDList = [];
                        selectedSkillsTextList = [];
                        for (SkillsClassModel model in list!) {
                          selectedSkillsIDList.add(model.id.toString());
                          selectedSkillsTextList.add(model.skillName ?? "");
                        }
                        selectedSkillsModelList = list;
                      });
                    });
                  },
                  hintText: "请选择使用技能",
                  TextEditingtext:
                      m_tools.getTaskScreen(selectedSkillsTextList),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(16, 4, 0, 0),
                  child: Text(
                    "为了提高你的竞争力，请尽量丰富你的技能标签",
                    style: TextStyle(color: m_colors.backColor, fontSize: 12),
                  ),
                ),
                m_textFiledBtn(
                  onTap: () {
                    showBottonView(context);
                  },
                  hintText: "请填写",
                  TextEditingtext: describe,
                ),
              ],
            ),
          ),
          Positioned(
            child: Container(
                color: Colors.white,
                padding: EdgeInsets.fromLTRB(16, 17, 16, 17),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 50,
                        child: m_Button_border(
                          text: type == "1" ? "保存" : "删除",
                          OnPressed: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                            if (type == "1") {
                              saveData(() {
                                Navigator.of(context).pop();
                              });
                            } else if (type == "2") {
                              //删除
                              EasyLoading.show(status: "删除中...");
                              PersonalService.deleteProject(
                                  projectDtoModel.id.toString(), (object) {
                                if (object.isSuccess) {
                                  EasyLoading.showToast("删除成功");
                                  Navigator.of(context).pop();
                                } else {
                                  EasyLoading.showToast(object.message!);
                                }
                              });
                            }
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        height: 50,
                        child: m_Button(
                          text: type == "1" ? "保存并添加下一条" : "保存",
                          OnPressed: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                            if (type == "1") {
                              //保存并添加下一条

                              saveData(() {
                                setState(() {
                                  //项目名称
                                  projectNameStr = "";
                                  projectController.text = "";
                                  //项目开始时间
                                  JoinindustryStr = null;
                                  EndindustryStr = null;

                                  //担任角色
                                  roleNameStr = "";
                                  roleController.text = "";
                                  //所在公司
                                  companyNameStr = "";
                                  companyController.text = "";
                                  //所在行业
                                  industryTypeStr = "";
                                  industryTypeStr_two = "";
                                  industryTypeID_two = "";

                                  //项目描述
                                  describeController.text = "";

                                  //使用技能
                                  selectedSkillsModelList = [];
                                  selectedSkillsIDList = [];
                                  selectedSkillsTextList = [];
                                });
                              });
                            } else if (type == "2") {
                              //修改
                              saveData(() {
                                Navigator.of(context).pop();
                              });
                            }
                          },
                        ),
                      ),
                    )
                  ],
                )),
            bottom: iskeyBoard(context),
            left: 0,
            right: 0,
            height: 80,
          )
        ],
      ),
    );
  }

  showBottonView(BuildContext content) {
    showCupertinoModalPopup(
        context: content,
        builder: (BuildContext content) {
          return textFiledView(content);
        });
  }

  Widget textFiledView(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 1.2,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(25.0),
              topRight: const Radius.circular(25.0)),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "项目描述",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: m_colors.title_01_color),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.close,
                          color: m_colors.title_01_color,
                        )),
                  ],
                ),
                TextField(
                  controller: describeController,
                  minLines: 1,
                  maxLines: 12,
                  decoration: InputDecoration(
                    hintText: "请输入项目描述",
                    hintStyle: TextStyle(color: m_colors.content_02_color),
                    border: InputBorder.none,
                  ),
                  style:
                      TextStyle(fontSize: 14, color: m_colors.title_01_color),
                )
              ],
            ),

            //保存按钮
            Positioned(
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.fromLTRB(0, 17, 0, 17),
                child: m_Button(
                  text: "保存",
                  OnPressed: () {
                    setState(() {
                      describe = describeController.text;
                    });
                    Navigator.pop(context);
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                ),
              ),
              bottom: iskeyBoard(context),
              left: 0,
              right: 0,
              height: 80,
            )
          ],
        ));
  }

  saveData(Function() onSuccess) {
    if (isValidation()) {
      //保存
      String joinTime = m_tools.stringFormat(
          DateTime(JoinindustryStr!.year!, JoinindustryStr!.month!));

      String endTime = m_tools.stringFormat(
          DateTime(EndindustryStr!.year!, EndindustryStr!.month!));

      if (type == "1") {
        EasyLoading.show(status: "保存中...");
        PersonalService.saveProject(
            projectNameStr,
            joinTime,
            endTime,
            roleNameStr,
            companyNameStr,
            industryTypeID_two,
            describeController.text,
            selectedSkillsIDList, (object) {
          if (object.isSuccess) {
            EasyLoading.showToast("保存成功");
            onSuccess();
          } else {
            EasyLoading.showToast(object.message!);
          }
        });
      } else if (type == "2") {
        //修改

        EasyLoading.show(status: "修改中...");
        PersonalService.putUpdateProject(
            projectNameStr,
            joinTime,
            endTime,
            roleNameStr,
            companyNameStr,
            industryTypeID_two,
            describeController.text,
            selectedSkillsIDList,
            projectDtoModel.id.toString(), (object) {
          if (object.isSuccess) {
            EasyLoading.showToast("修改成功");
            onSuccess();
          } else {
            EasyLoading.showToast(object.message!);
          }
        });
      }
    }
  }

  bool isValidation() {
    if (projectNameStr.length <= 0) {
      EasyLoading.showToast("项目名称不能为空");
      return false;
    } else if (JoinindustryStr == null) {
      EasyLoading.showToast("开始时间不能为空");
      return false;
    } else if (EndindustryStr == null) {
      EasyLoading.showToast("结束时间不能为空");
      return false;
    } else if (roleNameStr.length <= 0) {
      EasyLoading.showToast("担任角色不能为空");
      return false;
    } else if (companyNameStr.length <= 0) {
      EasyLoading.showToast("所在公司不能为空");
      return false;
    } else if (industryTypeID_two.length <= 0) {
      EasyLoading.showToast("行业不能为空");
      return false;
    } else if (selectedSkillsIDList.length <= 0) {
      EasyLoading.showToast("技能标签不能为空");
      return false;
    } else if (describeController.text.length <= 0) {
      EasyLoading.showToast("项目描述不能为空");
      return false;
    } else {
      return true;
    }
  }

  double iskeyBoard(BuildContext context) {
    if (MediaQuery.of(context).viewInsets.bottom > 30) {
      return MediaQuery.of(context).viewInsets.bottom;
    } else {
      return 30;
    }
  }
}
