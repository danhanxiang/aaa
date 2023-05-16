import 'package:flutter/material.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';
import 'package:people_living_flutterdemo/ProjectConfig/tools.dart';
import 'package:people_living_flutterdemo/core/components/m_AppBar.dart';
import 'package:people_living_flutterdemo/core/components/m_mainButton.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/myResume.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/person_updateUserInfo/personal_ImportResume.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/person_updateUserInfo/personal_add_education.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/person_updateUserInfo/personal_add_professional.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/person_updateUserInfo/personal_add_project.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/person_updateUserInfo/personal_add_userinfo.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/person_updateUserInfo/personal_add_workExperience.dart';
import 'package:people_living_flutterdemo/ui/widget/ItemWidget.dart';
import 'package:people_living_flutterdemo/ui/widget/button_widget/TextIconButton.dart';
import '../../../../core/components/m_choose_imagevideo_tool.dart';
import 'package:people_living_flutterdemo/core/service/personal_api/personal_api.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../../core/models/index.dart';
import '../../../shared/app_size_fit.dart';

class CretaeUserInfoView extends StatefulWidget {
  CretaeUserInfoView({Key? key}) : super(key: key);
  static const String routeName = '/updateUserinfo';
  @override
  State<CretaeUserInfoView> createState() => _CretaeUserInfoViewState();
}

class _CretaeUserInfoViewState extends State<CretaeUserInfoView> {
  Person_inUuserData? userDataModel;
  bool _isShowBottomView = false;
  double _isLastPixels = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    //获取入驻资料
    print("获取城市列表");
    getInuserInfodata((data) {
      setState(() {
        print("获取入驻资料");
        userDataModel = data;
      });
    });

