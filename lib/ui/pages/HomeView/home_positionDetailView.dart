import 'package:flutter/material.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';
import 'package:people_living_flutterdemo/core/components/m_AppBar.dart';
import 'package:people_living_flutterdemo/core/components/m_mainButton.dart';
import 'package:people_living_flutterdemo/core/service/home_api/home_api.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:people_living_flutterdemo/ProjectConfig/tools.dart';
import '../../../core/models/index.dart';

class PositionDetailView extends StatefulWidget {
  static const String routeName = '/home_positionDetail';
  PositionDetailView({Key? key, required this.postitonID}) : super(key: key);
  String postitonID;
  //Function(bool isselfRecommendStatus) onRefresh;

  @override
  State<PositionDetailView> createState() => _PositionDetailViewState();
}

class _PositionDetailViewState extends State<PositionDetailView> {
  late Home_position_detail_model detail_model = Home_position_detail_model();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    EasyLoading.show(status: '请求中...', maskType: EasyLoadingMaskType.black);
    HomeService.getPositionDetail(widget.postitonID, (object) {
      if (object.isSuccess) {
        setState(() {
          detail_model = object.data;
        });
        EasyLoading.showToast("请求成功");
      } else {
        EasyLoading.showToast(object.message!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: m_AppBar(context, "职位详情"),
      body: SingleChildScrollView(
        child: Container(
          color: Color.fromRGBO(255, 255, 255, 1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(detail_model.title ?? "",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: m_colors.title_01_color)),
                        Text(
                            m_tools.getPayText(
                                (detail_model.startPay ?? 0.0).toInt(),
                                (detail_model.endPay ?? 0.0).toInt()),
                            style: TextStyle(
                                color: m_colors.backColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w600))
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        CreateIconView(
                            "images/home/icon_home_positiondetail_04.png",
                            detail_model.workDaysModeName ?? ""),
                        CreateIconView(
                            "images/home/icon_home_positiondetail_01.png",
                            detail_model.workYearsName ?? ""),
                        CreateIconView(
                            "images/home/icon_home_positiondetail_02.png",
                            detail_model.educationName ?? ""),
                        CreateIconView(
                            "images/home/icon_home_positiondetail_03.png",
                            "${detail_model.recruitCount}人"),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Container(
                height: 8,
                color: m_colors.back_01_color,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(16, 24, 16, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "职位要求",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: m_colors.title_01_color),
                    ),
                    SizedBox(height: 16),
                    Wrap(
                      spacing: 6.0,
                      runSpacing: 6.0,
                      children: createTitleViews(detail_model.skillNames ?? []),
                    ),
                    SizedBox(height: 24),
                    Divider(
                      color: m_colors.divider_02_color,
                    ),
                    SizedBox(height: 24),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "职位描述",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: m_colors.title_01_color),
                        ),
                        SizedBox(height: 16),
                        Text(detail_model.description ?? "",
                            style: TextStyle(
                              fontSize: 13,
                              color: m_colors.content_02_color,
                            ))
                      ],
                    ),
                    SizedBox(height: 24),
                    Divider(
                      color: m_colors.divider_02_color,
                    ),
                    SizedBox(height: 24),
                    Text(
                      "企业信息",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: m_colors.title_01_color),
                    ),
                    SizedBox(
                      height: 16,
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
                            //CreateName(User.userInfo.realName),
                            m_tools.SubString(detail_model.companyName ?? ""),

                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              detail_model.companyName ?? "",
                              style: TextStyle(
                                  color: m_colors.content_01_color,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "${detail_model.companyIndustryName}·${detail_model.companyPersonSizeName}",
                              style: TextStyle(
                                color: m_colors.content_02_color,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 16),
                    Divider(
                      color: m_colors.divider_02_color,
                    ),
                    SizedBox(height: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              "images/home/icon_home_positiondetail_05.png",
                              width: 16,
                              height: 16,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(width: 2),
                            Text(
                              "常用协作工具",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: m_colors.content_01_color,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Wrap(
                          spacing: 6.0,
                          runSpacing: 6.0,
                          children: createTitleViews(
                              detail_model.companyTeamToolsDescNames ?? []),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 25),
              MainButton(
                text: "立即自荐",
                heigth: 54,
                disable: !(detail_model.selfRecommendStatus ?? true),
                OnPressed: () {
                  if (!detail_model.selfRecommendStatus!) {
                    EasyLoading.show(status: '自荐中...');
                    HomeService.postRecommended(
                        detail_model.positionId!.toString(), (object) {
                      if (object.isSuccess) {
                        setState(() {
                          detail_model.selfRecommendStatus = true;
                        });
                        EasyLoading.showToast("自荐成功");
                      } else {
                        EasyLoading.showToast(object.message!);
                      }
                    });
                  }
                  print('1231');
                },
              )
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}

Widget CreateIconView(String imgPath, String title) {
  return Container(
    padding: EdgeInsets.only(right: 18),
    child: Row(
      children: [
        Image.asset(
          imgPath,
          width: 14,
          height: 14,
          fit: BoxFit.cover,
        ),
        SizedBox(width: 5),
        Text(
          title,
          style: TextStyle(fontSize: 13, color: m_colors.content_01_color),
        )
      ],
    ),
  );
}

List<Widget> createTitleViews(List titles) {
  List<Widget> childArray = [];
  for (var title in titles) {
    childArray.add(Container(
      //margin: EdgeInsets.fromLTRB(0, 0, 4, 0),
      padding: EdgeInsets.fromLTRB(8, 2, 8, 2),
      decoration: BoxDecoration(
          //设置四周圆角 角度
          borderRadius: BorderRadius.all(Radius.circular(2.0)),
          //设置四周边框
          //border: Border.all(width: 1, color: m_colors.backColor),
          color: m_colors.back_01_color),
      child: Text(
        title,
        style: TextStyle(fontSize: 12, color: m_colors.content_01_color),
      ),
    ));
  }
  return childArray;
}
