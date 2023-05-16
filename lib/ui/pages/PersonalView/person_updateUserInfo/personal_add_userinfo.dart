import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_pickers/more_pickers/init_data.dart';
import 'package:flutter_pickers/style/default_style.dart';
import 'package:flutter_pickers/time_picker/model/date_mode.dart';
import 'package:flutter_pickers/time_picker/model/pduration.dart';
import 'package:people_living_flutterdemo/ProjectConfig/tools.dart';
import 'package:people_living_flutterdemo/ProjectConfig/user_manager.dart';
import 'package:people_living_flutterdemo/core/components/m_AppBar.dart';
import 'package:people_living_flutterdemo/core/components/m_mainButton.dart';
import 'package:people_living_flutterdemo/core/components/m_textFiled.dart';
import 'package:flutter_pickers/pickers.dart';
import 'package:people_living_flutterdemo/core/service/personal_api/personal_api.dart';

import '../../../../core/models/index.dart';

class add_userInfoView extends StatefulWidget {
  static const String routeName = '/add_userInfo';
  add_userInfoView({Key? key, required this.userDataModel}) : super(key: key);
  late Person_inUuserData userDataModel;
  @override
  State<add_userInfoView> createState() => _add_userInfoViewState();
}

class _add_userInfoViewState extends State<add_userInfoView> {
  late List<Province> proLists;
  String addNameText = "";
  String addSexText = "";
  PDuration? addAgeText;
  //区域
  String initProvince = '', initCity = '', initTown = '';
  String chooseProvinceID = '', chooseCityID = '', chooseTownID = '';
  //远程工作原因
  String addworkText = "";
  String addworkTextID = "";
  List workWhyLists = [];
  List<WorkWhy> workWhyModels = [];

  Map multiData = new Map();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //地区数据源
    proLists = User.provinceList;
    multiData = m_tools.getProvince(proLists);
    //远程工作原因数据源
    PersonalService.getworkWhy((object) {
      if (object.isSuccess) {
        List a = [];
        for (WorkWhy model in object.data) {
          a.add(model.name);
        }
        setState(() {
          workWhyModels = object.data;
          workWhyLists = a;
        });
      } else {
        EasyLoading.showToast("远程工作原因获取失败");
      }
    });

    setState(() {
      //有数据，赋值
      //姓名
      addNameText = widget.userDataModel.realName ?? "";
      //年龄
      if (widget.userDataModel.sex != null) {
        addSexText = widget.userDataModel.sex == 0 ? "男" : "女";
      }
      if (widget.userDataModel.birthday != null) {
        DateTime time = DateTime.parse(widget.userDataModel.birthday!);
        addAgeText =
            PDuration(year: time.year, month: time.month, day: time.day);
      }

      //区域
      initProvince = widget.userDataModel.provinceName ?? "";
      initCity = widget.userDataModel.cityName ?? "";
      initTown = widget.userDataModel.areasName ?? "";
      chooseProvinceID = widget.userDataModel.provinceId.toString();
      chooseCityID = widget.userDataModel.cityId.toString();
      chooseTownID = widget.userDataModel.areasId.toString();
      //远程工作原因
      addworkText = widget.userDataModel.remoteWorkReasonStr ?? "";
      addworkTextID = widget.userDataModel.remoteWorkReason.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: m_AppBar(context, "编辑基本信息"),
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  //姓名
                  m_textFiled(
                    onChanged: (value) {
                      setState(() {
                        addNameText = value;
                      });
                    },
                    hintText: "请输入姓名",
                    TextEditingtext: addNameText,
                  ),

                  //性别
                  m_textFiledBtn(
                    onTap: () {
                      Pickers.showSinglePicker(context,
                          data: PickerDataType.sex,
                          selectData: addAgeText,
                          pickerStyle: ClosePickerStyle(
                              haveRadius: true,
                              title: "请选择性别"), onChanged: (p, position) {
                        setState(() {
                          addSexText = p;
                        });
                      });
                    },
                    hintText: "请选择性别",
                    TextEditingtext: addSexText,
                  ),

                  //出生日期
                  m_textFiledBtn(
                    onTap: () {
                      Pickers.showDatePicker(context,
                          mode: DateMode.YMD,
                          selectDate: addAgeText,
                          pickerStyle: ClosePickerStyle(
                              haveRadius: true,
                              title: "请选择出生日期"), onChanged: (p) {
                        setState(() {
                          addAgeText = p;
                        });
                      });
                    },
                    hintText: "请选择出生日期",
                    TextEditingtext: addAgeText == null
                        ? ""
                        : "${addAgeText!.year}-${addAgeText!.month}-${addAgeText!.day}",
                  ),
                  //居住地
                  m_textFiledBtn(
                    onTap: () {
                      Pickers.showMultiLinkPicker(
                        context,
                        data: multiData,
                        selectData: [initProvince, initCity, initTown],
                        columeNum: 3,
                        suffix: ['', '', ''],
                        pickerStyle: ClosePickerStyle(
                            haveRadius: true, title: "请选择当前居住地"),
                        onChanged: (p, index) {
                          setState(() {
                            initProvince = p[0];
                            initCity = p[1];
                            initTown = p[2];
                            List list =
                                m_tools.getIndexProvince(proLists, index);
                            chooseProvinceID = list[0];
                            chooseCityID = list[1];
                            chooseTownID = list[2];
                          });
                          print(p);
                          print(index);
                        },
                      );
                    },
                    hintText: "请选择当前居住地",
                    TextEditingtext: "${initProvince}${initCity}${initTown}",
                  ),
                  //性别
                  m_textFiledBtn(
                    onTap: () {
                      Pickers.showSinglePicker(context,
                          data: workWhyLists,
                          selectData: addworkText,
                          pickerStyle: ClosePickerStyle(
                            haveRadius: true,
                            title: "远程工作原因",
                          ), onChanged: (p, index) {
                        print(index);
                        setState(() {
                          WorkWhy workModel = workWhyModels[index];
                          addworkTextID = workModel.id.toString();
                          addworkText = p;
                        });
                      });
                    },
                    hintText: "请选择远程工作原因",
                    TextEditingtext: addworkText,
                  ),
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
                      String sex = (addSexText == "男") ? "0" : "1";
                      String age = m_tools.stringFormat(DateTime(
                          addAgeText!.year!,
                          addAgeText!.month!,
                          addAgeText!.day!));

                      EasyLoading.show(status: "保存中...");
                      PersonalService.saveUserInfo(
                          User.userInfo.id.toString(),
                          addNameText,
                          sex,
                          age,
                          chooseProvinceID,
                          chooseCityID,
                          chooseTownID,
                          addworkTextID, (object) {
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
        ));
  }

  double iskeyBoard() {
    if (MediaQuery.of(context).viewInsets.bottom > 30) {
      return 30 + MediaQuery.of(context).viewInsets.bottom - 30;
    } else {
      return 30;
    }
  }

  bool isValidation() {
    if (addNameText.length <= 0) {
      EasyLoading.showToast("姓名不能为空");
      return false;
    } else if (addSexText.length <= 0) {
      EasyLoading.showToast("性别不能为空");
      return false;
    } else if (addAgeText == null) {
      EasyLoading.showToast("出生日期不能为空");
      return false;
    } else if (initProvince.length <= 0 || initCity.length <= 0) {
      EasyLoading.showToast("居住地不能为空");
      return false;
    } else if (addworkText.length <= 0) {
      EasyLoading.showToast("远程工作原因不能为空");
      return false;
    } else {
      return true;
    }
  }
}