    //获取城市列表
    PersonalService.postCityList((object) {
      if (object.isSuccess) {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: m_AppBar(context, "入驻资料"),
        backgroundColor: Colors.white,
        body: NotificationListener(
            onNotification: (ScrollNotification notification) {
              bool isShow = false;
              if (notification is ScrollStartNotification) {
                print("开始滚动");
              } else if (notification is ScrollUpdateNotification) {
                double current = notification.metrics.pixels;
                print("$current");
                if (current > _isLastPixels) {
                  isShow = true;
                  print("上滑");
                } else {
                  print("下滑");
                  isShow = false;
                }
              } else if (notification is ScrollEndNotification) {
                print("结束滚动");
                  isShow = false;
              }
              _isLastPixels = notification.metrics.pixels;

              setState(() {
                _isShowBottomView = isShow;  
              });
              return true;
            },
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                contentScrollView(),
                  Positioned(
                    width: BKSizeFit.screenWidth ?? 0 - (16.0 * 2),
                    bottom: 50,
                    child: 
                  Offstage(
                    offstage: _isShowBottomView,
                    child:  bottomBtnView(),
                  )
                ),
              ],
            )));
  }

  Widget bottomBtnView() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFE8E8E8),
            offset: Offset(0, 0),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextIconButton(
              type: TextIconButtonType.imageTop,
              icon: Icon(Icons.ad_units),
              text: Text("简历导出"),
              onTap: () {
                print('简历导出');
              },
            ),
            TextIconButton(
              type: TextIconButtonType.imageTop,
              icon: Icon(Icons.cake),
              text: Text("隐私保护"),
              onTap: () {
                print('隐私保护');
              },
            ),
            TextIconButton(
              type: TextIconButtonType.imageTop,
              icon: Icon(Icons.palette),
              text: Text("预览"),
              onTap: () {
                print('点击预览');
                // getIt<NavigateService>().pushNamed("/myResume");
                // Navigator.of(context).pushNamed("/myResume",arguments: userDataModel);
                Navigator.of(context).pushNamed(MyResume.routeName,arguments: userDataModel);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget contentScrollView() {
    return SingleChildScrollView(
        child: _updateHeaderView(userDataModel: this.userDataModel));
  }
}

class _updateHeaderView extends StatefulWidget {
  _updateHeaderView({Key? key, required this.userDataModel}) : super(key: key);

  Person_inUuserData? userDataModel;

  @override
  State<_updateHeaderView> createState() => _updateHeaderViewState();
}

class _updateHeaderViewState extends State<_updateHeaderView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 16, 16, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "新朋友，很高兴认识你",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: m_colors.title_01_color),
          ),
          SizedBox(height: 8),
          Text(
            "请务必根据自己实际情况填写入驻资料，这样有助于帮你找到最合适的企业～",
            style: TextStyle(fontSize: 13, color: m_colors.content_02_color),
          ),
          SizedBox(height: 16),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(importResume.routeName);
            },
            child: Container(
              padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
              width: BKSizeFit.screenWidth,
              height: 54,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: m_colors.back_01_color,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "上传简历，自动填充！",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: m_colors.title_01_color),
                  ),
                  Image.asset(
                    "images/person/icon_person_userinfo_btn.png",
                    width: 78,
                    height: 29,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 32),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("形象照",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: m_colors.title_01_color)),
                  Text("查看技巧",
                      style:
                          TextStyle(fontSize: 12, color: m_colors.backColor)),
                ],
              ),
              SizedBox(height: 4),
              Text("人才列表将展示该图，这是给企业的第一印象",
                  style: TextStyle(
                      fontSize: 12, color: m_colors.content_02_color)),
              SizedBox(
                height: 16,
              ),
              GestureDetector(
                child: widget.userDataModel?.avatarUrl == null
                    ? Image.asset(
                        "images/person/icon_person_add_headImg.png",
                        width: 120,
                        height: 85,
                        fit: BoxFit.cover,
                      )
                    : Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Stack(
                          children: [
                            Container(
                              child: Image.network(
                                widget.userDataModel!.avatarUrl!,
                                width: 120,
                                height: 85,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              child: Container(
                                color: Colors.black.withOpacity(0.4),
                                height: 20,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "images/person/icon_person_edi_photo.png",
                                      width: 12,
                                      height: 12,
                                      fit: BoxFit.cover,
                                    ),
                                    SizedBox(width: 6),
                                    Text(
                                      "编辑图片",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ),
                              left: 0,
                              right: 0,
                              bottom: 0,
                            )
                          ],
                        ),
                      ),
                onTap: () {
                  print("点击选择照片");
                  //选择照片
                  choose_imagevideo_tool.m_choose_image((xfile) {
                    if (xfile != null) {
                      print("选择照片");
                      PersonalService.PostUpdateHeadImg(xfile.path, (object) {
                        if (object.isSuccess) {
                          setState(() {
                            widget.userDataModel?.avatarUrl = object.data;
                          });
                        } else {
                          EasyLoading.showToast(object.message!);
                        }
                      });
                    }
                  });
                },
              )
            ],
          ),
          _add_userinfo(
              userDataModel: widget.userDataModel,
              isRefresh: () {
                isRefresh();
//获取入驻资料
              }), //基本信息
          _add_professional(
              userDataModel: widget.userDataModel,
              isRefresh: () {
                isRefresh();
//获取入驻资料
              }), //职业信息
          _add_education(
              educationDtoList: widget.userDataModel?.educationDtoList,
              isRefresh: () {
                isRefresh();
//获取入驻资料
              }), //教育经历
          _add_workExperience(
              workExperienceDtoList:
                  widget.userDataModel?.workExperienceDtoList,
              isRefresh: () {
                isRefresh();
//获取入驻资料
              }), //工作经历
          _add_projectExperience(
              projectDtoList: widget.userDataModel?.projectDtoList,
              isRefresh: () {
                isRefresh();
//获取入驻资料
              }),
          SizedBox(height: 30),
          Offstage(
            offstage: false,
            child: MainButton(
              text: "提交审核",
              OnPressed: () {
                if (isValidation()) {
                  EasyLoading.show(status: "提交中...");
                  PersonalService.saveInfoAudit((object) {
                    if (object.isSuccess) {
                      EasyLoading.showToast("提交成功");
                      Navigator.of(context).pop();
                    } else {
                      EasyLoading.showToast(object.message!);
                    }
                  });
                }
              },
              width: 0,
            ),
          ) //项目经验
        ],
      ),
    );
  }

  isRefresh() {
    getInuserInfodata((data) {
      setState(() {
        widget.userDataModel = data;
      });
    });
  }

  bool isValidation() {
    if (widget.userDataModel!.avatarUrl == null) {
      EasyLoading.showToast("形象照不能为空");
      return false;
    } else if (widget.userDataModel!.realName == null ||
        widget.userDataModel!.sex == null) {
      EasyLoading.showToast("基本信息不能为空");
      return false;
    } else if (widget.userDataModel!.careerDto!.careerDirectionName == null) {
      EasyLoading.showToast("职业信息不能为空");
      return false;
    } else if (widget.userDataModel!.educationDtoList == null ||
        widget.userDataModel!.educationDtoList!.length <= 0) {
      EasyLoading.showToast("教育经历不能为空");
      return false;
    } else if (widget.userDataModel!.workExperienceDtoList == null ||
        widget.userDataModel!.workExperienceDtoList!.length <= 0) {
      EasyLoading.showToast("工作经历不能为空");
      return false;
    } else if (widget.userDataModel!.projectDtoList == null ||
        widget.userDataModel!.projectDtoList!.length <= 0) {
      EasyLoading.showToast("项目经历不能为空");
      return false;
    } else {
      return true;
    }
  }
}

