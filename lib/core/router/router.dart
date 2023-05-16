import 'package:flutter/material.dart';
import 'package:people_living_flutterdemo/ui/pages/DealView/DealView.dart';
import 'package:people_living_flutterdemo/ui/pages/DealView/HistoryDailyView.dart';
import 'package:people_living_flutterdemo/ui/pages/ForWorkView/forwork_view.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/BillList/BillDetailWidget.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/BillList/BillListWidget.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/InterViewSetting/wiget/InterviewDetail.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/message/NotificationView.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/person_updateUserInfo/personal_Guide.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/person_updateUserInfo/personal_careerDirection.dart';
import 'package:people_living_flutterdemo/ui/pages/firm/FirmHomeView/developer_detail_view.dart';
import 'package:people_living_flutterdemo/ui/pages/firm/FirmHomeView/firm_home_search_view.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/signContract/SigningWarning.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/signContract/SigningWarning_info.dart';
import 'package:people_living_flutterdemo/ui/pages/firm/FirmMineView/AuditionDetailView.dart';
import 'package:people_living_flutterdemo/ui/pages/firm/FirmMineView/AuditionHistoryView.dart';
import 'package:people_living_flutterdemo/ui/pages/firm/FirmMineView/check_role/firm_check_role.dart';
import 'package:people_living_flutterdemo/ui/pages/firm/FirmMineView/new_company_view.dart';
import 'package:people_living_flutterdemo/ui/pages/firm/FirmMineView/notification/firm_notification.dart';
import 'package:people_living_flutterdemo/ui/pages/firm/FirmMineView/notification/widget/firm_InterDetailView.dart';
import 'package:people_living_flutterdemo/ui/pages/firm/Firmmain.dart';
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


