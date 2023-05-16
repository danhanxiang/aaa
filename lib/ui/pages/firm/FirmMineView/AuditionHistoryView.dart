import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_pickers/time_picker/model/pduration.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';
import 'package:people_living_flutterdemo/core/components/m_AppBar.dart';
import 'package:people_living_flutterdemo/core/models/FirmMineModel/account_wallet_entity.dart';
import 'package:people_living_flutterdemo/ui/widget/EasyRefreshHeader.dart';
import '../../../../core/models/FirmMineModel/audition_item_list_entity.dart';
import '../../../../core/service/firm_mine_api/firm_mine_api.dart';
import 'package:people_living_flutterdemo/ui/pages/firm/FirmHomeView/developer_detail_view.dart';
import 'AuditionDetailView.dart';

///面试管理
class AuditionHistoryView extends StatefulWidget {
  AuditionHistoryView({Key? key}) : super(key: key);

  static const String routeName = '/firm/audition_history';

  @override
  State<AuditionHistoryView> createState() => _AuditionHistoryViewState();
}

class _AuditionHistoryViewState extends State<AuditionHistoryView> {
  late EasyRefreshController _controller;

  List<AuditionItemListDataList> list = [];

  // List<FirmCollectDataList> list = [];
  var pageNum = 1;
  AccountWalletData? _accountWalletData;
  PDuration? addAgeText;

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();

    getFirmAuditionHistoryList(pageNum);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: m_AppBar(context, '历史面试'),
        // body: listRow()
        body: Container(
            alignment: Alignment.center,
            color: Colors.white,
            child: list.isNotEmpty
                ? EasyRefresh(
                    // 是否开启控制结束加载
                    enableControlFinishLoad: false,
                    enableControlFinishRefresh: false,
                    // 控制器
                    controller: _controller,
                    onRefresh: () async {
                      await Future.delayed(Duration(seconds: 0), () {
                        // 结束加载
                        pageNum = 1;
                        // getFirmAuditionList(pageNum);
                        getFirmAuditionHistoryList(pageNum);

                        // _controller.finishRefresh();
                      });
                    },
                    // 上拉加载事件回调
                    onLoad: () async {
                      await Future.delayed(Duration(seconds: 2), () {
                        // 结束加载
                        // _controller.finishLoad();
                        pageNum++;
                        // getFirmAuditionList(pageNum);
                        getFirmAuditionHistoryList(pageNum);
                      });
                    },
                    header: BKRefresh.addRefreshHeader(),
                    // 自定义顶部上啦加载
                    footer: BKRefresh.addLoadFooter(),
                    // child: listRow(),
                    child: ListView(
                      children:
                          list.map((item) => ItemView(context, item)).toList(),
                    ),
                  )
                : Container(
                    margin: const EdgeInsets.only(top: 150),
                    color: Colors.white,
                    child: Column(
                      children: [
                        Image.asset('images/home/icon_home_noPosition.png',
                            fit: BoxFit.cover, width: 78, height: 52),
                        const SizedBox(height: 16),
                        const Text(
                          '暂无数据',
                          style: TextStyle(
                              fontSize: 13, color: m_colors.content_02_color),
                        ),
                      ],
                    ),
                  )));
  }

  /// 面试列表
  void getFirmAuditionHistoryList(int pageNum) {
    FirmMineService.getFirmAuditionHistoryApi(pageNum, (object) {
      if (object.isSuccess) {
        setState(() {
          AuditionItemListData newdata = object.data;
          if (newdata.list!=null&&newdata.list!.length>=0) {
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

/// 列表item widget
Widget ItemView(BuildContext context, AuditionItemListDataList data) {
  return GestureDetector(
    child: Container(
        decoration: const BoxDecoration(
            border: Border(
                bottom:
                    BorderSide(color: m_colors.divider_01_color, width: 10))),
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${data.interviewStartDate?.split(' ')[0]}',
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Divider(
              height: 1,
              color: m_colors.bordersColor,
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '时间',
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
                Text(
                  '${data.interviewStartDate}',
                  style: const TextStyle(color: Colors.black, fontSize: 14,fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '面试职位',
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
                Text(
                  '${data.title}',
                  style: const TextStyle(color: Colors.black, fontSize: 14,fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '面试者',
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
                Row(
                  children: [
                    Text(
                      '${data.realName}',
                      style: const TextStyle(color: Colors.black, fontSize: 14,fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                      child: Text(
                        '查看简历',
                        style: const TextStyle(
                            color: m_colors.backColor, fontSize: 14),
                      ),
                      onTap: () {
                        // Navigator.of(context).pushNamed(developer_detail_view.routeName(),
                        //     arguments: data.developerId);
                        Navigator.of(context).pushNamed(developer_detail_view.routeName,
                            arguments: data.developerId.toString());
                      },
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
          ],
        )),
    onTap: () {
      Navigator.of(context)
          .pushNamed(AuditionDetailView.routeName, arguments: data);
    },
  );
}