//基本信息
class _add_userinfo extends StatefulWidget {
  _add_userinfo(
      {Key? key, required this.userDataModel, required this.isRefresh()})
      : super(key: key);
  Person_inUuserData? userDataModel;
  Function() isRefresh;
  @override
  State<_add_userinfo> createState() => __add_userinfoState();
}

class __add_userinfoState extends State<_add_userinfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 32, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "基本信息",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: m_colors.title_01_color),
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.fromLTRB(20, 4, 0, 4),
                child: GestureDetector(
                  child: Row(
                    children: [
                      Image.asset(
                        "images/person/icon_person_write.png",
                        width: 16,
                        height: 16,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        "编辑",
                        style: TextStyle(
                            fontSize: 12, color: m_colors.content_01_color),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.of(context)
                    .pushNamed(add_userInfoView.routeName,arguments: widget.userDataModel)
                    .then((value) {
                      widget.isRefresh();
                    });
                  },
                ),
              )
            ],
          ),
          Offstage(
            offstage: widget.userDataModel == null ||
                    widget.userDataModel?.realName == null
                ? true
                : false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                Text(widget.userDataModel?.realName ?? "",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: m_colors.content_01_color)),
                SizedBox(height: 4),
                Text(getuserDataText(widget.userDataModel),
                    style: TextStyle(
                        fontSize: 13, color: m_colors.content_01_color)),
                SizedBox(height: 4),
                Text(widget.userDataModel?.remoteWorkReasonStr ?? "",
                    style: TextStyle(
                        fontSize: 13, color: m_colors.content_02_color)),
              ],
            ),
          ),
          SizedBox(height: 31),
          Divider(
            color: m_colors.divider_02_color,
          )
        ],
      ),
    );
  }
}

//职业信息
class _add_professional extends StatefulWidget {
  _add_professional(
      {Key? key, required this.userDataModel, required this.isRefresh()})
      : super(key: key);
  Person_inUuserData? userDataModel;
  Function() isRefresh;
  @override
  State<_add_professional> createState() => __add_professionalState();
}

class __add_professionalState extends State<_add_professional> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 32, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "职业信息",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: m_colors.title_01_color),
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.fromLTRB(20, 4, 0, 4),
                child: GestureDetector(
                  child: Row(
                    children: [
                      Image.asset(
                        "images/person/icon_person_write.png",
                        width: 16,
                        height: 16,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        "编辑",
                        style: TextStyle(
                            fontSize: 12, color: m_colors.content_01_color),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(add_professionalView.routeName,
                            arguments: widget.userDataModel)
                        .then((value) {
                      widget.isRefresh();
                    });
                  },
                ),
              )
            ],
          ),
          Offstage(
            offstage: widget.userDataModel?.careerDto == null ||
                    widget.userDataModel?.workModeDtoList == null ||
                    widget.userDataModel!.workModeDtoList!.isEmpty
                ? true
                : false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                Text(widget.userDataModel?.careerDto?.careerDirectionName ?? "",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: m_colors.content_01_color)),
                SizedBox(height: 4),
                Text(
                    "${widget.userDataModel?.careerDto?.workYearsName}｜当前薪资:${(widget.userDataModel?.careerDto?.curSalary ?? 0.toDouble()) / 1000.0}k",
                    style: TextStyle(
                        fontSize: 13, color: m_colors.content_01_color)),
                SizedBox(height: 4),
                Text(getworkModeDtoText(widget.userDataModel),
                    style: TextStyle(
                        fontSize: 13, color: m_colors.content_02_color)),
              ],
            ),
          ),
          SizedBox(height: 31),
          Divider(
            color: m_colors.divider_02_color,
          )
        ],
      ),
    );
  }
}

