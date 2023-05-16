import 'package:flutter/material.dart';
import 'package:people_living_flutterdemo/ProjectConfig/user_manager.dart';
import 'package:people_living_flutterdemo/ProjectConfig/Navigate/service_locator.dart';
import 'package:people_living_flutterdemo/ProjectConfig/Navigate/NavigateService.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/person_updateUserInfo/personal_updateUserinfo.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/personal_about_ttsl.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/personal_account_setting.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/personal_historicalOrders/personal_historicalOrders.dart';
import 'package:people_living_flutterdemo/ui/pages/WebView/m_webView.dart';
import 'package:people_living_flutterdemo/core/service/userLogin_api/user_Login.dart';
import 'package:people_living_flutterdemo/ProjectConfig/tools.dart';
import 'package:people_living_flutterdemo/ui/shared/app_size_fit.dart';
import 'package:people_living_flutterdemo/ui/widget/map/MapLocation.dart';
import 'package:people_living_flutterdemo/utils/log.dart';

import '../../../../ProjectConfig/ProjectConfig.dart';

class personalView extends StatefulWidget {
  personalView({Key? key}) : super(key: key);
  static const String routeName = '/personal';
  @override
  State<personalView> createState() => _personalViewState();
}

class _personalViewState extends State<personalView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LoginService.GetUserInfo((object) {
      if (object.isSuccess) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: createPersonView(),
      backgroundColor: Colors.white,
      // MainButton(
      //     text: '退出登录',
      //     OnPressed: () {
      //       User.saveIsLogin(false);

      //     }),
    );
  }
}

class createPersonView extends StatelessWidget {
  const createPersonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "images/person/icon_person_meau_back.png",
          width: BKSizeFit.screenWidth,
          height: 250,
          fit: BoxFit.cover,
        ),
        SingleChildScrollView(
          child: Column(
            children: [headerView(), createListView()],
          ),
        ),
      ],
    );
  }
}

class headerView extends StatelessWidget {
  const headerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 90,
          ),
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: m_colors.title_01_color,
                ),
                child: Text(
                  m_tools.SubString(User.userInfo.realName ?? "朋友"),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    User.userInfo.realName ?? "你好，新朋友",
                    style: TextStyle(
                        color: m_colors.title_01_color,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    User.userInfo.careerDirection ?? "尚未确认职业",
                    style: TextStyle(
                      color: m_colors.content_02_color,
                      fontSize: 12,
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 24,
          ),
          Container(
            height: 82,
            width: BKSizeFit.screenWidth,
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
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "签约次数",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                  width: 1,
                  child: Container(
                    color: Colors.white,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "¥${User.userInfo.profitTotal}",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "累计收益",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class createListView extends StatelessWidget {
  const createListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Column(
          children: [
            Column(
              children: [
                createCellHeader(
                    "平台", "images/person/icon_person_meau_header01.png"),
                createCell("images/person/icon_person_meau_01.png", "入驻资料"),
                createCell("images/person/icon_person_meau_02.png", "服务协议", context: context),
                createCell("images/person/icon_person_meau_03.png", "面试设置"),
                createCell("images/person/icon_person_meau_04.png", "参与测评"),
              ],
            ),
            Divider(
              color: m_colors.divider_02_color,
            ),
            Column(
              children: [
                createCellHeader(
                    "资金", "images/person/icon_person_meau_header02.png"),
                createCell("images/person/icon_person_meau_05.png", "收益账单", context: context),
                createCell("images/person/icon_person_meau_06.png", "推荐有礼"),
              ],
            ),
            Divider(
              color: m_colors.divider_02_color,
            ),
            Column(
              children: [
                createCellHeader(
                    "其他", "images/person/icon_person_meau_header03.png"),
                createCell("images/person/icon_person_meau_07.png", "隐私政策"),
                createCell("images/person/icon_person_meau_08.png", "用户协议"),
                createCell("images/person/icon_person_meau_09.png", "账户设置"),
                createCell(
                    "images/person/icon_person_meau_10.png", "关于天天数链开发者APP"),
              ],
            ),
          ],
        ));
  }
}

Widget createCellHeader(String title, String imgURl) {
  return Container(
    margin: EdgeInsets.fromLTRB(0, 24, 0, 16),
    child: Row(
      children: [
        Image.asset(
          imgURl,
          width: 12,
          height: 12,
          fit: BoxFit.cover,
        ),
        SizedBox(
          width: 4,
        ),
        Text(
          title,
          style: TextStyle(fontSize: 13, color: m_colors.content_02_color),
        )
      ],
    ),
  );
}

Widget createCell(String imgURl, String title, {BuildContext? context}) {
  return GestureDetector(
    child: Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(0, 0, 0, 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                imgURl,
                width: 24,
                height: 24,
                fit: BoxFit.cover,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: m_colors.content_01_color),
              )
            ],
          ),
          Row(
            children: [
              Offstage(
                offstage: (title == "入驻资料" || title == "服务协议") ? false : true,
                child: Text(
                  isTitle(title),
                  style:
                      TextStyle(fontSize: 13, color: m_colors.content_02_color),
                ),
              ),
              Image.asset(
                "images/person/icon_person_meau_arrow.png",
                width: 24,
                height: 24,
                fit: BoxFit.cover,
              )
            ],
          )
        ],
      ),
    ),
    onTap: () {
      switch (title) {
        case "入驻资料":
          getIt<NavigateService>().pushNamed(CretaeUserInfoView.routeName);
          break;
        case "服务协议":

        Navigator.push(
          context!,
          MaterialPageRoute(builder: (_) => MapLocation())
        );

            // Navigator.of(context!).pushNamed('routeName');
          break;
        case "面试设置":
          break;
        case "参与测评":
          break;
        case "收益账单":

          /// routes: MyRouter.routes, 
          Navigator.of(context!).pushNamed(HistoricalOrders.routeName, arguments: 's');
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

      print(title);
    },
  );
}

String isTitle(String title) {
  if (title == "入驻资料") {
    if (User.userInfo.status == 1) {
      return "待完善";
    } else if (User.userInfo.status == 2) {
      return "待审核";
    } else if (User.userInfo.status == 3) {
      return "审核成功";
    } else if (User.userInfo.status == 4) {
      return "审核失败";
    } else {
      return "未知";
    }
  } else {
    return "待签约";
  }
}
