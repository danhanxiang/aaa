import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_pickers/pickers.dart';
import 'package:flutter_pickers/style/default_style.dart';
import 'package:people_living_flutterdemo/core/components/m_AppBar.dart';
import 'package:people_living_flutterdemo/core/service/personal_api/personal_api.dart';

import '../../../../core/components/m_mainButton.dart';
import '../../../../core/components/m_textFiled.dart';
import '../../../../core/models/index.dart';

class add_professionalView extends StatefulWidget {
  static const String routeName = '/add_professional';
  add_professionalView({Key? key, required this.userDataModel})
      : super(key: key);

  Person_inUuserData userDataModel;

  @override
  State<add_professionalView> createState() => _add_professionalViewState();
}

class _add_professionalViewState extends State<add_professionalView> {
//职业方向
  String PositionStr = "";
  String PositionID = "";
  List<PositonTypeModel> PositionModelList = [];
  List PositiontextList = [];
//工作时间
  String WorkAgeStr = "";
  String WorkAgeID = "";
  List<WorkAgeModel> workAgeModelList = [];
  List workAgetextList = [];

  String PriceStr = ""; //服务价格
  String minPriceStr = ""; //最低服务价格
  String maxPriceStr = ""; //最高服务价格
  String WorktypeStr = ""; //工作方式
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PersonalService.getPositionType((object) {
      if (object.isSuccess) {
        setState(() {
          PositionModelList = object.data;
          for (var model in PositionModelList) {
            PositiontextList.add(model.name);
          }
        });
      } else {
        EasyLoading.showToast("职业方向数据获取失败");
      }
    });
    PersonalService.getWorkAgRequirements((object) {
      if (object.isSuccess) {
        setState(() {
          workAgeModelList = object.data;
          for (var model in workAgeModelList) {
            workAgetextList.add(model.name);
          }
        });
      } else {
        EasyLoading.showToast("工作年限数据获取失败");
      }
    });

    //赋值
    setState(() {
      //职业方向

      PositionStr = widget.userDataModel.careerDto?.careerDirectionName ?? "";
      PositionID =
          (widget.userDataModel.careerDto?.careerDirectionId ?? "").toString();

      //工作时间
      WorkAgeStr = widget.userDataModel.careerDto?.workYearsName ?? "";
      WorkAgeID =
          (widget.userDataModel.careerDto?.workYearsId ?? "").toString();

      PriceStr =
          (widget.userDataModel.careerDto?.curSalary ?? "").toString(); //服务价格
      if (widget.userDataModel.workModeDtoList != null) {
        if (widget.userDataModel.workModeDtoList!.length > 0) {
          minPriceStr = widget.userDataModel.workModeDtoList![0].lowestSalary
              .toString(); //最低服务价格

          maxPriceStr = widget.userDataModel.workModeDtoList![0].highestSalary
              .toString(); //最高服务价格
          WorktypeStr = widget.userDataModel.workModeDtoList![0].workDayModeName
              .toString(); //工作方式
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: m_AppBar(context, "编辑职业信息"),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                m_textFiledBtn(
                  onTap: () {
                    Pickers.showSinglePicker(context,
                        data: PositiontextList,
                        selectData: PositionStr,
                        pickerStyle: ClosePickerStyle(
                          haveRadius: true,
                          title: "请选择职业方向",
                        ), onChanged: (p, index) {
                      print(index);
                      setState(() {
                        PositionStr = p;
                        PositionID = PositionModelList[index].id.toString();
                      });
                    });
                  },
                  hintText: "请选择职业方向",
                  TextEditingtext: PositionStr,
                ),
                m_textFiledBtn(
                  onTap: () {
                    Pickers.showSinglePicker(context,
                        data: workAgetextList,
                        selectData: WorkAgeStr,
                        pickerStyle: ClosePickerStyle(
                          haveRadius: true,
                          title: "请选择工作经验",
                        ), onChanged: (p, index) {
                      print(index);
                      setState(() {
                        WorkAgeStr = p;
                        WorkAgeID = workAgeModelList[index].id.toString();
                      });
                    });
                  },
                  hintText: "请选择工作经验",
                  TextEditingtext: WorkAgeStr,
                ),
                m_textFiled(
                  onChanged: (value) {
                    setState(() {
                      PriceStr = value;
                    });
                  },
                  hintText: "当前服务价格(元/月)",
                  TextEditingtext: PriceStr,
                  InputType: TextInputType.number,
                ),
                m_textFiledBtn(
                  onTap: () {
                    Pickers.showSinglePicker(context,
                        data: ["全日", "半日"],
                        selectData: WorktypeStr,
                        pickerStyle: ClosePickerStyle(
                          haveRadius: true,
                          title: "请选择工作方式",
                        ), onChanged: (p, index) {
                      print(index);
                      setState(() {
                        WorktypeStr = p;
                      });
                    });
                  },
                  hintText: "请选择工作方式",
                  TextEditingtext: WorktypeStr,
                ),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2 - 10,
                      child: m_textFiled(
                        onChanged: (value) {
                          setState(() {
                            minPriceStr = value;
                          });
                        },
                        hintText: "期望最低价格(元/月)",
                        TextEditingtext: minPriceStr,
                        InputType: TextInputType.number,
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      height: 40,
                      child: Text(
                        "-",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2 - 10,
                      child: m_textFiled(
                        onChanged: (value) {
                          setState(() {
                            maxPriceStr = value;
                          });
                        },
                        hintText: "期望高价格(元/月)",
                        TextEditingtext: maxPriceStr,
                        InputType: TextInputType.number,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(16, 17, 16, 17),
              child: m_Button(
                text: "保存",
                OnPressed: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  if (isValidation()) {
                    EasyLoading.show(status: "保存中...");
                    PersonalService.savePosition(
                        PositionID,
                        PriceStr,
                        maxPriceStr,
                        minPriceStr,
                        WorktypeStr == "全日" ? "1" : "2",
                        WorkAgeID, (object) {
                      if (object.isSuccess) {
                        EasyLoading.showToast("保存成功");
                        Navigator.of(context).pop();
                      } else {
                        EasyLoading.showToast(object.message!);
                      }
                    });
                  }
                },
              ),
            ),
            bottom: iskeyBoard(),
            left: 0,
            right: 0,
            height: 80,
          )
        ],
      ),
    );
  }

  double iskeyBoard() {
    if (MediaQuery.of(context).viewInsets.bottom > 30) {
      return 30 + MediaQuery.of(context).viewInsets.bottom - 30;
    } else {
      return 30;
    }
  }

  bool isValidation() {
    if (PositionID.length <= 0) {
      EasyLoading.showToast("职业方向不能为空");
      return false;
    } else if (WorkAgeID.length <= 0) {
      EasyLoading.showToast("工作时间不能为空");
      return false;
    } else if (PriceStr.length <= 0) {
      EasyLoading.showToast("服务价格不能为空");
      return false;
    } else if (WorktypeStr.length <= 0) {
      EasyLoading.showToast("工作方式不能为空");
      return false;
    } else if (int.parse(minPriceStr) <= 0) {
      EasyLoading.showToast("期望最低价格不能为空");
      return false;
    } else if (int.parse(maxPriceStr) <= 0) {
      EasyLoading.showToast("期望最高价格不能为空");
      return false;
    } else if (int.parse(minPriceStr) > int.parse(maxPriceStr)) {
      EasyLoading.showToast("最低价格不能大于最高价格");
      return false;
    } else {
      return true;
    }
  }
}
