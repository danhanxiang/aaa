import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_pickers/pickers.dart';
import 'package:flutter_pickers/style/default_style.dart';
import 'package:flutter_pickers/time_picker/model/date_mode.dart';
import 'package:flutter_pickers/time_picker/model/pduration.dart';
import 'package:people_living_flutterdemo/core/components/m_AppBar.dart';
import 'package:people_living_flutterdemo/core/service/firm_position_api/firm_position_api.dart';
import 'package:people_living_flutterdemo/core/service/personal_api/personal_api.dart';
import 'package:people_living_flutterdemo/ProjectConfig/tools.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/person_updateUserInfo/personal_careerDirection.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/person_updateUserInfo/personal_choose_skills.dart';
import 'package:people_living_flutterdemo/utils/utils.dart';
import '../../../../core/components/m_mainButton.dart';
import '../../../../core/components/m_textFiled.dart';
import '../../../../core/models/FirmPositionModel/firm_info_id_bean_entity.dart';
import '../../../../core/models/FirmPositionModel/firm_position_entity.dart';
import '../../../../core/models/index.dart';
import '../../../../core/models/otherModel/OtherManager.dart';

class firm_publish_position_view extends StatefulWidget {
  static const String routeName = '/firm/publish_position';

  firm_publish_position_view({Key? key, required this.StateMap})
      : super(key: key);
  Map StateMap;

  // Person_inUuserData userDataModel;

  @override
  State<firm_publish_position_view> createState() =>
      _firm_publish_position_viewState();
}

