import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';
import 'package:people_living_flutterdemo/ProjectConfig/user_manager.dart';
import 'package:people_living_flutterdemo/core/components/m_AppBar.dart';
import 'package:people_living_flutterdemo/core/components/m_mainButton.dart';
import 'package:people_living_flutterdemo/ui/pages/Login/login.dart';

class Account_settingView extends StatelessWidget {
  static const String routeName = '/account_settingView';
  const Account_settingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: m_AppBar(context, "账号设置", color: Colors.white),
      backgroundColor: Colors.white,
      body: Container(
          color: Colors.white,
          padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
          child: Stack(
            children: [
              Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "手机号",
                          style: TextStyle(
                            fontSize: 15,
                            color: m_colors.title_01_color,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              ((User.userInfo.mobile ?? "").length >= 11
                                  ? User.userInfo.mobile!.replaceFirst(
                                      new RegExp(r'\d{4}'), '****', 3)
                                  : ""),
                              style: TextStyle(
                                  fontSize: 15,
                                  color: m_colors.content_02_color),
                            ),
                            Image.asset(
                              "images/person/icon_person_meau_arrow.png",
                              width: 20,
                              height: 20,
                              fit: BoxFit.cover,
                            )
                          ],
                        )
                      ]),
                  SizedBox(
                    height: 16,
                  ),
                  Divider(
                    color: m_colors.divider_02_color,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  GestureDetector(
                      onTap: () {
                        print("注销账户");
                      },
                      child: Container(
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "注销账户",
                              style: TextStyle(
                                fontSize: 15,
                                color: m_colors.title_01_color,
                              ),
                            ),
                            Image.asset(
                              "images/person/icon_person_meau_arrow.png",
                              width: 20,
                              height: 20,
                              fit: BoxFit.cover,
                            )
                          ],
                        ),
                      )),
                  SizedBox(
                    height: 16,
                  ),
                  Divider(
                    color: m_colors.divider_02_color,
                  ),
                ],
              ),
              Positioned(
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.fromLTRB(0, 17, 0, 17),
                  child: m_Button(
                    text: "退出登录",
                    OnPressed: () {
                      // User.saveIsLogin(false);
                      // Navigator.of(context).pushNamed(LoginView.routeName);

                      showAlertDialog(context);
                    },
                  ),
                ),
                bottom: 20,
                left: 0,
                right: 0,
                height: 80,
              )
            ],
          )),
    );
  }
}

void showAlertDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '提示',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 22),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                '是否退出登录？',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 14),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  ElevatedButton(
                    child: const Text('取消',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 14)),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            EdgeInsets.only(left: 36, right: 36)),
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor:
                            MaterialStateProperty.all(m_colors.disableColor),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ))),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    child: const Text('确定',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 14)),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            EdgeInsets.only(left: 36, right: 36)),
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor:
                            MaterialStateProperty.all(m_colors.backColor),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)))),
                    onPressed: () {
                      User.saveIsLogin(false);
                      Navigator.of(context).pushNamed(LoginView.routeName);
                    },
                  )
                ],
              )
            ],
          ),
        );
      });
}
