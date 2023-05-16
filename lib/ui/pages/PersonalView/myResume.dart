import 'package:flutter/material.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/myResumeSubs/hop_experience.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/myResumeSubs/hop_job.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/myResumeSubs/hop_project.dart';
import 'package:people_living_flutterdemo/ui/widget/bottomLine.dart';
import 'package:people_living_flutterdemo/ui/widget/button_widget/TextIconButton.dart';
import '../../../core/components/m_AppBar.dart';
import 'package:people_living_flutterdemo/ProjectConfig/tools.dart';
import '../../../core/models/index.dart';
import '../../widget/ImageBorderRadius.dart';


class MyResume extends StatefulWidget {
  static const String routeName = '/myResume';
  MyResume(this.userDataModel);
  // 获取当前数据
  //  Person_inUuserData userDataModel = Person_inUuserData();
  Person_inUuserData userDataModel;

  @override
  State<MyResume> createState() => _MyResumeState();
}

class _MyResumeState extends State<MyResume> {
  List<String> jobList = ["sio1231", "sss", "aaa"];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.userDataModel.realName);
  }

  String getUserRealName(){
    return widget.userDataModel.realName ?? "0";
    // return 'dhaodhasiodhasiodhaoisdhasdioahsdoiashdioashdaoisdhoa';
  }
  // 用户头像
  String userAvatarUrl(){
    return widget.userDataModel.avatarUrl ?? "https://img2.baidu.com/it/u=2008030136,3515611374&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=305";
  }
  // 是否显示性别
  bool isShowSexIcon(){
    return widget.userDataModel.sex == null ? true : false;
  }
  // 男女icon
  Widget sexSwitchIcon(){
    // if (isShowSexIcon()) {
    //   return userDataModel?.sex == 1 ? Icon(Icons.padding, size: 24,) : Icon(Icons.pedal_bike, size: 24,);
    // }
    // return Container();
    return widget.userDataModel.sex != null ? Icon(Icons.padding, size: 24,) : Icon(Icons.pedal_bike, size: 24,);
  }

  String getSwitchJob() {
    return "${widget.userDataModel.careerDto?.careerDirectionName}" + "(${widget.userDataModel.cityName})";
  }

  String getRemoteWorkReasonStr(){
    return '${widget.userDataModel.remoteWorkReasonStr}';
  }

  String getWorkYear() {
    return "${widget.userDataModel.careerDto?.workYearsName}经验";
  }

  String getEducationName() {
    final Person_educationDto? model = widget.userDataModel.educationDtoList?.first;
    return "${model?.educationName}";
  }
  
  String getUserAge() {
    String age = "";
    if (widget.userDataModel.birthday != null) {
      age = m_tools.getAge(DateTime.parse(widget.userDataModel.birthday!));
    }
    return '$age岁';
  }

  List<Person_workExperienceDto> getWorkExperienceDtoList() {
    return widget.userDataModel.workExperienceDtoList ?? [];
  }

  List<Person_careerDto> getWorInfo(){
    if (widget.userDataModel.careerDto != null) {
      return [widget.userDataModel.careerDto!];
    }
    return [];
  }

  List<Person_workExperienceDto> getWorkList(){
    return widget.userDataModel.workExperienceDtoList ?? [];
  }

  List<Person_projectDto> getProjectList(){
    return widget.userDataModel.projectDtoList ?? [];
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: m_AppBar(context, "预览"),
        body: Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [Text("data"), Text("data"), Text("sdd")]
              ),

              PageView(
                children: [
                  Container(child: Text("sss")),
                  Container(child: Text("sss")),
                ],
              )
            ],
          ),
        )
    );
  }

  Widget pageView() {
    return PageView(
          children: [
            contentView(),
            Container(child: Text("dadasda"),)
          ],
        );
  }

  Widget contentView() {
    return SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(8.0),
            color: Colors.white,
            child: Column(children: [
              proInfo(),
              proWork(),
              hopJob(getWorInfo()),
              hop_experience(getWorkList()),
              hop_project(getProjectList())
            ]),
          ),
        );
  }

  // 用户基本信息
  Widget proInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 9),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(getUserRealName(),
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 25.0)),
                SizedBox(height: 8),
                Text(getSwitchJob(), style: TextStyle(fontSize: 18.0)),
              ],
            )),
            SizedBox(width: 18),
            Container(
              child: Stack(children: [
                ImageBorderRadius(
                  userAvatarUrl(),
                  radius: 70 / 2,
                  height: 70,
                  width: 70,
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Offstage(
                    offstage: isShowSexIcon(),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 1),
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(12.0)),
                      child: sexSwitchIcon()
                  )),
                )
              ]),
            )
          ]),
          bottomLine()
        ],
      ),
    );
  }

  // 基本资料
  Widget proWork() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 9, vertical: 16),
      // color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(getRemoteWorkReasonStr(),
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0)),
          SizedBox(
            height: 18,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextIconButton(
                icon: Icon(Icons.cabin,size: 18), 
                text: Text(getWorkYear())
              ),
              SizedBox(width: 16),

              TextIconButton(
                icon: Icon(Icons.people,size: 18), 
                text: Text(getEducationName())
              ),

              SizedBox(width: 16),

              TextIconButton(
                icon: Icon(Icons.brightness_medium, size: 18), 
                text: Text(getUserAge())
              ),
            ],
          ),
          SizedBox(height: 12),
          Text("多年丰富开发经验自学能力"),
          SizedBox(
            height: 28,
          ),
          Text("语言: oc swift swiftui flutter vue"),
          Text("前段熟悉vue"),
          bottomLine()
        ],
      ),
    );
  }
}
