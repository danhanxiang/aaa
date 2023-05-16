import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';
import 'package:people_living_flutterdemo/core/components/m_AppBar.dart';
import 'package:people_living_flutterdemo/core/components/m_mainButton.dart';
import 'package:people_living_flutterdemo/core/service/firm_mine_api/firm_mine_api.dart';
import '../../../../core/models/FirmHomeModel/career_direction_entity.dart';
import '../../../../core/models/FirmHomeModel/dev_info_item_entity.dart';
import '../../../../core/models/FirmMineModel/treaty_order_list_entity.dart';
import '../../../../core/service/firm_home_api/firm_home_api.dart';
import '../../../../utils/utils.dart';
import '../../../widget/EasyRefreshHeader.dart';
import 'TreatyOrderSearchView.dart';

class TreatyOrderView extends StatefulWidget {
  @override
  static const String routeName = '/homeview';

  State<TreatyOrderView> createState() => _TreatyOrderViewState();
}

class _TreatyOrderViewState extends State<TreatyOrderView>
    with TickerProviderStateMixin {
  late EasyRefreshController _controller;
  String orderStatus = '0';

  // late TextEditingController _searchController;

  late int careerIds = 1;

  //  0“全部”，1"待支付", 2"待服务", 3"服务中", 4"待结算",5"已完成"，6"已取消"
  List<TabBean> tabList = [
    TabBean('0', '全部'),
    TabBean('1', '待支付'),
    TabBean('2', '待服务'),
    TabBean('3', '服务中'),
    TabBean('4', '待结算'),
    TabBean('5', '已完成'),
    TabBean('6', '已取消'),
  ];
  List<TreatyOrderListDataList> mList = [];
  var pageNum = 1;

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
    getFirmOrderList(orderStatus, 1);
    // getFirmDevApi(careerIds, pageNum);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: m_AppBar(context, '合约单'),
        body: EasyRefresh(
          // 是否开启控制结束加载
          enableControlFinishLoad: false,
          enableControlFinishRefresh: false,
          // 控制器
          controller: _controller,
          onRefresh: () async {
            await Future.delayed(Duration(seconds: 1), () {
              // 结束加载
              pageNum = 1;
              getFirmOrderList(orderStatus, pageNum);
              // _controller.finishRefresh();
            });
          },
          // 上拉加载事件回调
          onLoad: () async {
            await Future.delayed(Duration(seconds: 1), () {
              // 结束加载
              pageNum++;
              getFirmOrderList(orderStatus, pageNum);
            });
          },
          header: BKRefresh.addRefreshHeader(),
          // 自定义顶部上啦加载
          footer: BKRefresh.addLoadFooter(),
          child: CustomScrollView(
            slivers: <Widget>[
              _topSearch(context),
              _topStickyBar(),
              _buildList(context),
            ],
          ),
        ));
    //     CustomScrollView(
    //   slivers: <Widget>[
    //     _buildBanner(),
    //     _buildStickyBar(),
    //     _buildList(),
    //
    //   ],
    // ));
  }

  Widget _topSearch(BuildContext context) {
    return SliverToBoxAdapter(
      child: GestureDetector(
        child: Container(
          color: Colors.white,
          child: Container(
              alignment: Alignment.centerLeft,
              height: 46,
              padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
              margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey, width: 0.5),
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: const Text(
                '搜索开发者/订单号',
                style: TextStyle(color: Colors.grey),
              )),
        ),
        onTap: () {
          Navigator.of(context).pushNamed(TreatyOrderSearchView.routeName);
        },
      ),
    );
  }

  Widget _topStickyBar() {
    return SliverPersistentHeader(
      pinned: true, //是否固定在顶部
      floating: true,
      delegate: _SliverAppBarDelegate(
          minHeight: 60, //收起的高度
          maxHeight: 60, //展开的最大高度
          child: Container(
            padding: const EdgeInsets.only(left: 16),
            color: Colors.white,
            alignment: Alignment.centerLeft,
            child: MenuTab(
              menuList: tabList,
              onPress: (e) {
                LogUtils.d('---------${e.value}');
                orderStatus = e.value;
                getFirmOrderList(orderStatus, pageNum);
              },
            ),
          )),
    );
  }

  Widget _buildList(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
      (context, index) {
        return ItemView(mList[index], context);
      },
      childCount: mList.length,
    ));
  }

  ///
  void getFirmOrderList(String orderStatus, int pageNum) {
    FirmMineService.getFirmOrderListApi(orderStatus, pageNum, (object) {
      if (object.isSuccess) {
        setState(() {
          TreatyOrderListData newdata = object.data;
          if (newdata.list!=null&&newdata.list!.length>=0) {
            if (pageNum == 1) {
              mList.clear();
              mList.addAll(newdata.list!);
              _controller.finishRefresh();
            } else {
              if (newdata.list != null) {
                mList.addAll(newdata.list!);
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
Widget ItemView(TreatyOrderListDataList data, BuildContext context) {
  return GestureDetector(
    child: data.orderNo!.isNotEmpty
        ? Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                    bottom: BorderSide(
                        color: m_colors.divider_01_color, width: 10))),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '订单号:${data.orderNo}',
                      style: const TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    Text(
                      '${data.orderStatusName}',
                      style: TextStyle(
                          color: data.orderStatus == 3
                              ? m_colors.color_F5313D
                              : data.orderStatus == 4
                                  ? m_colors.color_5CE28A
                                  : data.orderStatus == 5
                                      ? m_colors.color_FB8B39
                                      : m_colors.color_B5BED3,
                          fontSize: 14),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '开始时间',
                      style: const TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    Text(
                      '${data.workStartDate}',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '开发者',
                      style: const TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    Text(
                      '${data.realName}(${data.workDaysModeName})',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '职业',
                      style: const TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    Text(
                      '${data.careerDirectionName}',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                data.orderStatus == 1
                    ? Container(
                        alignment: Alignment.centerRight,
                        child: m_Button(
                          text: '立即支付',
                        ),
                      )
                    : Container()
              ],
            ))
        : Container(),
    onTap: () {},
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

// }

class TabBean {
  String? value;
  String? text;

  TabBean(this.value, this.text);
}

class MenuTab extends StatefulWidget {
  final Function? onPress;
  final List<TabBean> menuList;

  const MenuTab({Key? key, required this.menuList, this.onPress})
      : super(key: key);

  @override
  State<MenuTab> createState() => _MenuTabState();
}

class _MenuTabState extends State<MenuTab> {
  final ScrollController _controller = ScrollController();
  late String currerValue = "0";
  final GlobalKey menuTabListKey = GlobalKey();

  List<Widget> generateMenuTabList() {
    List<Widget> menuTabList = [];
    LogUtils.d('--menuTabListKey------${menuTabList.toString()}');
    for (var i = 0; i < widget.menuList.length; i++) {
      menuTabList.add(
        InkResponse(
          splashColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          child: Container(
              // width: 100,
              padding: EdgeInsets.only(right: 16),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(widget.menuList[i].text!,
                      style: TextStyle(
                          fontWeight:
                              currerValue == widget.menuList[i].value as String
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                          fontSize:
                              currerValue == widget.menuList[i].value as String
                                  ? 18
                                  : 16,
                          color:
                              currerValue == widget.menuList[i].value as String
                                  ? const Color(0xFF000000)
                                  : const Color(0xFF999999))),
                  SizedBox(
                    height: 4,
                  ),
                  SizedBox(
                      width: 30,
                      height: 2,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: currerValue ==
                                    widget.menuList[i].value as String
                                ? const Color(0xFF4850ff)
                                : Colors.transparent),
                      ))
                ],
              )),
          onTap: () {
            chosenTab(widget.menuList[i], i);
            if (widget.onPress != null) {
              widget.onPress!(widget.menuList[i]);
            }
          },
        ),
      );
    }
    return menuTabList;
  }

  void chosenTab(item, int index) {
    double containerWidth = menuTabListKey.currentContext!.size!.width;

    if (containerWidth / 2 < ((index + 1) * 100 - 50)) {
      _controller.animateTo((index + 1) * 100 - containerWidth / 2,
          duration: const Duration(seconds: 1), curve: Curves.ease);
    } else {
      _controller.animateTo(0,
          duration: const Duration(seconds: 1), curve: Curves.ease);
    }
    setState(() {
      currerValue = item.value as String;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      key: menuTabListKey,
      scrollDirection: Axis.horizontal,
      controller: _controller,
      children: generateMenuTabList(),
    );
  }
}
