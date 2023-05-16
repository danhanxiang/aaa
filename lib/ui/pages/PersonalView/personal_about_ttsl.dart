import 'package:flutter/material.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';
import 'package:people_living_flutterdemo/core/components/m_AppBar.dart';
import 'package:package_info_plus/package_info_plus.dart';

class About_ttslView extends StatelessWidget {
  static const String routeName = '/about_ttsl';
  const About_ttslView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: m_AppBar(context, "关于天天数链开发者"),
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Center(
                heightFactor: 6.0,
                child: Container(
                  clipBehavior: Clip.hardEdge, //裁剪
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
                  child: Image.asset(
                    "images/person/icon_person_Logo.png",
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                child: FutureBuilder(
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("V ${snapshot.data ?? ""}",
                            style: TextStyle(
                                fontSize: 18,
                                color: m_colors.content_01_color,
                                fontWeight: FontWeight.w600)),
                        Text(
                          "Tiantian Digital Chain © 2022",
                          style: TextStyle(
                              fontSize: 16, color: m_colors.content_02_color),
                        )
                      ],
                    );
                  },
                  future: getAPPversion(),
                ),
                bottom: 80,
                left: 0,
                right: 0,
              )
            ],
          ),
        ));
  }
}

Future<String> getAPPversion() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  String appName = packageInfo.appName;
  String packageName = packageInfo.packageName;
  String version = packageInfo.version;
  String buildNumber = packageInfo.buildNumber;
  print(version);
  return version;
}
