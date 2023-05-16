import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';
import 'package:people_living_flutterdemo/ProjectConfig/tools.dart';
import 'package:people_living_flutterdemo/core/components/m_AppBar.dart';
import 'package:people_living_flutterdemo/core/components/m_mainButton.dart';
import 'package:people_living_flutterdemo/core/extension/int_extension.dart';
import 'package:people_living_flutterdemo/core/extension/string_extension.dart';
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

  final picker = ImagePicker();
  XFile? _imageFile;
  List<XFile>? _imageFiles;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    /// 入驻接口
    isRefresh();

    //获取城市列表
    PersonalService.postCityList((object) {
      if (object.isSuccess) {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: m_AppBar(context, "入驻资料", color: Colors.white),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(child: contentScrollView()),
          buttonBtn()
        ],
      )
    );   
  }

  /// 提交审核按钮
  Widget buttonBtn(){
    return Visibility(
      visible: isShowBtn(),
      child: Padding(
        padding: EdgeInsets.fromLTRB(16.px, 16.px, 16.px, BKSizeFit.statusBottomHeight),
        child: MainButton(
          text: "提交审核",
          OnPressed: (){
            requestReview();
          },
        ),
      ),
    );
  }
  
  /// 入驻资料
  Widget contentScrollView() {
    return SingleChildScrollView(               
        child: Container(
        padding: EdgeInsets.fromLTRB(16.px, 16.px, 16.px, 20.px),
        child: content(),
      )
    );
  }
  Widget content() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          headerView(),
          SizedBox(height: 8.px),
          showCompView(),
          
          loadingJlView(),

          SizedBox(height: 32.px),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("形象照",
                      style: TextStyle(
                          fontSize: 15.px,
                          fontWeight: FontWeight.w600,
                          color: m_colors.title_01_color)),
                  Text("查看技巧",
                      style:
                          TextStyle(fontSize: 12.px, color: m_colors.backColor)),
                ],
              ),
              SizedBox(height: 4.px),
              Text("人才列表将展示该图，这是给企业的第一印象",
                  style: TextStyle(
                      fontSize: 12.px, color: m_colors.content_02_color)),
              SizedBox(height: 16.px),
              GestureDetector(
                child: userDataModel?.avatarUrl == null
                    ? Image.asset(
                        "images/person/icon_person_add_headImg.png",
                        width: 120.px,
                        height: 85.px,
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
                                userDataModel!.avatarUrl!,
                                width: 120.px,
                                height: 85.px,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              child: Container(
                                color: Colors.black.withOpacity(0.4),
                                height: 20.px,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "images/person/icon_person_edi_photo.png",
                                      width: 12.px,
                                      height: 12.px,
                                      fit: BoxFit.cover,
                                    ),
                                    SizedBox(width: 6.px),
                                    Text(
                                      "编辑图片",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.px,
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
                  _openGallery();
                },
              )
            ],
          ),
          _add_userinfo(
              userDataModel: userDataModel,
              isRefresh: () {
                isRefresh();
//获取入驻资料
              }), //基本信息
          _add_professional(
              userDataModel: userDataModel,
              isRefresh: () {
                isRefresh();
//获取入驻资料
              }), //职业信息
          _add_education(
              educationDtoList: userDataModel?.educationDtoList,
              isRefresh: () {
                isRefresh();
//获取入驻资料
              }), //教育经历
          _add_workExperience(
              workExperienceDtoList: userDataModel?.workExperienceDtoList,
              isRefresh: () {
                isRefresh();
//获取入驻资料
              }), //工作经历
          _add_projectExperience(
              projectDtoList: userDataModel?.projectDtoList,
              careerDirectionId: '${userDataModel?.careerDto!.careerDirectionId}',
              isRefresh: () {
                isRefresh();
//获取入驻资料
              }), //项目经验
        ],
      );
  }

  Widget headerView(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Offstage(
        offstage: !(userDataModel?.status != 3),
        child: Text(
          "新朋友，很高兴认识你",
          style: TextStyle(
            fontSize: 20.px,
            fontWeight: FontWeight.w600,
            color: m_colors.title_01_color
          ),
        ),
      ),
      
      SizedBox(height: 8.px),
      Text(
        "请务必根据自己实际情况填写入驻资料，这样有助于帮你找到最合适的企业～",
        style: TextStyle(
          fontSize: 13.px, 
          color: m_colors.content_02_color
        ),
      )
    ]);
  }
  /// 上传简历
  Widget loadingJlView(){
    return Container(
            padding: EdgeInsets.symmetric(horizontal: 12.px,vertical:  8.px),
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
                      fontSize: 15.px,
                      fontWeight: FontWeight.w600,
                      color: m_colors.title_01_color),
                ),
                Container(
                  // alignment: Alignment.center,
                  alignment: Alignment(0.5, 0.0),
                  width: 94.px,
                  height: 41.px,
                  decoration: BoxDecoration(
                    color: m_colors.backColor,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: TextIconButton(
                    type: TextIconButtonType.imageRight,
                    text: Text('导入简历', style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white, 
                      fontSize: 12.px)
                    ),
                    icon: Icon(Icons.arrow_right, color: Colors.white),
                    onTap: () {
                      Navigator.of(context).pushNamed(importResume.routeName);
                    },
                  ),
                )
              ],
            ),
          );
  }

  /// 资料进度
  Widget showCompView() {
    return Visibility(
      visible: isShowLoading(),
      child: Container(
        margin: EdgeInsets.only(bottom: 16.px),
        padding: EdgeInsets.symmetric(horizontal: 8.px, vertical: 16.px),
        decoration: BoxDecoration(
          color: m_colors.color_FFF9F1,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  'personal_jd'.png,
                  width: 24.px,
                  height: 24.px,
                  // fit: BoxFit.cover,
                ),
                SizedBox(width: 4.px),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: m_colors.color_FB8B39,
                      fontSize: 13.px
                    ),
                  )
                )
              ],
            ),
            SizedBox(height: 8.px),
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20.px)),
              child: LinearProgressIndicator(
                backgroundColor: Colors.white,
                valueColor: AlwaysStoppedAnimation(m_colors.color_FB8B39),
                value: progressCount / 100,
              ),
            )
          ],
        ),
      ),
    );
  }



  /// 是否显示审核按钮
  bool isShowBtn(){
    return userDataModel != null && userDataModel!.isShowStatusBtn();
  }

  requestReview() {
    /// 判断
    if (userDataModel == null){ return; }
    if (isAddBasic()) {
      EasyLoading.showToast('请完善基本信息');
    }else if (isAddPro()) {
      EasyLoading.showToast('请完善职业信息');
    }else if (isAddEducate()){
      EasyLoading.showToast('请完善教育经历');
    }else if (isAddWork()){
      EasyLoading.showToast('请完善工作经历');
    }else if (isAddProject()){
      EasyLoading.showToast('请完善项目经历');
    }
    else {
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
  }

  /// 入驻资料进度
  bool isShowLoading(){
    bool isShow = false;
    if (userDataModel?.status == 1 && compNum > 0) {
      isShow = true;
    }
    return isShow;
  }

   int compNum = 0;
   String title = '';
   double progressCount = 0.0;

  

   /// 项目个数每一条增加5%
  double projectProgressCount() {
    int projectDtoListCount = 0;
    if (userDataModel != null) {
      projectDtoListCount = userDataModel!.projectDtoList!.length;
    }
     return projectDtoListCount > 1 ? (projectDtoListCount - 1) * 5.0 : 0;
  }


  loadingTitle(){
    switch (compNum) {
      case 1: 
        title = "完成度超过2%的用户，仍需努力哦～";
        progressCount = 2.0;
        break;
    case 2:
        title = "完成度超过5%的用户，加油~";
        progressCount = 5.0;
        break;
    case 3:
        title = "完成度超过10%的用户，继续加油~";
        progressCount = 10.0;
        break;
    case 4:
        title = "完成度超过30%的用户，继续完善让履历更风采~";
        progressCount = 30.0;
        break;
    case 5:
        // 判断项目个数
        progressCount = 60.0 + projectProgressCount();
        progressCount = progressCount > 90 ? 90 : progressCount;
        title = progressCount >= 90 ? "“恭喜你！完成度超过90%以上的用户，未来可期～”" : "“恭喜你！完成度超过$progressCount%的用户，全面的工作和项目经历可以进一步提升竞争力~”";
        break;
    default:
        title = "";
        progressCount = 0.0;
    }
  }


  /// 判断是否有编辑基本信息
  bool isAddBasic(){
    if (userDataModel!.realName!.isEmpty ||
        userDataModel!.provinceName!.isEmpty ||
        userDataModel!.cityName!.isEmpty ||
        userDataModel!.areasName!.isEmpty ||
        userDataModel!.remoteWorkReasonStr!.isEmpty ||
        userDataModel!.sex == -1){
          return true;
        } else {
          return false;
    }
  }

  bool isAddPro() {
    if (userDataModel!.careerDto!.careerDirectionName!.isEmpty ||
        userDataModel!.careerDto!.curSalary == null ||
        userDataModel!.careerDto!.workYearsName!.isEmpty){
          return true;
        } else {
          return false;
        }
  }

  bool isAddEducate(){
    return userDataModel!.educationDtoList!.isNotEmpty;
  }

  bool isAddWork(){
    return userDataModel!.workExperienceDtoList!.isNotEmpty;
  }

  bool isAddProject(){
    return userDataModel!.projectDtoList!.isNotEmpty;
  }

  loadingWithCount(){
    if (!isAddBasic()) {
      compNum += 1;
    }
    if (!isAddPro()) {
      compNum += 1;
    }
    if (isAddEducate()) {
        compNum += 1;
    }
    if (isAddWork()) {
        compNum += 1;
    }
    if (isAddProject()) {
        compNum += 1;
    }
    loadingTitle();
  }

  /// 获取入驻资料
  isRefresh() {
    getInuserInfodata((data) {
      setState(() {
        userDataModel = data;
        loadingWithCount();
      });
    });
  }


  //打开文件夹选单张图片
  _openGallery() async {

    // XFile? pickedFile = await picker.pickImage(
    //     source: ImageSource.gallery, maxHeight: 600, maxWidth: 600);

    // if (pickedFile != null) {
    //   print(pickedFile.path);
    //   // print(File(pickedFile.path));
    //   setState(() {
    //     _imageFile = pickedFile;
    //   });
    // }
    choose_imagevideo_tool.m_choose_image((xfile) {
      print('获取当前照片');
        if (xfile != null) {
          print("选择照片");
          PersonalService.PostUpdateHeadImg(xfile.path, (object) {
            if (object.isSuccess) {
              setState(() {
                userDataModel!.avatarUrl = object.data;
              });
            } else {
              EasyLoading.showToast(object.message!);
            }
          });
        }
      });
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
      padding: EdgeInsets.only(top: 32.px),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "基本信息",
                style: TextStyle(
                    fontSize: 15.px,
                    fontWeight: FontWeight.w600,
                    color: m_colors.title_01_color),
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.fromLTRB(20.px, 4.px, 0, 4.px),
                child: GestureDetector(
                  child: Row(
                    children: [
                      Image.asset(
                        "images/person/icon_person_write.png",
                        width: 16.px,
                        height: 16.px,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 4.px),
                      Text(
                        "编辑",
                        style: TextStyle(
                            fontSize: 12.px, color: m_colors.content_01_color),
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
                SizedBox(height: 16.px),
                Text(widget.userDataModel?.realName ?? "",
                    style: TextStyle(
                        fontSize: 15.px,
                        fontWeight: FontWeight.w600,
                        color: m_colors.content_01_color)),
                SizedBox(height: 4.px),
                Text(getuserDataText(widget.userDataModel),
                    style: TextStyle(
                        fontSize: 13.px, color: m_colors.content_01_color)),
                SizedBox(height: 4.px),
                Text(widget.userDataModel?.remoteWorkReasonStr ?? "",
                    style: TextStyle(
                        fontSize: 13.px, color: m_colors.content_02_color)),
              ],
            ),
          ),
          SizedBox(height: 16.px),
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
      padding: EdgeInsets.only(top: 16.px),
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
      {Key? key, required this.projectDtoList, required this.careerDirectionId ,required this.isRefresh()})
      : super(key: key);
  List<Person_projectDto>? projectDtoList;
  String careerDirectionId;
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
                        arguments: [{"type": "1",}, widget.careerDirectionId] ).then((value) {
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
                        arguments: [{"type": "2", "model": model}, widget.careerDirectionId]).then((value) {
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