//教育经历
class _add_education extends StatefulWidget {
  _add_education(
      {Key? key, required this.educationDtoList, required this.isRefresh()})
      : super(key: key);
  List<Person_educationDto>? educationDtoList;
  Function() isRefresh;

  @override
  State<_add_education> createState() => __add_educationState();
}

class __add_educationState extends State<_add_education> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 32, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "教育经历",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: m_colors.title_01_color),
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.fromLTRB(20, 4, 0, 4),
                child: GestureDetector(
                  child: Row(
                    children: [
                      Image.asset(
                        "images/person/icon_person_adduserinfo.png",
                        width: 16,
                        height: 16,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        "添加",
                        style: TextStyle(
                            fontSize: 12, color: m_colors.content_01_color),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed(add_educationView.routeName,
                        arguments: {"type": "1"}).then((value) {
                      widget.isRefresh();
                    });
                  },
                ),
              )
            ],
          ),
          Offstage(
            offstage: widget.educationDtoList == null ||
                    widget.educationDtoList!.length <= 0
                ? true
                : false,
            child: Column(
              children: (widget.educationDtoList ?? []).map<Widget>((model) {
                return GestureDetector(
                  child: Container(
                    padding: EdgeInsets.only(bottom: 16),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(model.collegeName ?? "",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: m_colors.content_01_color)),
                            Row(
                              children: [
                                Text(
                                    "${model.inSchoolStartTime}-${model.inSchoolEndTime}",
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: m_colors.content_02_color)),
                                SizedBox(width: 4),
                                Image.asset(
                                    "images/person/icon_person_meau_arrow.png",
                                    width: 12,
                                    height: 12,
                                    fit: BoxFit.cover),
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 4),
                        Text(
                            "${model.educationName}|${model.trainingModeName}|${model.major}",
                            style: TextStyle(
                                fontSize: 13,
                                color: m_colors.content_01_color)),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed(add_educationView.routeName,
                        arguments: {"type": "2", "model": model}).then((value) {
                      widget.isRefresh();
                    });
                  },
                );
              }).toList(),
              /*
              
             */
            ),
          ),
          SizedBox(height: widget.educationDtoList == null ? 31 : 31),
          Divider(
            color: m_colors.divider_02_color,
          )
        ],
      ),
    );
  }
}

//工作经历
class _add_workExperience extends StatefulWidget {
  _add_workExperience(
      {Key? key,
      required this.workExperienceDtoList,
      required this.isRefresh()})
      : super(key: key);
  List<Person_workExperienceDto>? workExperienceDtoList;
  Function() isRefresh;
  @override
  State<_add_workExperience> createState() => __add_workExperienceState();
}

class __add_workExperienceState extends State<_add_workExperience> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 32, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "工作经历",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: m_colors.title_01_color),
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.fromLTRB(20, 4, 0, 4),
                child: GestureDetector(
                  child: Row(
                    children: [
                      Image.asset(
                        "images/person/icon_person_adduserinfo.png",
                        width: 16,
                        height: 16,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        "添加",
                        style: TextStyle(
                            fontSize: 12, color: m_colors.content_01_color),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed(add_workExperience.routeName,
                        arguments: {"type": "1"}).then((value) {
                      widget.isRefresh();
                    });
                  },
                ),
              )
            ],
          ),
          Offstage(
            offstage: widget.workExperienceDtoList == null ? true : false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: (widget.workExperienceDtoList ?? []).map((model) {
                return GestureDetector(
                  child: Container(
                    padding: EdgeInsets.only(bottom: 16),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 16),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(child: Text(model.companyName ?? "",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: m_colors.content_01_color))
                            ),
                            SizedBox(width: 8),
                            Row(
                              children: [
                                Text(
                                    "${model.workStartTime}-${model.workEndTime}",
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: m_colors.content_02_color)),
                                SizedBox(width: 4),
                                Image.asset(
                                    "images/person/icon_person_meau_arrow.png",
                                    width: 12,
                                    height: 12,
                                    fit: BoxFit.cover),
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 4),
                        Text("${model.industryName}｜${model.positionName}",
                            style: TextStyle(
                                fontSize: 13,
                                color: m_colors.content_01_color)),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed(add_workExperience.routeName,
                        arguments: {"type": "2", "model": model}).then((value) {
                      widget.isRefresh();
                    });
                  },
                );
              }).toList(),
            ),
          ),
          SizedBox(height: widget.workExperienceDtoList == null ? 31 : 31),
          Divider(
            color: m_colors.divider_02_color,
          )
        ],
      ),
    );
  }
}

