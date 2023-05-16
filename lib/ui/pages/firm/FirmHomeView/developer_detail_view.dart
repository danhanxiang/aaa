import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:people_living_flutterdemo/ProjectConfig/ProjectConfig.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';
import 'package:people_living_flutterdemo/ProjectConfig/WchatManager.dart';
import 'package:people_living_flutterdemo/core/components/m_AppBar.dart';
import 'package:people_living_flutterdemo/core/components/m_mainButton.dart';
import 'package:people_living_flutterdemo/core/extension/int_extension.dart';
import 'package:people_living_flutterdemo/core/extension/string_extension.dart';
import 'package:people_living_flutterdemo/core/service/firm_collect_api/firm_collect_api.dart';
import 'package:people_living_flutterdemo/core/service/firm_home_api/firm_home_api.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:people_living_flutterdemo/ui/pages/firm/FirmHomeView/widgets/DeveloperInfo.dart';
import 'package:people_living_flutterdemo/ui/pages/firm/FirmHomeView/widgets/DucationSection.dart';
import 'package:people_living_flutterdemo/ui/pages/firm/FirmHomeView/widgets/WorkSection.dart';
import 'package:people_living_flutterdemo/ui/pages/firm/FirmHomeView/widgets/projectSection.dart';
import 'package:people_living_flutterdemo/ui/widget/BKShowDialog.dart';
import 'package:people_living_flutterdemo/ui/widget/SharedWeChat.dart';
import 'package:people_living_flutterdemo/ui/widget/button_widget/TextIconButton.dart';
import '../../../../core/models/FirmHomeModel/developer_detail_entity.dart';

class developer_detail_view extends StatefulWidget {
  static const String routeName = '/firmhome/developer_detail';

  developer_detail_view({Key? key, required this.developerId})
      : super(key: key);
  String developerId = '';

  //Function(bool isselfRecommendStatus) onRefresh;

  @override
  State<developer_detail_view> createState() => _developer_detailViewState();
}

class _developer_detailViewState extends State<developer_detail_view> {
  late DeveloperDetailData newdata = DeveloperDetailData();
  late bool collected = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    getDeveloperDetail();
    getCollectStatus(widget.developerId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: m_AppBar(
        context, 
        "开发者详情", 
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
                    ProjectConfig.developerDetailShareUrl(newdata.id ?? 0), 
                    title: newdata.careerDto?.careerDirectionName ?? '', 
                    description: newdata.realName,
                    scene: scene
                  );
                }
              )
            );
          }, icon: Icon(Icons.share))
        ]
      ),
      backgroundColor: Colors.white,
      body: content(newdata, context)
    );
  }

  Widget content(DeveloperDetailData data, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: contentWidget(data, context)),
        bottomView()
      ]
    );
  }

  /// 底部按钮view
  Widget bottomView(){
    return Container(
      height: 100.px,
      padding: EdgeInsets.fromLTRB(16.px, 10.px, 16.px, 10.px),
      // decoration: BoxDecoration(
      //   border: Border(
      //     top: BorderSide(color: m_colors.bordersColor)
      //   )
      // ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextIconButton(
            icon: Image.asset(
              collected ?
               'icon_collected'.png : 
               'icon_collect'.png,
              width: 20.px,
              height: 20.px
            ), 
            text: Text('收藏', style: TextStyle(fontSize: 13.px)), 
            type: TextIconButtonType.imageTop,
            onTap: () {
              if (collected) {
                cancelCollectDeveloper(widget.developerId);
              } else {
                collectDeveloper(widget.developerId);
              }
            },
          ),
          SizedBox(width: 20.px),
          TextIconButton(
            icon: Image.asset('devep_signing'.png, width: 20.px, height: 20.px),
            text: Text('签约', style: TextStyle(fontSize: 13.px)), 
            type: TextIconButtonType.imageTop,
            onTap: () {
              
            },
          ),
          SizedBox(width: 20.px),
          Expanded(
            child: MainButton(
              text: '预约面试(添加企业微信)',
              OnPressed: (){
                showCupertinoAlertDialog(context);
              },
            )
          )
        ],
      ),
    );
  }

  /// 注册微信分享
  initWeChat(){
    WchatManager.initFluwx((error) {
      EasyLoading.showError(error, duration: const Duration(seconds: 3));
    });
  }

  /// 获取开发者详情
  getDeveloperDetail(){
    EasyLoading.show(status: '请求中...', maskType: EasyLoadingMaskType.black);
    FirmHomeService.getDeveloperDetail(widget.developerId, (object) {
      if (object.isSuccess) {
        setState(() {
          newdata = object.data;
        });
        EasyLoading.dismiss();
      } else {
        EasyLoading.showToast(object.message!);
      }
    });
  }

  /// 是否收藏
  getCollectStatus(String developerId) {
    FirmCollectService.getCollectStatus(developerId,(object){
      if (object.isSuccess){
        setState(() {
          collected = object.data;
        });
      }else {
        EasyLoading.showToast(object.message ?? '');
      }
      initWeChat();
    });
  }

  /// 收藏
  collectDeveloper(String developerId) {
    FirmCollectService.collectDeveloper(
        developerId,
        (object) => {
              if (object.isSuccess)
                {
                  setState(() {
                    collected = true;
                    EasyLoading.showToast('收藏成功');
                  })
                }
            });
  }
  /// 取消收藏
  cancelCollectDeveloper(String developerId) {
    FirmCollectService.cancelCollectDeveloper(developerId,(object) => {
      if (object.isSuccess){
        setState(() {
          collected = false;
          EasyLoading.showToast('取消收藏');
        })
      }
    });
  }


  showCupertinoAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return BKShowDialog(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 30.px),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.px)
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: (){
                          Navigator.pop(context);
                        }, 
                        icon: Icon(Icons.close)
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 40.px),
                    child: Image.asset(
                      "icon_e_Qrcode".png,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(height: 26.px),
                  Text(
                    "手机截图二维码",
                    style: TextStyle(
                      fontSize: 18.px, 
                      color: m_colors.title_01_color, 
                      fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16.px),
                  Text(
                    "微信扫描添加客服咨询",
                    style: TextStyle(
                      fontSize: 12.px, 
                      color: m_colors.content_02_color
                    )
                  ),
                  SizedBox(height: 30.px)
                ],
              ),
            )
          );
        }
      );
  }
  showAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('提示'),
            content: Text('确认删除吗？'),
            backgroundColor: Colors.white,
            elevation: 5,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            actions: <Widget>[
              ElevatedButton(
                child: Text('取消'),
                onPressed: () {},
              ),
              ElevatedButton(
                child: Text('确认'),
                onPressed: () {},
              ),
            ],
          );
        });
  }

  //首页 内容组件
  Widget contentWidget(DeveloperDetailData data, BuildContext context) {
    return EasyRefresh(
      enableControlFinishRefresh: true,
      child: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.px),
                    DeveloperInfo(data),
                    Container(
                      height: 8.px,
                      color: m_colors.back_01_color,
                    ),
                    DucationSection(data),
                    WorkSection(data),
                    ProjectSection(data)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}