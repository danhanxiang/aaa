import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:people_living_flutterdemo/ProjectConfig/ProjectConfig.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';
import 'package:people_living_flutterdemo/ProjectConfig/WchatManager.dart';
import 'package:people_living_flutterdemo/core/components/m_AppBar.dart';
import 'package:people_living_flutterdemo/core/components/m_mainButton.dart';
import 'package:people_living_flutterdemo/core/service/home_api/home_api.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:people_living_flutterdemo/ProjectConfig/tools.dart';
import 'package:people_living_flutterdemo/ui/widget/SharedWeChat.dart';
import '../../../core/models/index.dart';

class PositionDetailView extends StatefulWidget {
  static const String routeName = '/home_positionDetail';
  PositionDetailView({Key? key, required this.postitonID}) : super(key: key);
  String postitonID;
  //Function(bool isselfRecommendStatus) onRefresh;

  @override
  State<PositionDetailView> createState() => _PositionDetailViewState();
}

class _PositionDetailViewState extends State<PositionDetailView> {
  late Home_position_detail_model detail_model = Home_position_detail_model();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    getPositionDetail();
  }

  getPositionDetail(){
    EasyLoading.show(status: '请求中...', maskType: EasyLoadingMaskType.black);
    HomeService.getPositionDetail(widget.postitonID, (object) {
      if (object.isSuccess) {
        setState(() {
          detail_model = object.data;
        });
        EasyLoading.dismiss();
      } else {
        EasyLoading.showToast(object.message ?? '');
      }
      initWeChat();
    });
  }

  initWeChat(){
    WchatManager.initFluwx((error) {
      EasyLoading.showError(error, duration: const Duration(seconds: 3));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: m_AppBar(
        context, 
        "职位详情", 
        color: Colors.white, 
        action: [
          IconButton(onPressed: (){
            showModalBottomSheet(
              backgroundColor: Colors.transparent,//重点
              context: context,  
              builder: (BuildContext con) => SharedWeChat(
                scene: (scene) {
                  // 分享到好友
                  WchatManager.shareUrl(
                    ProjectConfig.positionDetailShareUrl(detail_model.positionId ?? 0), 
                    title: detail_model.title ?? '', 
                    description: detail_model.description,
                    scene: scene
                  );
                }
             )
           );
          }, icon: Icon(Icons.share))
        ]
      ),
      backgroundColor: Colors.white,
      body: contentWidget(detail_model, context)

      // SingleChildScrollView(
      //   child: Container(
      //     color: Color.fromRGBO(255, 255, 255, 1),
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         PositionInfo(detail_model),
      //         const SizedBox(height: 8),
      //         Container(
      //           height: 8,
      //           color: m_colors.back_01_color,
      //         ),
      //         Container(
      //           margin: const EdgeInsets.fromLTRB(16, 24, 16, 24),
      //           child: Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               PositionSkill(detail_model),
      //               const SizedBox(height: 24),
      //               const Divider(
      //                 color: m_colors.divider_02_color,
      //               ),
      //               const SizedBox(height: 24),
      //               PositionDec(detail_model),
      //               const SizedBox(height: 24),
      //               const Divider(
      //                 color: m_colors.divider_02_color,
      //               ),
      //               const SizedBox(height: 24),
      //               CompanyInfo(detail_model),
      //               const SizedBox(height: 16),
      //               const Divider(
      //                 color: m_colors.divider_02_color,
      //               ),
      //               const SizedBox(height: 16),
      //               UseUtils(detail_model),
      //             ],
      //           ),
      //         ),
      //         SizedBox(height: 55),
      //         MainButton(
      //           text: "预约面试(添加企业微信)",
      //           heigth: 54,
      //           disable: !(detail_model.selfRecommendStatus ?? true),
      //           OnPressed: () {
      //             // if (!detail_model.selfRecommendStatus!) {
      //             //   EasyLoading.show(status: '自荐中...');
      //             //   HomeService.postRecommended(
      //             //       detail_model.positionId!.toString(), (object) {
      //             //     if (object.isSuccess) {
      //             //       setState(() {
      //             //         detail_model.selfRecommendStatus = true;
      //             //       });
      //             //       EasyLoading.showToast("自荐成功");
      //             //     } else {
      //             //       EasyLoading.showToast(object.message!);
      //             //     }
      //             //   });
      //             // }
      //             showCupertinoAlertDialog(context);
      //           },
      //         )
      //       ],
      //     ),
      //   ),
      // ),

    );
  }
}

void showCupertinoAlertDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          content: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    child: Image.asset(
                        "images/login/icon_login_off@2x.png",width: 20,height: 20),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
              const SizedBox(height: 16),
              Center(
                child: Image.asset("assets/images/icon_wechat_qr.png",width: 160,height: 160,),
              ),
              const SizedBox(height: 16),
              const Align(
                child: Text(
                  "手机截图二维码",
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
                alignment: Alignment(0, 0),
              ),
              const SizedBox(height: 16),
              const Align(
                child: Text(
                  "微信扫描添加客服咨询",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                alignment: Alignment(0, 0),
              ),
            ],
          ),
        );
      });
}


void showAlertDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('提示'),
          content: Text('确认删除吗？'),
          backgroundColor: Colors.white,
          elevation: 5,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5)),
          actions: <Widget>[
            ElevatedButton(child: Text('取消'), onPressed: () {},),
            ElevatedButton(child: Text('确认'), onPressed: () {},),
          ],
        );
      });
}

Widget CreateIconView(String imgPath, String title) {
  return Container(
    padding: EdgeInsets.only(right: 18),
    child: Row(
      children: [
        Image.asset(
          imgPath,
          width: 14,
          height: 14,
          fit: BoxFit.cover,
        ),
        SizedBox(width: 5),
        Text(
          title,
          style: TextStyle(fontSize: 13, color: m_colors.content_01_color),
        )
      ],
    ),
  );
}

List<Widget> createTitleViews(List titles) {
  List<Widget> childArray = [];
  for (var title in titles) {
    childArray.add(Container(
      //margin: EdgeInsets.fromLTRB(0, 0, 4, 0),
      padding: EdgeInsets.fromLTRB(8, 2, 8, 2),
      decoration: BoxDecoration(
        //设置四周圆角 角度
          borderRadius: BorderRadius.all(Radius.circular(2.0)),
          //设置四周边框
          //border: Border.all(width: 1, color: m_colors.backColor),
          color: m_colors.back_01_color),
      child: Text(
        title,
        style: TextStyle(fontSize: 12, color: m_colors.content_01_color),
      ),
    ));
  }
  return childArray;
}

/// 职位详情
Widget PositionInfo(Home_position_detail_model detailModel) {
  return Container(
    margin: EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(detailModel.title ?? "",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: m_colors.title_01_color)),
            Text(
                m_tools.getPayText((detailModel.startPay ?? 0.0).toInt(),
                    (detailModel.endPay ?? 0.0).toInt()),
                style: TextStyle(
                    color: m_colors.backColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w600))
          ],
        ),
        SizedBox(height: 8),
        Row(
          children: [
            CreateIconView("images/home/icon_home_positiondetail_04.png",
                detailModel.workDaysModeName ?? ""),
            CreateIconView("images/home/icon_home_positiondetail_01.png",
                detailModel.workYearsName ?? ""),
            CreateIconView("images/home/icon_home_positiondetail_02.png",
                detailModel.educationName ?? ""),
            CreateIconView("images/home/icon_home_positiondetail_03.png",
                "${detailModel.recruitCount}人"),
          ],
        ),
      ],
    ),
  );
}

/// 职位要求
Widget PositionSkill(Home_position_detail_model detailModel) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        "职位要求",
        style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: m_colors.title_01_color),
      ),
      SizedBox(height: 16),
      Wrap(
        spacing: 6.0,
        runSpacing: 6.0,
        children: createTitleViews(detailModel.skillNames ?? []),
      )
    ],
  );
}

