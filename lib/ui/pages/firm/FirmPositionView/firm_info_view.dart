import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';
import 'package:people_living_flutterdemo/core/components/m_AppBar.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:people_living_flutterdemo/core/components/m_mainButton.dart';
import 'package:people_living_flutterdemo/core/service/firm_position_api/firm_position_api.dart';
import '../../../../core/models/FirmMineModel/treaty_order_list_entity.dart';
import '../../../../core/models/FirmPositionModel/firm_info_id_bean_entity.dart';
import '../../../../core/models/FirmPositionModel/firm_position_entity.dart';
import '../../../../core/service/firm_mine_api/firm_mine_api.dart';
import '../../../../utils/utils.dart';
import '../../../widget/EasyRefreshHeader.dart';
import '../FirmMineView/FirmManageView.dart';

class firm_info_view extends StatefulWidget {
  static const String routeName = '/firmhome/firm_info';
  final FirmPositionDataList bean;

  const firm_info_view({required this.bean});

  @override
  State<firm_info_view> createState() => _firm_info_viewState();
}

class _firm_info_viewState extends State<firm_info_view> {
  var pageNum = 1;
  late FirmInfoIdBeanData beanIds;

  @override
  void initState() {
    super.initState();
    getPositionOriginal(widget.bean.id ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: m_AppBar(context, '企业信息'),
      body: contentWidget(context),
    );
  }

  Widget contentWidget(BuildContext context) {
    return EasyRefresh(
      // 是否开启控制结束加载
      enableControlFinishLoad: false,
      enableControlFinishRefresh: false,
      child: Column(
        children: [
          _topView(context, widget.bean),
          _contentiew()
        ],
      ),
    );
  }

  Widget _topView(BuildContext context, FirmPositionDataList bean) {
    return GestureDetector(
      child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                  bottom:
                      BorderSide(color: m_colors.divider_01_color, width: 10))),
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bean.title ?? 'xxx',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    bean.companyName ?? '',
                    style: TextStyle(color: m_colors.dark_text, fontSize: 14),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '${bean.trainingMode}-${bean.education ?? '不限'}-工作经验${bean.workYears}-${bean.careerDirection}',
                    style: TextStyle(color: m_colors.dark_text, fontSize: 14),
                  ),
                ],
              ),
              m_Button(
                text: '修改',
                OnPressed: () {},
              )
            ],
          )),
      onTap: () {},
    );
  }

  void getPositionOriginal(int positionId) {
    FirmPositionService.getPositionOriginalApi(positionId, (object) {
      if (object.isSuccess) {
        beanIds = object.data;
      }
    });
  }
}

Widget _contentiew() {
  return Container(
    margin: EdgeInsets.only(top: 70),
    color: Colors.white,
    child: Column(
      children: [
        Image.asset(
          "assets/images/icon_wechat_qr.png",
          width: 100,
          height: 100,
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          '审核未通过',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          '因为涉黄涉毒，可修改您添加的职位或联系运营',
          style: TextStyle(color: Colors.grey),
        ),
        const SizedBox(
          height: 10,
        ),
        m_Button(
          text: '联系运营',
        )
      ],
    ),
  );
}
