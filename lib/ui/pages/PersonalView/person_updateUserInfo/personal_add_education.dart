import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_pickers/pickers.dart';
import 'package:flutter_pickers/style/default_style.dart';
import 'package:flutter_pickers/time_picker/model/date_mode.dart';
import 'package:flutter_pickers/time_picker/model/pduration.dart';
import 'package:people_living_flutterdemo/core/components/m_AppBar.dart';
import 'package:people_living_flutterdemo/core/service/personal_api/personal_api.dart';
import 'package:people_living_flutterdemo/ProjectConfig/tools.dart';
import '../../../../core/components/m_mainButton.dart';
import '../../../../core/components/m_textFiled.dart';
import '../../../../core/models/index.dart';

class add_educationView extends StatefulWidget {
  static const String routeName = '/add_education';
  add_educationView({Key? key, required this.StateMap}) : super(key: key);
  Map StateMap;
  @override
  State<add_educationView> createState() => _add_educationViewState();
}

class _add_educationViewState extends State<add_educationView> {
  String type = ""; //页面状态
  late Person_educationDto educationDtoModel;

  String ScrollNameStr = ""; //院校名称

  String professionalStr = ""; //专业
  PDuration? JoinScrollStr; //入学时间 ;
  PDuration? EndScrollStr; //毕业时间
  //学历
  String ScrollRecordStr = "";
  String ScrollRecordID = "";
  List<RecordScrollModel> ScrollRecordList = [];
  List ScrollRecordTextList = [];

  //培养方式
  String ScrollTypeStr = "";
  String ScrollTypeID = "";
  List<CultivateModel> ScrollTypeList = [];
  List ScrollTypeTextList = [];

  TextEditingController ScrollNameController = TextEditingController();
  TextEditingController professionalController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PersonalService.getScrollRecord((object) {
      if (object.isSuccess) {
        setState(() {
          ScrollRecordList = object.data;
          for (var item in ScrollRecordList) {
            ScrollRecordTextList.add(item.name);
          }
        });
      }
    });
    PersonalService.getCultivatingWay((object) {
      if (object.isSuccess) {
        setState(() {
          ScrollTypeList = object.data;
          for (var item in ScrollTypeList) {
            ScrollTypeTextList.add(item.name);
          }
        });
      }
    });

