import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';
import 'package:people_living_flutterdemo/core/components/m_AppBar.dart';
import 'package:people_living_flutterdemo/core/extension/int_extension.dart';
import 'package:people_living_flutterdemo/ui/pages/firm/FirmHomeView/developer_detail_view.dart';
import 'package:people_living_flutterdemo/ui/widget/EasyRefreshHeader.dart';
import 'package:people_living_flutterdemo/ui/widget/ItemWidget.dart';
import '../../../../core/models/FirmCollectModel/firm_collect_entity.dart';
import '../../../../core/models/HomeModel/home_positionListModel.dart';
import '../../../../core/service/firm_collect_api/firm_collect_api.dart';
import '../../HomeView/home_positionDetailView.dart';
import '../../HomeView/home_positionRecommendCell.dart';

class firm_collect_View extends StatefulWidget {
  @override
  static const String routeName = '/homeview';

  State<firm_collect_View> createState() => _firm_collect_ViewState();
}

class _firm_collect_ViewState extends State<firm_collect_View>
    with TickerProviderStateMixin {
  late EasyRefreshController _controller;

  List<FirmCollectDataList> list = [];
  var pageNum = 1;

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
    getFavoriteDeveloperApi(pageNum);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: m_AppBar(context, '收藏', isHiddenLeading: true),
        // body: listRow()
        body: Container(
          padding: EdgeInsets.only(top:  16.px),
            alignment: Alignment.center,
            color: Colors.white,
            child: list.isNotEmpty
                ? listWidget()
                : Container(
                    margin: const EdgeInsets.only(top: 150),
                    color: Colors.white,
                    child: Column(
                      children: [
                        Image.asset('images/home/icon_home_noPosition.png',
                            fit: BoxFit.cover, width: 78, height: 52),
                        const SizedBox(height: 16),
                        const Text(
                          '当前暂无收藏职位',
                          style: TextStyle(
                              fontSize: 13, color: m_colors.content_02_color),
                        ),
                      ],
                    ),
                  )));
  }

  Widget listWidget(){
    return EasyRefresh(
      // 是否开启控制结束加载
      enableControlFinishLoad: true,
      enableControlFinishRefresh: true,
      // 控制器
      controller: _controller,
      onRefresh: () async {
        await Future.delayed(Duration(seconds: 0), () {
          // 结束加载
          pageNum = 1;
          getFavoriteDeveloperApi(pageNum);
          // _controller.finishRefresh();
        });
      },
      // 上拉加载事件回调
      onLoad: () async {
        await Future.delayed(Duration(seconds: 2), () {
          // 结束加载
          // _controller.finishLoad();
          pageNum++;
          getFavoriteDeveloperApi(pageNum);
        });
      },
      header: BKRefresh.addRefreshHeader(),
      // 自定义顶部上啦加载
      footer: BKRefresh.addLoadFooter(),
      // child: listRow(),
      child: ListView(
        children: list.map((item) => collectItemView(context, item)).toList(),
      ),
    );
  }

  getFavoriteDeveloperApi(int pageNum) {
    EasyLoading.show(status: "请求中...");
    FirmCollectService.getFavoriteDeveloperApi(pageNum, (object) {
      if (object.isSuccess) {
        EasyLoading.dismiss();
        setState(() {
          FirmCollectData newdata = object.data;
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

Widget collectItemView(BuildContext context, FirmCollectDataList data) {
  return GestureDetector(
    child: Container(
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(color: m_colors.divider_01_color, width: 1))),
      margin: EdgeInsets.only(left: 16.px, right: 16.px, bottom: 16.px),
      padding: EdgeInsets.only(bottom: 16.px),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            child: Image.network(
              data.avatarUrl ?? '',
              height: 56.px,
              width: 56.px,
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(Radius.circular(6.px)
            ),
          ),
          SizedBox(width: 16.px),
          Expanded(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        data.realName!,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.px,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(width: 8.px),
                      Container(
                        decoration: const BoxDecoration(
                            color: m_colors.color_EFFFF5,
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                        padding: const EdgeInsets.fromLTRB(5, 1, 5, 1),
                        child: Text(
                          getStatus(data),
                          style: TextStyle(color: getStatusColor(data)),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            color: m_colors.backColor,
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                        padding: const EdgeInsets.fromLTRB(5, 1, 5, 1),
                        child: Text(
                          data.workMode!,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(width: 4.px),
                      Text(
                        '${data.expectSalary! / 1000}k/月',
                        style: TextStyle(
                            color: m_colors.backColor,
                            fontSize: 15.px,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 6.px),
              Text(
                  '${data.careerDirectionName}-工作经验${data.workYears}-${data.education}'),
              SizedBox(height: 12.px),
              ProjectItemsView(titleList: data.addSkillNameList()),
            ],
          ))
        ],
      ),
    ),
    onTap: () {
      Navigator.of(context).pushNamed(developer_detail_view.routeName,
          arguments: data.developerId.toString());
    },
  );
}

getStatusColor(FirmCollectDataList item) {
  if (item.status == 2 || item.status == 3 || item.status == 4) {
    return m_colors.color_5CE28A;
  } else {
    return m_colors.color_FB8B39;
  }
}

//2 3 4 显示已签单  其他 显示待签单
String getStatus(FirmCollectDataList item) {
  if (item.status == 2 || item.status == 3 || item.status == 4) {
    return '已签单';
  } else {
    return '待签单';
  }
}