class _firm_publish_position_viewState
    extends State<firm_publish_position_view> {
  String careerDirectionId = ''; //职业方向id
  String careerDirectionName = ""; //职业方向
  String careerPosition = ""; //职位名称
  String educationId = ""; //学历id
  String educationName = ""; //学历
  String trainingId = ''; //培养方式id
  String trainingName = ""; //培养方式
  String workYearsId = ''; //工作年限id
  String workYearsName = ""; //工作年限
  String startPay = "";
  String endPay = "";
  String industryMandatoryId = ''; //行业强制性
  String industryMandatoryName = "";
  String workOperId = ''; //工作方式
  String workOperName = "";
  String mCount = "";
  String mDescription = ''; //职位描述

  String type = ""; //1 发布职位  2 修改职位
  String mId = '';

  //学历
  List<RecordScrollModel> ScrollRecordList = [];
  List mEducationList = [];

  //培养方式
  List<CultivateModel> ScrollTypeList = [];
  List ScrollTypeTextList = [];

  //经验要求
  List<WorkAgeModel> workAgeModelList = [];
  List workAgetextList = [];

  //行业匹配   // 0 否 1 是
  List industrytextList = ['否', '是'];

  //工作方式
  List<IndustryModel> workTypeList = [];
  List workTypetextList = [];


  TextEditingController ScrollNameController = TextEditingController();
  TextEditingController professionalController = TextEditingController();

  //使用技能
  List<String> selectedSkillsIDList = [];
  List<String> selectedSkillsTextList = [];
  List<SkillsClassModel> selectedSkillsModelList = [];

  late FirmInfoIdBeanData beanIds;
  late FirmPositionDataList bean;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDictionaryList();
    type = widget.StateMap['type'];
    if (type == "1") {
      // 发布职位页面过来的，

    } else if (type == "2") {
      // 推荐页面过来的（修改发布职位）
      bean = widget.StateMap['model'];
      if (bean.id != 0) {
        getPositionOriginalId(bean.id!);
      }

      setState(() {
        careerDirectionName = bean.careerDirection ?? '';
        careerPosition = bean.title ?? '';
        workYearsName = bean.workYears ?? '';
        educationName = bean.education ?? '不限';
        trainingName = bean.trainingMode ?? '';
        workOperName = bean.workOper ?? '';
        industryMandatoryName = bean.industryMandatory! ? "是" : '否';

        startPay = bean.startPay.toString();
        endPay = bean.endPay.toString();
        mCount = bean.recruitCount.toString();
        mDescription = bean.description ?? '';


      });

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: m_AppBar(context, type == "1" ? "发布职位" : "修改职位"),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(bottom: 60),
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  m_textFiledBtn(
                    hintText: "职业方向",
                    TextEditingtext: careerDirectionName,
                    onTap: () {
                      Navigator.pushNamed(
                              context, personal_careerDirection.routeName)
                          .then((value) {
                        /// 拿到职业分类选中数据
                        if (value != null) {
                          OtherModel m = value as OtherModel;
                          // widget.userDataModel.careerDto?.careerDirectionName = m.name;
                          careerDirectionId = m.id.toString();

                          setState(() {
                            careerDirectionName = m.name ?? '';
                          });
                        }
                      });
                    },
                  ),
                  m_textFiled(
                    hintText: "职业名称",
                    TextEditingtext: careerPosition,
                    onChanged: (value) {
                      setState(() {
                        careerPosition = value;
                      });
                    },
                  ),
                  m_textFiledBtn(
                    hintText: "职业技能",
                    TextEditingtext: m_tools.getTaskScreen(selectedSkillsTextList),
                    onTap: () {
                      List<SkillsClassModel> projectSkillList = [];
                      projectSkillList.addAll(selectedSkillsModelList);
                      Navigator.of(context) .pushNamed(choose_skillsView.routeName, arguments: [ projectSkillList,
                        careerDirectionId
                      ]).then((value) {
                        if (value == null) {
                          return;
                        }
                        List<SkillsClassModel>? list = value as List<SkillsClassModel>?;
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
                  ),
                  m_textFiledBtn(
                    hintText: "学历",
                    TextEditingtext: educationName,
                    onTap: () {
                      Pickers.showSinglePicker(context,
                          data: mEducationList,
                          selectData: educationName,
                          pickerStyle: ClosePickerStyle(
                            haveRadius: true,
                            title: "学历",
                          ), onChanged: (p, index) {
                        setState(() {
                          educationName = p;
                          educationId = ScrollRecordList[index].id.toString();
                        });
                      });
                    },
                  ),
                  m_textFiledBtn(
                    hintText: "培养方式",
                    TextEditingtext: trainingName,
                    onTap: () {
                      Pickers.showSinglePicker(context,
                          data: ScrollTypeTextList,
                          selectData: trainingName,
                          pickerStyle: ClosePickerStyle(
                            haveRadius: true,
                            title: "培养方式",
                          ), onChanged: (p, index) {
                        print(index);
                        setState(() {
                          trainingName = p;
                          trainingId = ScrollTypeList[index].id.toString();
                        });
                      });
                    },
                  ),
                  m_textFiledBtn(
                    hintText: "经验要求",
                    TextEditingtext: workYearsName,
                    onTap: () {
                      Pickers.showSinglePicker(context,
                          data: workAgetextList,
                          selectData: workYearsName,
                          pickerStyle: ClosePickerStyle(
                            haveRadius: true,
                            title: "经验要求",
                          ), onChanged: (p, index) {
                        print(index);
                        setState(() {
                          workYearsName = p;
                          workYearsId = workAgeModelList[index].id.toString();
                        });
                      });
                    },
                  ),
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2 - 10,
                        child: m_textFiled(
                          onChanged: (value) {
                            setState(() {
                              startPay = value;
                            });
                          },
                          hintText: "最低服务价格(元/月)",
                          TextEditingtext: startPay,
                          InputType: TextInputType.number,
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        height: 40,
                        child: const Text(
                          "—",
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2 - 10,
                        child: m_textFiled(
                          onChanged: (value) {
                            setState(() {
                              endPay = value;
                            });
                          },
                          hintText: "最高服务价格(元/月)",
                          TextEditingtext: endPay,
                          InputType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                  m_textFiledBtn(
                    hintText: "行业匹配",
                    TextEditingtext: industryMandatoryName,
                    onTap: () {
                      Pickers.showSinglePicker(context,
                          data: industrytextList,
                          selectData: industryMandatoryName,
                          pickerStyle: ClosePickerStyle(
                            haveRadius: true,
                            title: "行业匹配",
                          ), onChanged: (p, index) {
                        print(index);
                        setState(() {
                          industryMandatoryName = p;
                          // ScrollTypeID = ScrollTypeList[index].id.toString();
                          industryMandatoryId =
                              industryMandatoryName == '否' ? '0' : '1';
                        });
                      });
                    },
                  ),
                  m_textFiledBtn(
                    hintText: "工作方式",
                    TextEditingtext: workOperName,
                    onTap: () {
                      Pickers.showSinglePicker(context,
                          data: workTypetextList,
                          selectData: workOperName,
                          pickerStyle: ClosePickerStyle(
                            haveRadius: true,
                            title: "工作方式",
                          ), onChanged: (p, index) {
                        print(index);
                        setState(() {
                          workOperName = p;
                          workOperId = workTypeList[index].id.toString();
                        });
                      });
                    },
                  ),
                  m_textFiled(
                    TextEditingtext: mCount,
                    onChanged: (value) {
                      setState(() {
                        mCount = value;
                      });
                    },
                    hintText: "输入需求数量",
                    InputType: TextInputType.number,
                  ),
                  m_textFiled(
                    TextEditingtext: mDescription,
                    onChanged: (value) {
                      setState(() {
                        mDescription = value;
                      });
                    },
                    hintText: "请输入要您的职位描述",
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                color: Colors.white,
                padding: EdgeInsets.fromLTRB(16, 17, 16, 17),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 50,
                        child: m_Button(
                          text: "保存",
                          OnPressed: () {
                            // FocusScope.of(context).requestFocus(FocusNode());
                            if(isValidation()){
                              if (type == "1") {
                                submitDeveloper();
                              } else if (type == "2") {
                                updateDeveloper();
                              }
                            }
                          },
                        ),
                      ),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }

  saveData(Function() onSuccess) {
    if (isValidation()) {
      if (type == "1") {
        EasyLoading.show(status: "保存中...");
        submitDeveloper();
      } else if (type == "2") {
        //修改
        EasyLoading.show(status: "修改中...");
        updateDeveloper();
      }
    }
  }

  bool isValidation() {
    if (careerDirectionId.isEmpty) {
      EasyLoading.showToast("你还没有选择职业方向");
      return false;
    } else if (careerPosition.isEmpty) {
      EasyLoading.showToast("职位名称未填写");
      return false;
      // } else if (mTagIntList.length <= 0) {
      //   EasyLoading.showToast("专业不能为空");
      //   return false;
    } else if (trainingId.isEmpty) {
      EasyLoading.showToast("你还没有选择培养方式");
      return false;
    } else if (workYearsId.isEmpty) {
      EasyLoading.showToast("你还没有选择工作年限");
      return false;
    } else if (startPay.isEmpty) {
      EasyLoading.showToast("最低服务价格未填写");
      return false;
    } else if (endPay.isEmpty) {
      EasyLoading.showToast("最高服务价格未填写");
      return false;
    } else if (startPay.contains(".") || endPay.contains(".")) {
      EasyLoading.showToast("服务价格不能输入小数");
      return false;
    } else if (double.parse(startPay) > double.parse(endPay)) {
      EasyLoading.showToast("最低服务价格不能高于最高服务价格");
      return false;
    } else if (industryMandatoryId.isEmpty) {
      EasyLoading.showToast("你还没有选择行业匹配");
      return false;
    } else if (workOperId.isEmpty) {
      EasyLoading.showToast("你还没有选择工作方式");
      return false;
    } else if (mCount.isEmpty) {
      EasyLoading.showToast("需求数量未填写");
      return false;
    } else if (mDescription.isEmpty) {
      EasyLoading.showToast("职位描述未填写");
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

  ///获取职位相关id
  void getPositionOriginalId(int positionId) {
    FirmPositionService.getPositionOriginalApi(positionId, (object) {
      if (object.isSuccess) {
        beanIds = object.data;


        setState(() {

          List<int>? idList= beanIds.careerDirectionId;
          if(idList!.length>1){
            careerDirectionId = idList[idList.length-1].toString();
          }else {
            careerDirectionId = idList[0].toString();
          }
          workYearsId = beanIds.workYearsId.toString();
          educationId = beanIds.educationId==0?'':beanIds.educationId.toString();
          trainingId =beanIds.trainingModeId.toString();
          industryMandatoryId = beanIds.industryMandatory.toString();
          workOperId = beanIds.workOperId.toString();

          mId = beanIds.id.toString();

          if (bean.skills!.isNotEmpty) {
            selectedSkillsIDList.clear();
            selectedSkillsTextList.clear();

            selectedSkillsTextList.addAll(bean.skills??[]);
            // bean.skills?.forEach((element) {
            //   selectedSkillsTextList.add(element);
            // });

            for(int i =0;i<beanIds.skillIds!.length;i++){
              SkillsClassModel skillsBean = SkillsClassModel();
              skillsBean.id = beanIds.skillIds![i];
              selectedSkillsModelList.add(skillsBean);
              selectedSkillsIDList.add(beanIds.skillIds![i].toString());
            }

            for(int i =0;i<bean.skills!.length;i++){
              selectedSkillsModelList[i].skillName = bean.skills![i];
            }


          }

        });
      }
    });
  }

  void submitDeveloper() {
    FirmPositionService.SendPositionApi(
        careerDirectionId,
        careerPosition,
        mDescription,
        mCount,
        workOperId,
        workYearsId,
        educationId ?? '',
        trainingId,
        '1',
        startPay,
        endPay,
        industryMandatoryId,
        selectedSkillsIDList,
        (object) => () {
              if (object.isSuccess) {}
            });
  }

  void updateDeveloper() {
    FirmPositionService.UpdatePositionApi(
        mId,
        careerDirectionId,
        careerPosition,
        mDescription,
        mCount,
        workOperId,
        workYearsId,
        educationId ?? '',
        trainingId,
        '1',
        startPay,
        endPay,
        industryMandatoryId,
        selectedSkillsIDList,
        (object) => () {
              if (object.isSuccess) {}
            });
  }

  void getDictionaryList() {
    //学历
    PersonalService.getScrollRecord((object) {
      if (object.isSuccess) {
        setState(() {
          var bean = RecordScrollModel();
          bean.name = '不限';
          ScrollRecordList.add(bean);
          ScrollRecordList.addAll(object.data);

          for (var item in ScrollRecordList) {
            mEducationList.add(item.name);
          }
        });
      }
    });
    //培养方式
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
    //工作经验
    PersonalService.getWorkAgRequirements((object) {
      if (object.isSuccess) {
        setState(() {
          workAgeModelList = object.data;
          for (var model in workAgeModelList) {
            workAgetextList.add(model.name);
          }
        });
      }
    });
    //工作方式
    PersonalService.getWorkTypeList((object) {
      if (object.isSuccess) {
        setState(() {
          workTypeList = object.data;
          for (var model in workTypeList) {
            workTypetextList.add(model.name);
          }
        });
      }
    });
  }
}