//项目经验
class _add_projectExperience extends StatefulWidget {
  _add_projectExperience(
      {Key? key, required this.projectDtoList, required this.isRefresh()})
      : super(key: key);
  List<Person_projectDto>? projectDtoList;
  Function() isRefresh;
  @override
  State<_add_projectExperience> createState() => __add_projectExperienceState();
}

class __add_projectExperienceState extends State<_add_projectExperience> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 32, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "项目经历",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: m_colors.title_01_color),
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.fromLTRB(20, 4, 0, 4),
                child: GestureDetector(
                  child: Row(
                    children: [
                      Image.asset(
                        "images/person/icon_person_adduserinfo.png",
                        width: 16,
                        height: 16,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        "添加",
                        style: TextStyle(
                            fontSize: 12, color: m_colors.content_01_color),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed(add_projectView.routeName,
                        arguments: {"type": "1"}).then((value) {
                      widget.isRefresh();
                      //List<SkillsClassModel> skillsClassModelList = value as? List;
                    });
                  },
                ),
              )
            ],
          ),
          Offstage(
            offstage: widget.projectDtoList == null ? true : false,
            child: Column(
              children: (widget.projectDtoList ?? []).map((model) {
                return GestureDetector(
                  child: Container(
                    padding: EdgeInsets.only(bottom: 16),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(model.projectName ?? "",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: m_colors.content_01_color))
                            ),
                            Row(
                              children: [
                                Text(
                                    "${model.projectStartDate}-${model.projectEndDate}",
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: m_colors.content_02_color)),
                                SizedBox(width: 4),
                                Image.asset(
                                    "images/person/icon_person_meau_arrow.png",
                                    width: 12,
                                    height: 12,
                                    fit: BoxFit.cover),
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 4),
                        Text(model.position ?? "",
                            style: TextStyle(
                                fontSize: 13,
                                color: m_colors.content_01_color)),
                        SizedBox(height: 4),
                        Text("${model.companyName}|${model.industryName}",
                            style: TextStyle(
                                fontSize: 13,
                                color: m_colors.content_01_color)),
                        SizedBox(height: 16),
                        Text(model.description ?? "",
                            style: TextStyle(
                                fontSize: 13,
                                color: m_colors.content_02_color)),
                        SizedBox(
                          height: 8,
                        ),
                        ProjectItemsView(projectSkillList: model.projectSkillList)
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed(add_projectView.routeName,
                        arguments: {"type": "2", "model": model}).then((value) {
                      widget.isRefresh();
                    });
                  },
                );
              }).toList(),
            ),
          ),
          SizedBox(height: widget.projectDtoList == null ? 31 : 31),
          Divider(
            color: m_colors.divider_02_color,
          )
        ],
      ),
    );
  }
}

getInuserInfodata(Function(Person_inUuserData data) successData) {
  //获取入驻资料
  EasyLoading.show(status: "请求中...");
  PersonalService.getInUserdata((object) {
    EasyLoading.dismiss();
    if (object.isSuccess) {
      successData(object.data);
    }
  });
}

String getuserDataText(Person_inUuserData? userDataModel) {
  if (userDataModel != null) {
    String sex = userDataModel.sex != null
        ? userDataModel.sex == 0
            ? "男"
            : "女"
        : "";

    String age = "";
    if (userDataModel.birthday != null) {
      age = m_tools.getAge(DateTime.parse(userDataModel.birthday!));
    }

    String city = (userDataModel.provinceName ?? "") +
        (userDataModel.cityName ?? "") +
        (userDataModel.areasName ?? "");

    return sex + "丨" + age + "丨" + city;
  }
  return "";
}

String getworkModeDtoText(Person_inUuserData? userDataModel) {
  String workModeStr = "";
  String price = "";
  if (userDataModel?.workModeDtoList != null) {
    if (userDataModel!.workModeDtoList!.length > 0) {
      workModeStr = userDataModel.workModeDtoList?[0].workDayModeName ?? "";
      double minP = double.parse(
          (userDataModel.workModeDtoList?[0].lowestSalary ?? "0").toString());
      double maxP = double.parse(
          (userDataModel.workModeDtoList?[0].highestSalary ?? "0").toString());
      price = "期望薪资:${minP / 1000}k - ${maxP / 1000}k";
      return "${workModeStr}丨${price}";
    }
    return "";
  }

  return "";
}
