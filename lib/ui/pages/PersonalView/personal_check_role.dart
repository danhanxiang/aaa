import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';
import 'package:people_living_flutterdemo/ProjectConfig/user_manager.dart';
import 'package:people_living_flutterdemo/core/components/m_AppBar.dart';
import '../firm/Firmmain.dart';

class PersonCheckRoleView extends StatelessWidget {
  static const String routeName = '/person_check_role';

  const PersonCheckRoleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: m_AppBar(context, "身份切换", color: Colors.white),
      backgroundColor: Colors.white,
      body: Container(
          color: Colors.white,
          padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
          child: contentWidget(context)),
    );
  }
}

//我的页面 内容组件
Widget contentWidget(BuildContext context) {
  return EasyRefresh(
    enableControlFinishRefresh: true,
    enableControlFinishLoad: false,
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '身份切换',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w600, fontSize: 30),
          ),
          roleListView(context)
        ],
      ),
    ),
  );
}

Widget roleListView(BuildContext context) {
  return Column(
    children: [
      SizedBox(
        height: 30,
      ),
      GestureDetector(
        child: Container(
          alignment: Alignment.centerLeft,
          width: double.infinity,
          height: 100,
          child: Row(
            children: [
              SizedBox(
                width: 16,
              ),
              Image.asset(
                "assets/images/icon_firm_dev.png",
                width: 30,
                height: 30,
                fit: BoxFit.cover,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                '当前人才端',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: m_colors.backColor, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        onTap: (){

        },
      ),
      SizedBox(
        height: 20,
      ),
      GestureDetector(
        child: Container(
          alignment: Alignment.centerLeft,
          width: double.infinity,
          height: 100,
          child: Row(
            children: [
              SizedBox(
                width: 16,
              ),
              Image.asset(
                "assets/images/icon_firm_admin.png",
                width: 30,
                height: 30,
                fit: BoxFit.cover,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                '切换成招聘端',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: m_colors.dark_text, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        onTap: (){
          showAlertDialog(context);
        },
      )
    ],
  );
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
                '身份切换',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 22),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                '切换成企业账户？',
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
                    child: const Text('否',
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
                    child: const Text('是',
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
                      User.saveChangeStyle(1);
                      Navigator.of(context).pushNamedAndRemoveUntil(FirmmainScreen.routeName, (Route route) =>false);
                    },
                  )
                ],
              )
            ],
          ),
        );
      });
}
