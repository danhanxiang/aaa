import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';
import 'package:people_living_flutterdemo/core/components/m_AppBar.dart';
import 'package:people_living_flutterdemo/core/components/placeholderWidget.dart';
import 'package:people_living_flutterdemo/core/extension/int_extension.dart';
import 'package:people_living_flutterdemo/core/models/FirmMineModel/audition_item_list_entity.dart';
import 'package:people_living_flutterdemo/core/service/firm_mine_api/firm_mine_api.dart';

///面试管理

class firm_InterDetailView extends StatefulWidget {
  static const String routeName = '/firm_InterDetailView';

  firm_InterDetailView({Key? key, required this.interviewId}) : super(key: key);
  int interviewId;

  @override
  State<firm_InterDetailView> createState() => _firm_InterDetailViewState();
}

class _firm_InterDetailViewState extends State<firm_InterDetailView> {

  AuditionItemListDataList? model;

  @override
  void initState() {
    super.initState();
    getFirmAuditionDetail();
  }

  /// 面试列表
  void getFirmAuditionDetail() {
    EasyLoading();
    FirmMineService.getAuditionDetailApi(widget.interviewId, (object){
      EasyLoading.dismiss();
      if (object.isSuccess) {
        setState(() {
          model = object.data;
        });
      } else {
        EasyLoading.showToast(object.message ?? '请求错误！');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: m_AppBar(context, '面试信息'),
      body: bodyWidget()
    );
  }

  Widget bodyWidget(){
    return 
    model == null ? 
    const PlaceholderWidget()
    :contentView(context)
    ;
  }

  Widget contentView(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.px),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          detailView(model!),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 60,
                width: double.infinity,
                padding: EdgeInsets.only(right: 16.px, left: 16.px),
                color: Colors.white,
                child: AuditionButton('进入腾讯会议',true,(){
                  EasyLoading.showToast('进入腾讯会议。。。。。');
                }),
              ))
        ],
      ),
    );
  }

  Widget detailView( AuditionItemListDataList listBean) {
    return Container(
        padding: EdgeInsets.fromLTRB(16.px, 20.px, 16.px, 20.px),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12.px),
            cell('时间', '${listBean.interviewStartDate}'),
            SizedBox(height: 12.px),
            cell('面试职位', '${listBean.positionName}'),
            SizedBox(height: 12.px),
            cell('面试者', '${listBean.developerName}'),
            SizedBox(height: 12.px),
            cell('会议号', '${listBean.meetingCode??'暂无会议号'}'),
          ],
        )
      );
  }

  Widget AuditionButton(String text, bool cancel,OnPressed) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        alignment: Alignment.center,
        padding: EdgeInsets.fromLTRB(16, 7, 16, 7),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: m_colors.bordersColor),
          color: cancel ? m_colors.backColor : Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        child: Text(
          text,
          style: TextStyle(
              color: cancel ? Colors.white : Colors.black, fontSize: 14),
        ),
      ),
      onTap:OnPressed,
    );
  }


  Widget cell(String title, String subTitle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(color: Colors.grey, fontSize: 14.px),
        ),
        Text(
          subTitle,
          style: TextStyle(
            color: m_colors.title_01_color, 
            fontSize: 14.px, 
            fontWeight: FontWeight.w600
          ),
        ),
      ],
    );
  }
}