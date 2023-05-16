import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_pickers/pickers.dart';
import 'package:flutter_pickers/time_picker/model/date_mode.dart';
import 'package:flutter_pickers/time_picker/model/pduration.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';
import 'package:people_living_flutterdemo/core/components/m_AppBar.dart';
import 'package:people_living_flutterdemo/core/components/m_mainButton.dart';
import 'package:people_living_flutterdemo/core/models/FirmMineModel/account_wallet_entity.dart';
import 'package:people_living_flutterdemo/ui/pages/firm/FirmMineView/AuditionHistoryView.dart';
import 'package:people_living_flutterdemo/ui/shared/app_size_fit.dart';
import 'package:people_living_flutterdemo/ui/widget/EasyRefreshHeader.dart';
import '../../../../core/models/FirmCollectModel/firm_collect_entity.dart';
import '../../../../core/models/FirmMineModel/account_wallet_list_entity.dart';
import '../../../../core/models/FirmMineModel/audition_item_list_entity.dart';
import '../../../../core/service/firm_collect_api/firm_collect_api.dart';
import '../../../../core/service/firm_mine_api/firm_mine_api.dart';
import '../../../../utils/CommonUtils.dart';

///面试管理
class AuditionDetailView extends StatefulWidget {
  static const String routeName = '/firm/audition_detail';

  AuditionDetailView({Key? key, required this.listBean}) : super(key: key);
  late AuditionItemListDataList listBean;

  @override
  State<AuditionDetailView> createState() => _AuditionDetailViewState();
}

class _AuditionDetailViewState extends State<AuditionDetailView> {
  late EasyRefreshController _controller;

  List<AuditionItemListDataList> list = [];

  // List<FirmCollectDataList> list = [];

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();

    // getFirmAuditionList(pageNum);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: m_AppBar(context, '面试信息'),
        // body: listRow()
        body: contentView(context,widget.listBean));
  }

  /// 面试列表
  void getFirmAuditionList(int pageNum) {
    FirmMineService.getFirmAuditionApi(pageNum, (object) {
      if (object.isSuccess) {
        setState(() {
          AuditionItemListData newdata = object.data;
          if (newdata.list != null) {
            if (pageNum == 1) {
              list.clear();
              list.addAll(newdata.list!);
              _controller.finishRefresh();
            } else {
              if (newdata.list!.isNotEmpty) {
                list.addAll(newdata.list!);
              }
              _controller.finishLoad();
            }
          }
        });
      } else {
        EasyLoading.showToast(object.message ?? '请求错误！');
      }
    });
  }
}



Widget contentView(BuildContext context, AuditionItemListDataList listBean) {
  return Container(
    color: Colors.white,
    child: Stack(
      children: [
        EasyRefresh(
          enableControlFinishRefresh: true,
          enableControlFinishLoad: false,
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(bottom: 30),
              child: detailView(listBean),
            ),
          ),
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 60,
              width: double.infinity,
              padding: EdgeInsets.only(right: 16, left: 16),
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
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '时间',
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
              Text(
                '${listBean.interviewStartDate}',
                style: const TextStyle(color: Colors.black, fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '面试职位',
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
              Text(
                '${listBean.title}',
                style: const TextStyle(color: Colors.black, fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '面试者',
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
              Text(
                '${listBean.realName}',
                style: const TextStyle(color: Colors.black, fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '会议号',
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
              Text(
                '${listBean.meetingCode??'暂无会议号'}',
                style: const TextStyle(color: Colors.black, fontSize: 14),
              ),
            ],
          ),
        ],
      ));
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
