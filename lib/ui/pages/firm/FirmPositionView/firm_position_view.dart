import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';
import 'package:people_living_flutterdemo/core/components/m_mainButton.dart';
import 'package:people_living_flutterdemo/ui/pages/firm/FirmPositionView/firm_info_view.dart';
import 'package:people_living_flutterdemo/ui/pages/firm/FirmPositionView/firm_publish_position_view.dart';
import 'package:people_living_flutterdemo/ui/pages/firm/FirmPositionView/recommend_position_view.dart';
import 'package:people_living_flutterdemo/ui/shared/app_size_fit.dart';
import 'package:people_living_flutterdemo/ui/widget/EasyRefreshHeader.dart';
import 'package:people_living_flutterdemo/utils/utils.dart';
import '../../../../core/models/FirmCollectModel/firm_collect_entity.dart';
import '../../../../core/models/FirmPositionModel/firm_position_entity.dart';
import '../../../../core/service/firm_collect_api/firm_collect_api.dart';
import '../../../../core/service/firm_position_api/firm_position_api.dart';

class firm_position_View extends StatefulWidget {
  firm_position_View({Key? key}) : super(key: key);
  static const String routeName = '/firmmine';

  @override
  State<firm_position_View> createState() => _firm_position_ViewState();
}

class _firm_position_ViewState extends State<firm_position_View> {
  late EasyRefreshController _controller;
  List<FirmPositionDataList> list = [];
  var pageNum = 1;

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
    // getFavoriteDeveloperApi(pageNum);
    getPositionApi(pageNum);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: easyRefresh(context),
      backgroundColor: Colors.white,
    );
  }

  Widget easyRefresh(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "images/person/icon_person_meau_back.png",
          width: BKSizeFit.screenWidth,
          height: 300,
          fit: BoxFit.cover,
        ),
        contentWidget()
      ],
    );
  }

  //我的页面 内容组件
  Widget contentWidget() {
    return EasyRefresh(
        enableControlFinishRefresh: true,
        enableControlFinishLoad: true,
        header: BKRefresh.addRefreshHeader(),
        footer: BKRefresh.addLoadFooter(),
        controller: _controller,
        child: CustomScrollView(
          slivers: <Widget>[
            _topView(context),
            // _topStickyBar(),
            list.isNotEmpty ? _buildList(context) : _contentEmpty()
            // _buildList(context),
          ],
        ),
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 0), () {
            // 结束加载
            // getUserInfo();
            pageNum = 1;
            getPositionApi(1);
          });
        },
        onLoad: () async {
          await Future.delayed(const Duration(seconds: 0), () {
            // 结束加载
            // getUserInfo();
            pageNum++;
            getPositionApi(pageNum);
          });
        });
  }

  void getPositionApi(int pageNum) {
    EasyLoading.show(status: "请求中...");
    FirmPositionService.getFirmPositionApi(1, pageNum, (object) {
      if (object.isSuccess) {
        EasyLoading.dismiss();
        setState(() {
          FirmPositionData newdata = object.data;
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

  /// 顶部widget显示
  Widget _topView(BuildContext context) {
    return SliverToBoxAdapter(
        child: Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          const Text(
            '发布职位',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            '您想要的职位，都满足你',
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
          const SizedBox(height: 30),
          MainButton(
            text: "发布职位",
            OnPressed: () {
              // Navigator.of(context).pushNamed(
              //     firm_publish_position_view.routeName);
              Navigator.of(context).pushNamed(firm_publish_position_view.routeName,
                  arguments: {"type": "1"}).then((value) {
              });
            },
            width: 0,
          ),
          const SizedBox(height: 20),
          const Text(
            '职位',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
        ],
      ),
    ));
  }

  Widget _topStickyBar() {
    return SliverPersistentHeader(
      pinned: true, //是否固定在顶部
      floating: true,
      delegate: _SliverAppBarDelegate(
          minHeight: 70, //收起的高度
          maxHeight: 70, //展开的最大高度
          child: Container(
            padding: const EdgeInsets.only(left: 16),
            margin: EdgeInsets.only(bottom: 20),
            color: Colors.white,
            alignment: Alignment.center,
            child: const Text(
              '职位',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          )),
    );
  }

  /// 没有数据的时候提示页面显示
  Widget _contentEmpty() {
    return SliverPersistentHeader(
      pinned: true, //是否固定在顶部
      floating: true,
      delegate: _SliverAppBarDelegate(
          minHeight: 200, //收起的高度
          maxHeight: 200, //展开的最大高度
          child: Container(
            margin: const EdgeInsets.only(top: 50),
            color: Colors.white,
            alignment: Alignment.center,
            child: Column(
              children: [
                Image.asset('images/home/icon_home_noPosition.png',
                    fit: BoxFit.cover, width: 78, height: 52),
                const SizedBox(height: 16),
                const Text(
                  '当前暂无收藏职位',
                  style:
                      TextStyle(fontSize: 13, color: m_colors.content_02_color),
                ),
              ],
            ),
          )),
    );
  }

  /// 列表显示
  Widget _buildList(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
      (context, index) {
        return collectItemView(context, list[index]);
      },
      childCount: list.length,
    ));
  }
}

/// 列表item widget
Widget collectItemView(BuildContext context, FirmPositionDataList data) {
  return GestureDetector(
    child: Container(
        decoration: const BoxDecoration(
            border: Border(
                bottom:
                    BorderSide(color: m_colors.divider_01_color, width: 10))),
        padding: EdgeInsets.all(16),
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
                      data.title!,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 8),
                    data.auditStatus == 2 //0 是审核中,1 是通过， 2 是未通过
                        ? Container(
                            decoration: const BoxDecoration(
                                color: m_colors.color_FFEFEF,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4))),
                            padding: const EdgeInsets.fromLTRB(5, 1, 5, 1),
                            child: Text(
                              '未通过',
                              style: TextStyle(color: Colors.red),
                            ),
                          )
                        : Container(),
                  ],
                ),
                Text(
                  '${data.startPay! / 1000}/k-${data.endPay! / 1000}/k',
                  style: TextStyle(
                      color: m_colors.backColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${data.companyName}',
                      style: TextStyle(color: m_colors.dark_text, fontSize: 14),
                    ),
                    SizedBox(height: 3),
                    Text(
                      '${data.trainingMode}-${data.education ?? '不限'}-工作经验${data.workYears}-${data.careerDirection}',
                      style: TextStyle(color: m_colors.dark_text, fontSize: 14),
                    ),
                  ],
                ),
                data.auditStatus == 2
                    ? m_Button(text: '查看原因', )
                    : Container()
              ],
            ),
            SizedBox(height: 3),
            data.auditStatus == 2
                ? Container()
                : Text(
                    '已有${data.countRecommends}推荐，${data.countSelfRecommends}人自荐',
                    style:
                        TextStyle(color: m_colors.color_FB8B39, fontSize: 14),
                  ),
          ],
        )),
    onTap: () {
      Navigator.of(context).pushNamed(
          data.auditStatus == 2
              ? firm_info_view.routeName
              : recommend_position_view.routeName,
          arguments: data);
    },
  );
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
