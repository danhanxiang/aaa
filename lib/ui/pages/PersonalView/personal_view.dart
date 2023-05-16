import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:people_living_flutterdemo/ProjectConfig/user_manager.dart';
import 'package:people_living_flutterdemo/ProjectConfig/Navigate/service_locator.dart';
import 'package:people_living_flutterdemo/ProjectConfig/Navigate/NavigateService.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';
import 'package:people_living_flutterdemo/core/extension/double_extension.dart';
import 'package:people_living_flutterdemo/core/extension/int_extension.dart';
import 'package:people_living_flutterdemo/core/extension/string_extension.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/BillList/BillListWidget.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/InterViewSetting/wiget/interViewSetting.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/person_updateUserInfo/personal_updateUserinfo.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/personal_about_ttsl.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/personal_account_setting.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/personal_check_role.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/personal_historicalOrders/personal_historicalOrders.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/signContract/SigningWarning.dart';
import 'package:people_living_flutterdemo/ui/pages/WebView/m_webView.dart';
import 'package:people_living_flutterdemo/core/service/userLogin_api/user_Login.dart';
import 'package:people_living_flutterdemo/ProjectConfig/tools.dart';
import 'package:people_living_flutterdemo/ui/shared/app_size_fit.dart';
import 'package:people_living_flutterdemo/ui/widget/EasyRefreshHeader.dart';
import 'package:people_living_flutterdemo/ui/widget/SectionCellView.dart';
import 'package:people_living_flutterdemo/ui/widget/SectionView.dart';

import '../../../../ProjectConfig/ProjectConfig.dart';
import 'message/NotificationView.dart';

class personalView extends StatefulWidget {
  personalView({Key? key}) : super(key: key);
  static const String routeName = '/personal';
  @override
  State<personalView> createState() => _personalViewState();
}

class _personalViewState extends State<personalView> {
  EasyRefreshController _controller = EasyRefreshController();
  
  bool isHasNotifications = false;

