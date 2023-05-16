import 'package:flutter/material.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';
import 'package:people_living_flutterdemo/ProjectConfig/tools.dart';
import '../../../core/models/index.dart';

class PositionRecommentCellView extends StatefulWidget {
  late Home_positionListModel model;
  PositionRecommentCellView(Home_positionListModel model) {
    this.model = model;
  }

  @override
  State<PositionRecommentCellView> createState() =>
      _PositionRecommentCellViewState();
}

class _PositionRecommentCellViewState extends State<PositionRecommentCellView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(16, 20, 16, 0),
      //color: Colors.white,
      decoration: BoxDecoration(
          color: Colors.white,
          //设置四周圆角 角度
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          //设置四周边框
          border: Border.all(width: 1, color: Color.fromRGBO(237, 239, 241, 1)),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, 3.0), //阴影xy轴偏移量
                blurRadius: 10.0, //阴影模糊程度
                spreadRadius: 0.0 //阴影扩散程度
                )
          ]),
      child: Container(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(widget.model.title,
                        style: TextStyle(
                            color: m_colors.title_01_color,
                            fontSize: 15,
                            fontWeight: FontWeight.w600)),
                    Offstage(
                      offstage: !widget.model.selfRecommendStatus,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(6, 0, 0, 0),
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          //设置四周圆角 角度
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                          //设置四周边框
                          border:
                              Border.all(width: 1, color: m_colors.backColor),
                        ),
                        child: Text('已自荐',
                            style: TextStyle(
                              color: m_colors.backColor,
                              fontSize: 9,
                            )),
                      ),
                    )
                  ],
                ),
                Text(
                    m_tools.getPayText(widget.model.startPay.toInt(),
                        widget.model.endPay.toInt()),
                    style: TextStyle(
                        color: m_colors.backColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w600))
              ],
            ),
            SizedBox(height: 12),
            Row(
              children: [
                createTitleView(widget.model.workDaysModeName),
                createTitleView(widget.model.educationName),
                createTitleView(widget.model.workYearsName),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Divider(
              height: 1,
              color: m_colors.divider_02_color,
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Color.fromRGBO(32, 40, 57, 1),
                  ),
                  child: Text(
                    //CreateName(User.userInfo.realName),
                    m_tools.SubString(widget.model.companyRecruiterRealName),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                            '${widget.model.companyRecruiterRealName}·${widget.model.companyRecruiterPosition}',
                            style: TextStyle(
                                color: m_colors.content_01_color,
                                fontSize: 13)),
                        SizedBox(width: 4),
                        // if (widget.model.recommendByOperate)
                        //   {
                        Offstage(
                          offstage: !widget.model.recommendByOperate,
                          child: Image.asset(
                            'images/home/icon_home_recommended.png',
                            height: 18,
                            width: 54,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      widget.model.companyName,
                      style: TextStyle(
                          color: m_colors.content_02_color, fontSize: 12),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget createTitleView(String title) {
  return Container(
    margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
    padding: EdgeInsets.fromLTRB(4, 2, 4, 2),
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
  );
}

String CreateName(String? name) {
  if (name!.length >= 2) {
    String newName = name;
    return newName.substring(newName.length - 2);
  }
  return name;
}