/// 职位描述
Widget PositionDec(Home_position_detail_model detailModel) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        "职位描述",
        style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: m_colors.title_01_color),
      ),
      SizedBox(height: 16),
      Text(detailModel.description ?? "",
          style: TextStyle(
            fontSize: 13,
            color: m_colors.content_02_color,
          ))
    ],
  );
}

/// 企业信息
Widget CompanyInfo(Home_position_detail_model detailModel) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        "企业信息",
        style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: m_colors.title_01_color),
      ),
      SizedBox(
        height: 16,
      ),
      Row(
        children: [
          // Container(
          //   alignment: Alignment.center,
          //   width: 48,
          //   height: 48,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(24),
          //     color: m_colors.title_01_color,
          //   ),
          //   child: Text(
          //     //CreateName(User.userInfo.realName),
          //     m_tools.SubString(detail_model.companyName ?? ""),
          //
          //     style: TextStyle(
          //         color: Colors.white,
          //         fontSize: 15,
          //         fontWeight: FontWeight.w600),
          //   ),
          // ),
          // SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                detailModel.companyName ?? "",
                style: TextStyle(
                    color: m_colors.content_01_color,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "${detailModel.companyIndustryName}·${detailModel
                    .companyPersonSizeName}",
                style: TextStyle(
                  color: m_colors.content_02_color,
                  fontSize: 13,
                ),
              ),
            ],
          )
        ],
      ),
    ],
  );
}


/// 常用协作工具
Widget UseUtils(Home_position_detail_model detailModel) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Image.asset(
            "images/home/icon_home_positiondetail_05.png",
            width: 16,
            height: 16,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 2),
          const Text(
            "常用协作工具",
            style: TextStyle(
                fontSize: 13,
                color: m_colors.content_01_color,
                fontWeight: FontWeight.w600),
          )
        ],
      ),
      const SizedBox(
        height: 16,
      ),
      Wrap(
        spacing: 6.0,
        runSpacing: 6.0,
        children: createTitleViews(
            detailModel.companyTeamToolsDescNames ?? []),
      )
    ],
  );
}


//首页 内容组件
Widget contentWidget(Home_position_detail_model detail_model ,BuildContext context) {
  return EasyRefresh(
    enableControlFinishRefresh: true,
    enableControlFinishLoad: false,
    child: SingleChildScrollView(
      child:Container(
        color: Color.fromRGBO(255, 255, 255, 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PositionInfo(detail_model),
            const SizedBox(height: 8),
            Container(
              height: 8,
              color: m_colors.back_01_color,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(16, 24, 16, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PositionSkill(detail_model),
                  const SizedBox(height: 24),
                  const Divider(
                    color: m_colors.divider_02_color,
                  ),
                  const SizedBox(height: 24),
                  PositionDec(detail_model),
                  const SizedBox(height: 24),
                  const Divider(
                    color: m_colors.divider_02_color,
                  ),
                  const SizedBox(height: 24),
                  CompanyInfo(detail_model),
                  const SizedBox(height: 16),
                  const Divider(
                    color: m_colors.divider_02_color,
                  ),
                  const SizedBox(height: 16),
                  UseUtils(detail_model),
                ],
              ),
            ),
            SizedBox(height: 55),
            MainButton(
              text: "预约面试(添加企业微信)",
              heigth: 54,
              disable: !(detail_model.selfRecommendStatus ?? true),
              OnPressed: () {
                // if (!detail_model.selfRecommendStatus!) {
                //   EasyLoading.show(status: '自荐中...');
                //   HomeService.postRecommended(
                //       detail_model.positionId!.toString(), (object) {
                //     if (object.isSuccess) {
                //       setState(() {
                //         detail_model.selfRecommendStatus = true;
                //       });
                //       EasyLoading.showToast("自荐成功");
                //     } else {
                //       EasyLoading.showToast(object.message!);
                //     }
                //   });
                // }
                showCupertinoAlertDialog(context);
                // showAlertDialog(context);
              },
            )
          ],
        ),
      ),
      ),
    );

}