  // final List<Widget> _contentList = [headerView(isHasNotifications: isHasNotifications,), createListView()];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserInfo();
  }

  /// 请求用户基本信息
  getUserInfo(){
    LoginService.GetDevUserInfo((object) {
      if (object.isSuccess) {
        _controller.finishRefresh();
      }else {
        EasyLoading.showError(object.message ?? '');
      }
    });

    LoginService.getHasNotification((object){
      if (object.isSuccess) {
        setState(() {
          isHasNotifications = object.data;
        });
      }else {
         EasyLoading.showError(object.message ?? '');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: easyRefresh(context),
      backgroundColor: Colors.white,
    );
  }

  Widget easyRefresh(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "images/person/icon_person_meau_back.png",
          width: BKSizeFit.screenWidth,
          // height: 300.px,
          fit: BoxFit.fitWidth,
        ),
        contentWidget()
      ],
    );
  }

  //我的页面 内容组件
  Widget contentWidget() {
    return EasyRefresh(
      enableControlFinishRefresh: true,
      header: BKRefresh.addRefreshHeader(),
      controller: _controller,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.px),
          child: Column(
            children: [
              devHeaderView(),
              createDevListView()
            ]
          ),
        ),
      ),
      onRefresh: () async{  
        await Future.delayed(const Duration(seconds: 0), () {
          // 结束加载
          getUserInfo();
        });
    });
  }
  
  @override
  Widget devHeaderView() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top.px),
          GestureDetector(
            child: Container(
              height: 50.px,
              child: Row( 
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Stack(children: [
                    Image.asset('pro_notification'.png, width: 18.px, height: 19.px),
                    Visibility(
                      visible: isHasNotifications,
                      child: Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          width: 6.px,
                          height: 6.px,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            border: Border.all(
                              width: 0.5,
                              color: Colors.white
                            ),
                            borderRadius: BorderRadius.circular(3),
                          ),
                        )
                      ),
                    )
                  ],)
              ],
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(NotificationView.routeName);
            },
          ),
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                width: 50.px,
                height: 50.px,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.px),
                  color: m_colors.title_01_color,
                ),
                child: Text(
                  m_tools.SubString(User.userInfo.realName ?? "朋友"),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.px,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(width: 12.px),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    User.userInfo.realName ?? "你好，新朋友",
                    style: TextStyle(
                        color: m_colors.title_01_color,
                        fontSize: 20.px,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 2.px),
                  Text(
                    User.userInfo.careerDirection ?? "尚未确认职业",
                    style: TextStyle(
                      color: m_colors.content_02_color,
                      fontSize: 12.px,
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 24.px),
          Container(
            height: 82.px,
            decoration: BoxDecoration(
              color: m_colors.backColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${User.userInfo.signContractNum}次",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.px,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "签约次数",
                      style: TextStyle(color: Colors.white, fontSize: 12.px),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.px,
                  width: 1,
                  child: Container(
                    color: Colors.white,
                  ),
                ),
                GestureDetector(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "¥${User.userInfo.profitTotal?.moneyFormat}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.px,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "累计收益",
                        style: TextStyle(color: Colors.white, fontSize: 12.px),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed(BillListWidget.routeName);
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

}


class createDevListView extends StatelessWidget {
  const createDevListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            SectionView("平台", 'images/person/icon_person_meau_header01.png'),
            SectionCellView(
              title: '身份切换', 
              imgURl: 'images/person/icon_person_meau_01.png',
              subTitle: '开发者端',onTap: (title) {
                pushSwitchRoute(title, context);
              }
            ),
            SectionCellView(
              title: '入驻资料', 
              imgURl: 'images/person/icon_person_meau_01.png', 
              subTitle: User.statusTitle(),
              onTap: (title) {
                pushSwitchRoute(title, context);
              },  
            ),
            SectionCellView(
              imgURl:"images/person/icon_person_meau_02.png", 
              title:"服务协议", 
              subTitle: '待签约',
              onTap: (title) {
                pushSwitchRoute(title, context);
              },  
            ),
            SectionCellView(
              imgURl: "images/person/icon_person_meau_04.png", 
              title: "技能测评",
              onTap: (title) {
                pushSwitchRoute(title, context);
              }
            ),
            SectionCellView(
              imgURl: "images/person/icon_person_meau_03.png", 
              title: "面试管理",
              onTap: (title) {
                pushSwitchRoute(title, context);
              }
            ),
            SectionCellView(
              imgURl: "images/person/icon_person_meau_05.png", 
              title: "历史账单",
              onTap: (title) {
                pushSwitchRoute(title, context);
              }
            ),
          ],
        ),
        Divider(color: m_colors.divider_02_color),
          // Column(
          //   children: [
          //     createCellHeader(
          //         "资金", "images/person/icon_person_meau_header02.png"),
          //     createCell("images/person/icon_person_meau_05.png", "收益账单", context: context),
          //     // createCell("images/person/icon_person_meau_06.png", "推荐有礼"),
          //   ],
          // ),
          // Divider(
          //   color: m_colors.divider_02_color,
          // ),
        Column(
          children: [
            SectionView("其他", "images/person/icon_person_meau_header03.png"),
            SectionCellView(
              imgURl: "images/person/icon_person_meau_07.png", 
              title: "隐私政策",
              onTap: (title) {
                pushSwitchRoute(title, context);
              }
            ),
            SectionCellView(
              imgURl: "images/person/icon_person_meau_08.png", 
              title: "用户协议",
              onTap: (title) {
                pushSwitchRoute(title, context);
              }
            ),
            SectionCellView(
              imgURl: "images/person/icon_person_meau_09.png", 
              title: "账户设置",
              onTap: (title) {
                pushSwitchRoute(title, context);
              }
            ),
            SectionCellView(
              imgURl: "images/person/icon_person_meau_10.png", 
              title: "关于天天数链开发者APP",
              onTap: (title) {
                pushSwitchRoute(title, context);
              }
            ),
          ],
        ),
      ],
    );
  }

  pushSwitchRoute(String title, BuildContext context){
    switch (title) {
        case "身份切换":
          Navigator.of(context).pushNamed(PersonCheckRoleView.routeName);
          break;
        case "入驻资料":
          getIt<NavigateService>().pushNamed(CretaeUserInfoView.routeName);
          break;
        case "服务协议":
          // Navigator.push(
          //   context!,
          //   MaterialPageRoute(builder: (_) => MapLocation())
          // );
          Navigator.of(context).pushNamed(SigningWarning.routeName);
          break;
        case "面试管理":
          Navigator.of(context).pushNamed(InterViewSetting.routeName);
          break;
        case "技能测评":
          break;
        case "历史账单":
          /// routes: MyRouter.routes, 
          Navigator.of(context).pushNamed(HistoricalOrders.routeName, arguments: 's');
          // Navigator.pushNamed(context!, HistoricalOrders.routeName, arguments: 'beck');
          // 
          // Navigator.of(context!).push(
          //   MaterialPageRoute( builder: (context) {
          //     return HistoricalOrders();
          //   },settings: RouteSettings(
          //     arguments: 'dsadads1',
          //   ), // 传参
          //   fullscreenDialog: false
          //   )
          // );
          
          break;
        case "推荐有礼":
          break;
        case "隐私政策":
          getIt<NavigateService>().pushNamed(inAppWebView.routeName,
              arguments: {"baseUrl": ProjectConfig.YSZC, "title": "隐私政策"});
          break;
        case "用户协议":
          getIt<NavigateService>().pushNamed(inAppWebView.routeName,
              arguments: {"baseUrl": ProjectConfig.YHXY, "title": "隐私政策"});
          break;
        case "账户设置":
          getIt<NavigateService>().pushNamed(Account_settingView.routeName);
          break;
        case "关于天天数链开发者APP":
          getIt<NavigateService>().pushNamed(About_ttslView.routeName);
          break;
        default:
      }
  }
}
