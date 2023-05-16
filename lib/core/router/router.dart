import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:people_living_flutterdemo/ui/pages/main/Tabs.dart';
import 'package:people_living_flutterdemo/ui/pages/ContractView/contract_view.dart';
import 'package:people_living_flutterdemo/ui/pages/ContractView/position_detail.dart';
import 'package:people_living_flutterdemo/ui/pages/HomeView/home_positionDetailView.dart';
import 'package:people_living_flutterdemo/ui/pages/HomeView/home_view.dart';
import 'package:people_living_flutterdemo/ui/pages/Login/login_codePhone.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/myResume.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/person_updateUserInfo/personal_ImportResume.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/person_updateUserInfo/personal_add_education.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/person_updateUserInfo/personal_add_professional.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/person_updateUserInfo/personal_add_project.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/person_updateUserInfo/personal_add_userinfo.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/person_updateUserInfo/personal_add_workExperience.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/person_updateUserInfo/personal_choose_skills.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/personal_about_ttsl.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/personal_account_setting.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/personal_view.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/personal_historicalOrders/personal_historicalOrders.dart'; // 历史订单
import 'package:people_living_flutterdemo/ui/pages/Login/login.dart';
import 'package:people_living_flutterdemo/ProjectConfig/user_manager.dart';
import 'package:people_living_flutterdemo/ui/pages/WebView/m_webView.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/person_updateUserInfo/personal_updateUserinfo.dart';
import 'package:people_living_flutterdemo/ui/pages/main/main.dart';
import 'package:people_living_flutterdemo/utils/log.dart';


class MyRouter {
  //配置路由
  static final Map<String, WidgetBuilder> routes = {
    BKMainScreen.routeName:(context, {arguments}) => BKMainScreen(),
    //跟路由
    // Tabs.routeName: (context, {arguments}) => Tabs(),
    //登录成功  替换根目录
    LoginView.routeName: (context, {arguments}) => LoginView(),
    //验证码登录
    CodePhoneView.routeName: (context, {arguments}) => CodePhoneView(),
    //首页
    homeView.routeName: (context, {arguments}) => homeView(),
    //合约
    positionView.routeName: (context, {arguments}) => positionView(),
    //我的
    personalView.routeName: (context, {arguments}) => personalView(),
    //webview
    inAppWebView.routeName: (context, {arguments}) => inAppWebView(baseDic: arguments),
    //职位详情
    PositionDetailView.routeName: (context, {arguments}) => PositionDetailView( postitonID: arguments ),
     //入驻资料
    CretaeUserInfoView.routeName: (context, {arguments}) => CretaeUserInfoView(),
    //编辑基本信息
    add_userInfoView.routeName: (context, {arguments}) => add_userInfoView( userDataModel: arguments ),
    //编辑职业信息
    add_professionalView.routeName: (context, {arguments}) => add_professionalView(userDataModel: arguments),
    //编辑教育信息
    add_educationView.routeName: (context, {arguments}) => add_educationView(StateMap: arguments),
    //编辑工作经历
    add_workExperience.routeName: (context, {arguments}) => add_workExperience(StateMap: arguments),
    //编辑项目经历
    add_projectView.routeName: (context, {arguments}) => add_projectView(StateMap: arguments),
    //导入简历
    importResume.routeName: (context, {arguments}) => importResume(),
    //选择技能
    choose_skillsView.routeName: (context, {arguments}) => choose_skillsView(projectDtoModel: arguments),
    //账号设置
    Account_settingView.routeName: (context, {arguments}) => Account_settingView(),
    //账号设置
    About_ttslView.routeName: (context, {arguments}) => About_ttslView(),
    //预料简历
    MyResume.routeName: (context, {arguments}) => MyResume(arguments),
    //账号设置
    positionDetail.routeName: (context, {arguments}) => positionDetail(developerId: arguments,),
    // 历史订单
    HistoricalOrders.routeName: (context, {arguments}) => HistoricalOrders(title: arguments),
      // OrderItemListView.routeName: (context, {arguments}) => OrderItemListView(),
  };

  //初始化加载路由
  static const String initialRoute = Tabs.routeName;

  // 勾子函数 当routes没有的时候执行
  static final RouteFactory onGenerateRoute = (RouteSettings settings) {
    bkLog('我是登录状态判断:' + '${User.isLogin}', StackTrace.current);
    //String? 表示name为可空类型
    final String? name = settings.name;
    bkLog('settings: $name', StackTrace.current);
    //Function? 表示pageContentBuilder为可空类型
    final Function? pageContentBuilder;

    //登录状态直接进主页跟路由
    if (User.isLogin != null && User.isLogin) {
      pageContentBuilder = routes[name];
    } else {
      if (name == LoginView.routeName|| name == CodePhoneView.routeName) {
        pageContentBuilder = routes[name];
      } else {
        pageContentBuilder = routes[LoginView.routeName];
      }
    }

    if (pageContentBuilder != null) {
      if (settings.arguments != null) {
        // 路由带有参数
        return MaterialPageRoute(
            builder: (context) =>
                pageContentBuilder!(context, arguments: settings.arguments));
      } else {
        return MaterialPageRoute(builder: (context) => pageContentBuilder!(context));
      }
    }
    assert(false, 'Need to implement ${settings.name}');
    return null;
  };
}



/* 栗子：带有参数的
if (name == HistoricalOrders.routeName){
return MaterialPageRoute(
  builder: (context) {
    return HistoricalOrders(title: settings.arguments );
  });
}
*/