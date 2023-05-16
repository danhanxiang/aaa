import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:people_living_flutterdemo/core/components/m_AppBar.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/services.dart';
import 'package:people_living_flutterdemo/utils/utils.dart';
import '../../../res/colors.dart';

class CheckRoleView extends StatelessWidget {
  static const String routeName = '/home_check_role';

  const CheckRoleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: m_AppBar(context, "", color: Colors.white),
        backgroundColor: Colors.white,
        body: contentWidget());
  }
}

/// 职位描述
Widget PositionDec() {
  String pc_url = 'talent.tntlinking.com';
  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 24),
        const Text('欢迎入驻无界云工',
            style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w800,
                color: Colors.black)),
        const SizedBox(height: 10),
        const Text('随时随地开展自己热爱的事业',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: Colors.black)),
        const SizedBox(height: 24),
        Container(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: Image.asset(
            "assets/images/bg_check_role.png",
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 24),
        const Text('打开电脑输入网址',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black)),
        const SizedBox(height: 14),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Text(
                pc_url,
                style: const TextStyle(
                    color: Colours.color_4850ff,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colours.color_4850ff, width: 1),
                  borderRadius: const BorderRadius.all(Radius.circular(8))),
            ),
            const SizedBox(width: 8),
            GestureDetector(
              child: Image.asset(
                "assets/images/icon_copy.png",
                width: 26,
                height: 26,
              ),
              onTap: () {
                EasyLoading.showToast('复制成功');
                Clipboard.setData(ClipboardData(text: pc_url));
              },
            )
          ],
        )
      ],
    ),
  );
}

//首页 内容组件
Widget contentWidget() {
  return EasyRefresh(
    enableControlFinishRefresh: true,
    enableControlFinishLoad: false,
    child: SingleChildScrollView(
      child: Container(
        color: Color.fromRGBO(255, 255, 255, 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PositionDec(),
            const SizedBox(height: 8),
          ],
        ),
      ),
    ),
  );
}