    type = widget.StateMap["type"]; //type==1 新增   ==2 //删除修改
    if (type == "1") {
      print("新增");
    } else if (type == "2") {
      educationDtoModel = widget.StateMap["model"];
      ScrollNameStr = educationDtoModel.collegeName ?? ""; //院校名称
      ScrollNameController.text = ScrollNameStr;
      //学历
      ScrollRecordStr = educationDtoModel.educationName ?? "";
      ScrollRecordID = (educationDtoModel.educationId ?? "").toString();
      professionalStr = educationDtoModel.major ?? ""; //专业
      professionalController.text = professionalStr;
      if (educationDtoModel.inSchoolStartTime != null) {
        DateTime time =
            DateTime.parse("${educationDtoModel.inSchoolStartTime}-01");
        JoinScrollStr = PDuration(
            year: time.year, month: time.month, day: time.day); //入学时间 ;
      }
      if (educationDtoModel.inSchoolEndTime != null) {
        DateTime time =
            DateTime.parse("${educationDtoModel.inSchoolEndTime}-01");
        EndScrollStr = PDuration(
            year: time.year, month: time.month, day: time.day); //入学时间 ;
      }
      //培养方式
      ScrollTypeStr = educationDtoModel.trainingModeName ?? "";
      ScrollTypeID = (educationDtoModel.trainingMode ?? "").toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: m_AppBar(context, type == "1" ? "添加教育经历" : "编辑教育经历"),
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
                      ScrollNameStr = value;
                    });
                  },
                  hintText: "请填写院校名称",
                  //TextEditingtext: ScrollNameStr,
                  TextEditingcontoll: ScrollNameController,
                ),
                m_textFiledBtn(
                  onTap: () {
                    Pickers.showSinglePicker(context,
                        data: ScrollRecordTextList,
                        selectData: ScrollRecordStr,
                        pickerStyle: ClosePickerStyle(
                          haveRadius: true,
                          title: "请选择学历",
                        ), onChanged: (p, index) {
                      print(index);
                      setState(() {
                        ScrollRecordStr = p;
                        ScrollRecordID = ScrollRecordList[index].id.toString();
                      });
                    });
                  },
                  hintText: "请选择学历",
                  TextEditingtext: ScrollRecordStr,
                ),
                m_textFiled(
                  onChanged: (value) {
                    setState(() {
                      professionalStr = value;
                    });
                  },
                  hintText: "请填写专业",
                  //TextEditingtext: professionalStr,
                  TextEditingcontoll: professionalController,
                ),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2 - 10,
                      child: m_textFiledBtn(
                        onTap: () {
                          Pickers.showDatePicker(context,
                              mode: DateMode.YM,
                              selectDate: JoinScrollStr,
                              maxDate: PDuration(
                                  year: DateTime.now().year,
                                  hour: DateTime.now().month),
                              pickerStyle: ClosePickerStyle(
                                  haveRadius: true,
                                  title: "请选择入学时间"), onChanged: (p) {
                            setState(() {
                              JoinScrollStr = p;
                            });
                          });
                        },
                        hintText: "入学时间",
                        TextEditingtext: JoinScrollStr == null
                            ? ""
                            : "${JoinScrollStr!.year}-${JoinScrollStr!.month}",
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
                              selectDate: EndScrollStr,
                              minDate: JoinScrollStr,
                              pickerStyle: ClosePickerStyle(
                                  haveRadius: true,
                                  title: "请选择毕业时间"), onChanged: (p) {
                            setState(() {
                              EndScrollStr = p;
                            });
                          });
                        },
                        hintText: "毕业时间",
                        TextEditingtext: EndScrollStr == null
                            ? ""
                            : "${EndScrollStr!.year}-${EndScrollStr!.month}",
                      ),
                    ),
                  ],
                ),
                m_textFiledBtn(
                  onTap: () {
                    Pickers.showSinglePicker(context,
                        data: ScrollTypeTextList,
                        selectData: ScrollTypeStr,
                        pickerStyle: ClosePickerStyle(
                          haveRadius: true,
                          title: "请选择培养方式",
                        ), onChanged: (p, index) {
                      print(index);
                      setState(() {
                        ScrollTypeStr = p;
                        ScrollTypeID = ScrollTypeList[index].id.toString();
                      });
                    });
                  },
                  hintText: "请选择培养方式",
                  TextEditingtext: ScrollTypeStr,
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
                              PersonalService.deleteEducation(
                                  (educationDtoModel.id ?? "").toString(),
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
                                  ScrollNameStr = ""; //院校名称
                                  professionalStr = ""; //专业
                                  JoinScrollStr = null; //入学时间 ;
                                  EndScrollStr = null; //毕业时间
                                  //学历
                                  ScrollRecordStr = "";
                                  ScrollRecordID = "";
                                  //培养方式
                                  ScrollTypeStr = "";
                                  ScrollTypeID = "";
                                  professionalController.text = "";
                                  ScrollNameController.text = "";
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
      String joinTime = m_tools
          .stringFormat(DateTime(JoinScrollStr!.year!, JoinScrollStr!.month!));

      String endTime = m_tools
          .stringFormat(DateTime(EndScrollStr!.year!, EndScrollStr!.month!));

      if (type == "1") {
        EasyLoading.show(status: "保存中...");
        PersonalService.saveEducation(ScrollRecordID, ScrollNameStr,
            professionalStr, joinTime, endTime, ScrollTypeID, (object) {
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
        PersonalService.putUpdateEducation(
            (educationDtoModel.id ?? "").toString(),
            ScrollRecordID,
            ScrollNameStr,
            professionalStr,
            joinTime,
            endTime,
            ScrollTypeID, (object) {
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
    if (ScrollNameStr.length <= 0) {
      EasyLoading.showToast("院校名称不能为空");
      return false;
    } else if (ScrollRecordID.length <= 0) {
      EasyLoading.showToast("学历不能为空");
      return false;
    } else if (professionalStr.length <= 0) {
      EasyLoading.showToast("专业不能为空");
      return false;
    } else if (JoinScrollStr == null) {
      EasyLoading.showToast("入学时间不能为空");
      return false;
    } else if (EndScrollStr == null) {
      EasyLoading.showToast("毕业时间不能为空");
      return false;
    } else if (ScrollTypeID.length <= 0) {
      EasyLoading.showToast("培养方式不能为空");
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
