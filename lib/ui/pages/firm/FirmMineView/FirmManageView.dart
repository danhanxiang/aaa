
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';
import 'package:people_living_flutterdemo/core/components/m_AppBar.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../../../../core/models/FirmMineModel/firm_manage_list_entity.dart';
import '../../../../core/service/firm_mine_api/firm_mine_api.dart';
import '../../../widget/EasyRefreshHeader.dart';
import 'FirmPersonCheckView.dart';
import 'InterviewPersonView.dart';

///企业管理
class FirmManageView extends StatefulWidget {
  static const String routeName = '/firmmine/firm_manage';

  const FirmManageView({Key? key}) : super(key: key);

  @override
  State<FirmManageView> createState() => _FirmManageViewState();
}

class _FirmManageViewState extends State<FirmManageView> {
  late bool collected = false;
  List<FirmManageListDataList> list = [];
  late EasyRefreshController _controller;
  var pageNum = 1;

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
    // getFirmAuditionList(pageNum);
    getFirmMemberList(pageNum);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: m_AppBar(context, '企业管理', action: navigationBar(context)),
        backgroundColor: Colors.white,
        body: content(context));
    // contentWidget(newdata, context));
  }

  Widget content(BuildContext context) {
    return Stack(
      children: [
        contentWidget(context),
        Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                width: double.infinity,
                color: Colors.white,
                child: AuditionButton('邀请成员', true, double.infinity, () {
                  Navigator.of(context).pushNamed(InterviewPersonView.routeName);

                })))
      ],
    );
  }

  //首页 内容组件
  Widget contentWidget(BuildContext context) {
    return EasyRefresh(
      enableControlFinishRefresh: true,
      enableControlFinishLoad: true,
      controller: _controller,
      onRefresh: () async {
        await Future.delayed(Duration(seconds: 2), () {
          pageNum = 1;
          getFirmMemberList(pageNum);
        });
      },
      // 上拉加载事件回调
      onLoad: () async {
        await Future.delayed(Duration(seconds: 2), () {
          pageNum++;
          getFirmMemberList(pageNum);
        });
      },
      header: BKRefresh.addRefreshHeader(),
      // 自定义顶部上啦加载
      footer: BKRefresh.addLoadFooter(),
      child: ListView(
        children: list.map((item) => ItemView(context, item)).toList(),
      ),
    );
  }

  /// 面试列表
  void getFirmMemberList(int pageNum) {
    EasyLoading.show(status: '请求中...', maskType: EasyLoadingMaskType.black);
    FirmMineService.getFirmMemberList(pageNum, (object) {
      if (object.isSuccess) {
        EasyLoading.dismiss();
        setState(() {
          FirmManageListData newdata = object.data;
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
Widget ItemView(BuildContext context, FirmManageListDataList data) {
  return Container(
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(color: m_colors.divider_01_color, width: 10))),
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '在职',
            style: TextStyle(
                color: m_colors.backColor,
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Divider(
            height: 1,
            color: m_colors.bordersColor,
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '姓名',
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
              Text(
                '${data.realName ?? 'xxx'}',
                style: const TextStyle(color: Colors.black, fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '职位',
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
              Text(
                '${data.positionName}',
                style: const TextStyle(color: Colors.black, fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '手机号',
                style:  TextStyle(color: Colors.grey, fontSize: 14),
              ),
              Row(
                children: [
                  Text(
                    '${data.mobile}',
                    style: const TextStyle(color: Colors.black, fontSize: 14),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  const Text(
                    '图片',
                    style: const TextStyle(
                        color: m_colors.backColor, fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AuditionButton('移交管理员', false, 110, () {
                showAlertDialog(context, '移交管理员', '移交管理员给xxx', () {
                  EasyLoading.showToast('移交管理员');
                });
              }),
              SizedBox(
                width: 10,
              ),
              AuditionButton('移除', true, 110, () {
                showAlertDialog(context, '移除', '移除xxx', () {
                  EasyLoading.showToast('移除');
                });
              }),
            ],
          ),
        ],
      ));
}

///三个面试按钮
Widget AuditionButton(String text, bool cancel, double width, OnPressed) {
  return GestureDetector(
    child: Container(
      width: width,
      padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: m_colors.bordersColor),
        color: cancel ? m_colors.backColor : Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: cancel ? Colors.white : Colors.black, fontSize: 14),
      ),
    ),
    onTap: OnPressed,
  );
}

/// 教育信息列表

List<Widget> navigationBar(BuildContext context) {
  return [
    TextButton(
        onPressed: (() {
          Navigator.of(context).pushNamed(FirmPersonCheckView.routeName);
        }),
        child: Container(
          alignment: Alignment.center,
          height: 36,
          width: 60,
          child: Text(
            "审核",
            style: TextStyle(color: Colors.black),
          ),
        )),
  ];
}

void showAlertDialog(
    BuildContext context, String title, String content, OnPressed) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 22),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                content,
                style: const TextStyle(
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
                    onPressed: OnPressed,
                  )
                ],
              )
            ],
          ),
        );
      });
}
