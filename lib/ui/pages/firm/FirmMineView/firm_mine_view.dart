import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:people_living_flutterdemo/ProjectConfig/user_manager.dart';
import 'package:people_living_flutterdemo/ProjectConfig/Navigate/service_locator.dart';
import 'package:people_living_flutterdemo/ProjectConfig/Navigate/NavigateService.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';
import 'package:people_living_flutterdemo/core/extension/int_extension.dart';
import 'package:people_living_flutterdemo/core/extension/string_extension.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/BillList/BillListWidget.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/personal_about_ttsl.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/personal_account_setting.dart';
import 'package:people_living_flutterdemo/ui/pages/WebView/m_webView.dart';
import 'package:people_living_flutterdemo/core/service/userLogin_api/user_Login.dart';
import 'package:people_living_flutterdemo/ProjectConfig/tools.dart';
import 'package:people_living_flutterdemo/ui/pages/firm/FirmMineView/AccountManageView.dart';
import 'package:people_living_flutterdemo/ui/pages/firm/FirmMineView/AuditionManageView.dart';
import 'package:people_living_flutterdemo/ui/pages/firm/FirmMineView/firm_certification_view.dart';
import 'package:people_living_flutterdemo/ui/shared/app_size_fit.dart';
import 'package:people_living_flutterdemo/ui/widget/EasyRefreshHeader.dart';
import 'package:people_living_flutterdemo/ui/widget/SectionCellView.dart';
import 'package:people_living_flutterdemo/ui/pages/firm/FirmMineView/notification/firm_notification.dart';
import '../../../../ProjectConfig/ProjectConfig.dart';
import 'FirmManageView.dart';
import 'TreatyOrderView.dart';
import 'check_role/firm_check_role.dart';


class firm_mine_View extends StatefulWidget {
  firm_mine_View({Key? key}) : super(key: key);
  static const String routeName = '/firmmine';
  @override
  State<firm_mine_View> createState() => _firm_mine_ViewState();
}

class _firm_mine_ViewState extends State<firm_mine_View> {
  EasyRefreshController _controller = EasyRefreshController();
  /// 是否有消息
  bool _isHasNotifications = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserInfo();
  }

  /// 请求用户基本信息
  getUserInfo(){
    LoginService.GetCompUserInfo((object) {
      if (object.isSuccess) {
        _controller.finishRefresh();
      }else {
        EasyLoading.showError(object.message ?? '');
      }
    });

    LoginService.getHasNotification((object){
      if (object.isSuccess) {
        setState(() {
          _isHasNotifications = object.data;
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
          height: 300.px,
          fit: BoxFit.fill,
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
              headerView(isHasNotifications: _isHasNotifications,), 
              createListView()
            ]
          ),
        ),
      ),
      onRefresh: () async{
        await Future.delayed(const Duration(seconds: 0), () {
          // 结束加载
          getUserInfo();
        });
      }
    );
  }
}

class headerView extends StatelessWidget {
  headerView({Key? key, this.isHasNotifications = false}) : super(key: key);
  bool isHasNotifications;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50.px),
          GestureDetector(
            child: Container(
              height: 50.px,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Stack(children: [
                    Image.asset(
                      'pro_notification'.png,
                      width: 18.px, height: 19.px
                    ),
                   
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
                            borderRadius: BorderRadius.circular(3.px),
                          ),
                        )
                      )
                    ),
                  ]
                )
              ],
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(firm_notification.routeName);
            },
          ),
          Row(
            children: [
              userAvatar(),
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
                  // SizedBox(height: 2.px),
                  // Text(
                  //   User.userInfo.careerDirection ?? "尚未确认职业",
                  //   style: const TextStyle(
                  //     color: m_colors.content_02_color,
                  //     fontSize: 12,
                  //   ),
                  // ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }


  Widget userAvatar(){
    return isShowImageUrl() ? 
    ClipRRect(
      child: Image.network(
        User.userInfo.avatarUrl ?? '', 
        width: 50.px, height: 50.px
      ),
      borderRadius: const BorderRadius.all(Radius.circular(25)),
    ) : 
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
    );
  }

  bool isShowImageUrl(){
    if (User.userInfo.avatarUrl != null && User.userInfo.avatarUrl!.contains('http')) {
      return true;
    }else {
      return false;
    }
  }
}


class createListView extends StatelessWidget {
  const createListView({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 30.px),
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 30.px),
                  height: 90.px,
                  width: BKSizeFit.screenWidth,
                  decoration:const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8)),
                  ),
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/icon_audition_manage.png', width: 30.px, height: 30.px),
                            SizedBox(height: 4.px),
                            Text(
                              "面试管理",
                              style: TextStyle(
                                color: Colors.black, 
                                fontSize: 12.px,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.of(context).pushNamed(AuditionManageView.routeName);
                        },
                      ),
                      GestureDetector(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/icon_treaty_order.png', width: 30.px, height: 30.px),
                            SizedBox(height: 4.px),
                            Text(
                              "合约单",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12.px,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.of(context).pushNamed(TreatyOrderView.routeName);
                        },
                      ),
                      GestureDetector(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/icon_firm_account.png', width: 30.px, height: 30.px),
                            SizedBox(height: 4.px),
                            Text(
                              "账户管理",
                              style: TextStyle(
                                color: Colors.black, 
                                fontSize: 12.px,
                                fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.of(context).pushNamed(AccountManageView.routeName);
                        },
                      ),
                      GestureDetector(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/icon_firm_manage.png', width: 30.px, height: 30.px),
                            SizedBox(height: 4.px),
                            Text(
                              "企业管理",
                              style: TextStyle(
                                color: Colors.black, 
                                fontSize: 12.px,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.of(context).pushNamed(FirmManageView.routeName);
                        },
                      ),
                    ],
                  ),
                ),
                SectionCellView(
                  imgURl:"images/person/icon_person_meau_01.png",
                  title: "身份切换", 
                  subTitle: '企业端',
                  onTap: (title) {
                    pushSwitchRoute(title, context);
                  }
                ),

                SectionCellView(
                  imgURl:"images/person/icon_person_meau_01.png",
                  title: "企业认证", 
                  subTitle: User.statusTitle(),
                  onTap: (title) {
                    pushSwitchRoute(title, context);
                  }
                ),
              
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
                )
              ],
            ),
          ],
        )
      );
  }

  pushSwitchRoute(String title, BuildContext context){
    switch (title) {
        case "身份切换":
          // Navigator.of(context!).pushNamed(PersonCheckRoleView.routeName);
          Navigator.of(context!).pushNamed(FirmCheckRoleView.routeName);
          break;
        case "企业认证":
          // getIt<NavigateService>().pushNamed(CretaeUserInfoView.routeName);
          Navigator.of(context).pushNamed(firm_certification_view.routeName,
              arguments: {"type": "1"}).then((value) {
          });
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