import '../../ui/pages/PersonalView/InterViewSetting/wiget/interViewSetting.dart';
import '../../ui/pages/HomeView/home_CheckRole.dart';
import '../../ui/pages/PersonalView/personal_check_role.dart';
import '../../ui/pages/firm/FirmMineView/AccountManageView.dart';
import '../../ui/pages/firm/FirmMineView/AuditionManageView.dart';
import '../../ui/pages/firm/FirmMineView/FirmManageView.dart';
import '../../ui/pages/firm/FirmMineView/FirmPersonCheckView.dart';
import '../../ui/pages/firm/FirmMineView/InterviewPersonView.dart';
import '../../ui/pages/firm/FirmMineView/TreatyOrderSearchView.dart';
import '../../ui/pages/firm/FirmMineView/TreatyOrderView.dart';
import '../../ui/pages/firm/FirmMineView/firm_certification_view.dart';
import '../../ui/pages/firm/FirmMineView/firm_search_company_view.dart';
import '../../ui/pages/firm/FirmPositionView/firm_info_view.dart';
import '../../ui/pages/firm/FirmPositionView/firm_publish_position_view.dart';
import '../../ui/pages/firm/FirmPositionView/recommend_position_view.dart';



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
    homeView.routeName:(context, {arguments}) => homeView(),
    /// 工作台
    DealView.routeName:(context, {arguments}) => DealView(),
    //职位推荐
    positionView.routeName: (context, {arguments}) => positionView(),
    //找工作
    ForWorkView.routeName: (context, {arguments}) => ForWorkView(),
    //我的
    personalView.routeName: (context, {arguments}) => personalView(),
    //webview
    inAppWebView.routeName: (context, {arguments}) => inAppWebView(baseDic: arguments),
    //职位详情
    PositionDetailView.routeName: (context, {arguments}) => PositionDetailView( postitonID: arguments ),
    //入驻无界云工页面
    CheckRoleView.routeName: (context, {arguments}) => CheckRoleView(),
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
    //添加,编辑项目经历
    add_projectView.routeName: (context, {arguments}) => add_projectView(StateMap: arguments[0], careerDirectionId: arguments[1]),
    //导入简历
    importResume.routeName: (context, {arguments}) => importResume(),
    /// 上传简历
    personal_Guide.routeName:(context, {arguments}) =>  personal_Guide(),
    //选择技能
    choose_skillsView.routeName: (context, {arguments}) => choose_skillsView(projectSkillList: arguments[0], careerDirectionId: arguments[1],),
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
    /// 面试管理
    InterViewSetting.routeName:(context, {arguments}) => InterViewSetting(),
    /// 查看面试 
    InterviewDetail.routeName:(context, {arguments}) => InterviewDetail(interId: arguments,),
    /// 收益账单
    BillListWidget.routeName:(context, {arguments}) => BillListWidget(),
    /// 账单明细
    BillDetailWidget.routeName:(context, {arguments}) => BillDetailWidget(item: arguments), 
    /// 职位方向
    personal_careerDirection.routeName:(context, {arguments}) => personal_careerDirection(), 
    /// 面试管理
    PersonCheckRoleView.routeName:(context, {arguments}) => PersonCheckRoleView(),
    /// 签约须知
    SigningWarning.routeName:(context, {arguments}) => SigningWarning(),
    /// 签约信息
    SigningWarning_info.routeName:(context, {arguments}) => SigningWarning_info(),
    /// 消息
    NotificationView.routeName:(context, {arguments}) => NotificationView(),
    /// 历史日报
    HistoryDailyView.routeName:(context, {arguments}) => HistoryDailyView(orderId: arguments,),
    
    ///---------------------企业端页面---------------------------
    ///
    /// 企业端主页面
    FirmmainScreen.routeName:(context, {arguments}) => FirmmainScreen(),
    /// 企业主页搜索页面
    firm_home_search_View.routeName:(context, {arguments}) => firm_home_search_View(),
    /// 企业端 开发者详情页面
    developer_detail_view.routeName:(context, {arguments}) => developer_detail_view(developerId: arguments),
    /// 企业端切换角色页面
    FirmCheckRoleView.routeName:(context, {arguments}) => FirmCheckRoleView(),
    /// 企业端账户管理
    AccountManageView.routeName:(context, {arguments}) => AccountManageView(),
    ///面试管理页面
    AuditionManageView.routeName:(context, {arguments}) => AuditionManageView(),
    ///面试记录
    AuditionHistoryView.routeName:(context, {arguments}) => AuditionHistoryView(),
    ///面试详情
    AuditionDetailView.routeName: (context, {arguments}) => AuditionDetailView(listBean: arguments ),
    /// 合约单页面
    TreatyOrderView.routeName:(context, {arguments}) => TreatyOrderView(),
    /// 消息
    firm_notification.routeName:(context, {arguments}) => firm_notification(),
    /// 面试信息详情
    firm_InterDetailView.routeName: (context, {arguments}) => firm_InterDetailView(interviewId: arguments),

    /// 合约单页面搜索页面
    TreatyOrderSearchView.routeName:(context, {arguments}) => TreatyOrderSearchView(),
    /// 企业管理页面
    FirmManageView.routeName:(context, {arguments}) => FirmManageView(),
    /// 企业人员审核页面
    FirmPersonCheckView.routeName:(context, {arguments}) => FirmPersonCheckView(),
    /// 邀请成员
    InterviewPersonView.routeName:(context, {arguments}) => InterviewPersonView(),
    /// 发布职位
    firm_publish_position_view.routeName:(context, {arguments}) => firm_publish_position_view(StateMap: arguments),
    /// 推荐
    recommend_position_view.routeName:(context, {arguments}) => recommend_position_view(bean: arguments ),
    /// 企业信息页面
    firm_info_view.routeName:(context, {arguments}) => firm_info_view(bean: arguments ),
    /// 企业认证
    firm_certification_view.routeName:(context, {arguments}) => firm_certification_view(StateMap: arguments),
    /// 搜索所属公司
    firm_search_company_view.routeName:(context, {arguments}) => firm_search_company_view(),
    /// 搜索所属公司
    new_company_view.routeName:(context, {arguments}) => new_company_view(),

  };

  //初始化加载路由
  static String get initialRoute{
    switch (User.identity) {
      case 0:
      // 开发者端
        return BKMainScreen.routeName;
      case 1:
      // 企业端
        return FirmmainScreen.routeName;
      default: return '';
    }
  }

  // 勾子函数 当routes没有的时候执行
  static final RouteFactory onGenerateRoute = (RouteSettings settings) {
    String route = switchMainRoute();
    bkLog('我是:' + '${User.identity == 0 ? '开发者端': '企业端'} - $route', StackTrace.current);
    bkLog('我是登录状态判断:' + '${User.isLogin}', StackTrace.current);
    //String? 表示name为可空类型
    final String? name = settings.name;
    bkLog('settings: $name', StackTrace.current);
    //Function? 表示pageContentBuilder为可空类型
    final Function? pageContentBuilder;

    
    //登录状态直接进主页跟路由
    if (User.isLogin != null && User.isLogin) {
      // 是否为第一次进来
      pageContentBuilder = routes[User.isFirst ? route : name];
      User.isFirst = false;
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
  


  static String switchMainRoute(){
    switch (User.identity) {
      case 0:
      // 开发者端
        return BKMainScreen.routeName;
      case 1:
      // 企业端
        return FirmmainScreen.routeName;
      default: return '';
    }
  }

}



/* 栗子：带有参数的
if (name == HistoricalOrders.routeName){
return MaterialPageRoute(
  builder: (context) {
    return HistoricalOrders(title: settings.arguments );
  });
}
*/