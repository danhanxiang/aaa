import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_pickers/pickers.dart';
import 'package:flutter_pickers/style/default_style.dart';
import 'package:flutter_pickers/time_picker/model/date_mode.dart';
import 'package:flutter_pickers/time_picker/model/pduration.dart';
import 'package:people_living_flutterdemo/ProjectConfig/user_manager.dart';
import 'package:people_living_flutterdemo/core/components/m_AppBar.dart';
import 'package:people_living_flutterdemo/core/service/personal_api/personal_api.dart';

import '../../../../core/components/m_mainButton.dart';
import '../../../../core/components/m_textFiled.dart';
import 'package:people_living_flutterdemo/ProjectConfig/tools.dart';

import '../../../../core/models/index.dart';

class add_workExperience extends StatefulWidget {
  static const String routeName = '/add_workExperience';
  add_workExperience({Key? key, required this.StateMap}) : super(key: key);
  Map StateMap;
  @override
  State<add_workExperience> createState() => _add_workExperienceState();
}

class _add_workExperienceState extends State<add_workExperience> {
  String type = ""; //页面状态
  Person_workExperienceDto workExperienceDtoModel = Person_workExperienceDto();

  String companyNameStr = ""; //公司名称
  TextEditingController companyNameController = TextEditingController();
  //所在行业
  String industryTypeStr = "";
  String industryTypeStr_two = "";
  String industryTypeID_two = "";

  List<IndustryModel> industryTypeList = [];
  Map industryTypeTextDic = {};
//职业名称
  String PositionNameStr = "";
  TextEditingController PositionNameController = TextEditingController();

  PDuration? JoinindustryStr; //入职时间 ;
  PDuration? EndindustryStr; //离职时间
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //赋值
    type = widget.StateMap["type"]; //type==1 新增   ==2 //删除修改
    if (type == "1") {
      print("新增");
    } else if (type == "2") {
      //修改
      workExperienceDtoModel = widget.StateMap["model"];
      companyNameStr = workExperienceDtoModel.companyName ?? ""; //公司名称
      companyNameController.text = companyNameStr;
      //所在行业
      industryTypeStr = "";

      industryTypeStr_two = workExperienceDtoModel.industryName ?? "";
      industryTypeID_two = (workExperienceDtoModel.industryId ?? "").toString();

      PositionNameStr = workExperienceDtoModel.positionName ?? ""; //职业名称
      PositionNameController.text = PositionNameStr;

      if (workExperienceDtoModel.workStartTime != null) {
        DateTime time =
            DateTime.parse("${workExperienceDtoModel.workStartTime}-01");
        JoinindustryStr = PDuration(
            year: time.year, month: time.month, day: time.day); //入学时间 ;
      }
      if (workExperienceDtoModel.workEndTime != null) {
        DateTime time =
            DateTime.parse("${workExperienceDtoModel.workEndTime}-01");
        EndindustryStr = PDuration(
            year: time.year, month: time.month, day: time.day); //入学时间 ;
      }
    }

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: m_AppBar(context, type == "1" ? "添加工作经历" : "编辑工作经历"),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                m_textFiled(
                  onChanged: (value) {
                    setState(() {
                      companyNameStr = value;
                    });
                  },
                  hintText: "请填写公司名称",
                  //TextEditingtext: ScrollNameStr,
                  TextEditingcontoll: companyNameController,
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
                m_textFiled(
                  onChanged: (value) {
                    setState(() {
                      PositionNameStr = value;
                    });
                  },
                  hintText: "请填写职业名称",
                  //TextEditingtext: professionalStr,
                  TextEditingcontoll: PositionNameController,
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
                                  title: "请选择入职时间"), onChanged: (p) {
                            setState(() {
                              JoinindustryStr = p;
                            });
                          });
                        },
                        hintText: "入职时间",
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
                                  title: "请选择离职时间"), onChanged: (p) {
                            setState(() {
                              EndindustryStr = p;
                            });
                          });
                        },
                        hintText: "离职时间",
                        TextEditingtext: EndindustryStr == null
                            ? ""
                            : "${EndindustryStr!.year}-${EndindustryStr!.month}",
                      ),
                    ),
                  ],
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
                              PersonalService.deleteWorkExperience(
                                  (workExperienceDtoModel.id ?? "").toString(),
                                  (object) {
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
                                  companyNameStr = ""; //公司名称
                                  companyNameController.text = "";
                                  //所在行业
                                  industryTypeStr = "";

                                  industryTypeStr_two = "";
                                  industryTypeID_two = "";

                                  //职业名称
                                  PositionNameStr = "";
                                  PositionNameController.text = "";

                                  JoinindustryStr = null; //入职时间 ;
                                  EndindustryStr = null; //离职时间
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
            bottom: iskeyBoard(),
            left: 0,
            right: 0,
            height: 80,
          )
        ],
      ),
    );
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
        PersonalService.saveWorkExperience(
            User.userInfo.id.toString(),
            companyNameStr,
            industryTypeID_two,
            PositionNameStr,
            joinTime,
            endTime, (object) {
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
        PersonalService.putUpdateWorkExperience(
            User.userInfo.id.toString(),
            companyNameStr,
            industryTypeID_two,
            PositionNameStr,
            joinTime,
            endTime,
            (workExperienceDtoModel.id ?? "").toString(), (object) {
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
    if (companyNameStr.length <= 0) {
      EasyLoading.showToast("公司名称不能为空");
      return false;
    } else if (industryTypeID_two.length <= 0) {
      EasyLoading.showToast("行业为空");
      return false;
    } else if (PositionNameStr.length <= 0) {
      EasyLoading.showToast("职业不能为空");
      return false;
    } else if (JoinindustryStr == null) {
      EasyLoading.showToast("入职时间不能为空");
      return false;
    } else if (EndindustryStr == null) {
      EasyLoading.showToast("离职时间不能为空");
      return false;
    } else {
      return true;
    }
  }

  double iskeyBoard() {
    if (MediaQuery.of(context).viewInsets.bottom > 30) {
      return 30 + MediaQuery.of(context).viewInsets.bottom - 30;
    } else {
      return 30;
    }
  }
}
