import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';
import 'package:people_living_flutterdemo/core/components/m_AppBar.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:people_living_flutterdemo/core/service/firm_position_api/firm_position_api.dart';
import 'package:people_living_flutterdemo/ui/pages/firm/FirmPositionView/firm_publish_position_view.dart';
import '../../../../core/models/FirmPositionModel/firm_position_entity.dart';
import '../../../../core/models/FirmPositionModel/firm_recommend_bean_entity.dart';
import '../../../widget/EasyRefreshHeader.dart';
import '../FirmMineView/FirmManageView.dart';

// 推荐列表
class recommend_position_view extends StatefulWidget {
  static const String routeName = '/firmhome/recommend_position';
  final FirmPositionDataList bean;

  recommend_position_view({required this.bean});

  @override
  State<recommend_position_view> createState() =>
      _recommend_position_viewState();
}

class _recommend_position_viewState extends State<recommend_position_view> {
  late EasyRefreshController _controller;
  int positionId = 0;

  //  0“为你推荐”，1"自荐",
  List<TabBean> tabList = [];
  List<FirmRecommendBeanDataList> mList = [];
  var pageNum = 1;
  var mType = '0'; //0 为你推荐  1自荐

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
    positionId = widget.bean.id!;
    getFirmRecommendsApi(positionId, pageNum);
    TabBean bean1 =
        TabBean('0', '为你推荐·${widget.bean.countRecommends}', positionId);
    TabBean bean2 =
        TabBean('1', '自荐·${widget.bean.countSelfRecommends}', positionId);
    tabList.add(bean1);
    tabList.add(bean2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: m_AppBar(context, '推荐'),
      body: content(context),
    );
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
                child: AuditionButton('关闭职位', true, double.infinity, () {
                  showAlertDialog(context, () {
                    closePosition(context, positionId, 0);
                  });
                })))
      ],
    );
  }

  Widget contentWidget(BuildContext context) {
    return EasyRefresh(
      // 是否开启控制结束加载
      enableControlFinishLoad: false,
      enableControlFinishRefresh: false,
      // 控制器
      controller: _controller,
      onRefresh: () async {
        await Future.delayed(Duration(seconds: 1), () {
          // 结束加载
          pageNum = 1;
          if (mType == '0') {
            getFirmRecommendsApi(positionId, pageNum);
          } else {
            getFirmSelfRecommendsApi(positionId, pageNum);
          }
        });
      },
      // 上拉加载事件回调
      onLoad: () async {
        await Future.delayed(Duration(seconds: 1), () {
          // 结束加载
          pageNum++;
          if (mType == '0') {
            getFirmRecommendsApi(positionId, pageNum);
          } else {
            getFirmSelfRecommendsApi(positionId, pageNum);
          }
        });
      },
      header: BKRefresh.addRefreshHeader(),
      // 自定义顶部上啦加载
      footer: BKRefresh.addLoadFooter(),
      child: CustomScrollView(
        slivers: <Widget>[
          _topView(context, widget.bean),
          _topStickyBar(),
          _buildList(context),
        ],
      ),
    );
  }

  Widget _topView(BuildContext context, FirmPositionDataList bean) {
    return SliverToBoxAdapter(
      child: GestureDetector(
        child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                    bottom: BorderSide(
                        color: m_colors.divider_01_color, width: 10))),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      bean.title ?? 'xxx',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Text(
                          '${bean.startPay! / 1000}k-${bean.endPay! / 1000}k',
                          style: const TextStyle(
                              color: m_colors.backColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        Image.asset(
                          "images/person/icon_person_meau_arrow.png",
                          width: 20,
                          height: 20,
                          fit: BoxFit.cover,
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  bean.companyName ?? '',
                  style: TextStyle(color: m_colors.dark_text, fontSize: 14),
                ),
                SizedBox(height: 8),
                Text(
                  '${bean.trainingMode}-${bean.education ?? '不限'}-${bean.careerDirection}',
                  style: TextStyle(color: m_colors.dark_text, fontSize: 14),
                ),
              ],
            )),
        onTap: () {
          Navigator.of(context).pushNamed(firm_publish_position_view.routeName,
              arguments: {"type": "2", "model": bean}).then((value) {});
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
                // getFirmOrderList(orderStatus, pageNum);
                mType = e.value;
                if (e.value == '0') {
                  getFirmRecommendsApi(positionId, pageNum);
                } else {
                  getFirmSelfRecommendsApi(positionId, pageNum);
                }
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

  ///获取推荐列表
  void getFirmRecommendsApi(int positionId, int pageNum) {
    EasyLoading.show(status: "请求中...");
    FirmPositionService.getFirmRecommendsApi(positionId, pageNum, (object) {
      if (object.isSuccess) {
        EasyLoading.dismiss();
        setState(() {
          FirmRecommendBeanData newdata = object.data;
          if (newdata.list != null && newdata.list!.length >= 0) {
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

  ///获取自荐列表
  void getFirmSelfRecommendsApi(int positionId, int pageNum) {
    EasyLoading.show(status: "请求中...");
    FirmPositionService.getFirmSelfRecommendsApi(positionId, pageNum, (object) {
      if (object.isSuccess) {
        EasyLoading.dismiss();
        setState(() {
          FirmRecommendBeanData newdata = object.data;
          if (newdata.list != null) {
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

  ///关闭职位   //0关1开
  void closePosition(BuildContext context, int positionId, int status) {
    EasyLoading.show(status: "请求中...");
    FirmPositionService.closePosition(positionId, pageNum, (object) {
      if (object.isSuccess) {
        EasyLoading.dismiss();
        Navigator.of(context).pop(recommend_position_view.routeName);
      } else {
        EasyLoading.showToast(object.message ?? '请求错误！');
      }
    });
  }
}

/// 列表item widget
Widget ItemView(FirmRecommendBeanDataList data, BuildContext context) {
  return GestureDetector(
    child: data.careerDirectionName!.isNotEmpty
        ? Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                    bottom: BorderSide(
                        color: m_colors.divider_01_color, width: 1))),
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      child: Image.network(
                        data.avatarUrl ??
                            'https://minio.stage-ttchain.tntlinking.com/develop-image/67d0852d-76ac-4671-85c8-4c1057e6bc6f.jpg',
                        height: 56,
                        width: 56,
                        fit: BoxFit.cover,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(6)),
                    ),
                    const SizedBox(width: 16),
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
                                  data.realName ?? 'xxx',
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            Text(
                              '${data.expectSalary! / 1000}k/月',
                              style: const TextStyle(
                                  color: m_colors.backColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Text(
                          '${data.careerDirectionName}·${data.educationName ?? '不限'}·工作经验${data.workYearsName}',
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(height: 6),
                      ],
                    ))
                  ],
                ),
              ],
            ))
        : Container(),
    onTap: () {},
  );
}

void showAlertDialog(BuildContext context, OnPressed) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '确定要关闭职位？',
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  ElevatedButton(
                    child: const Text('取消',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
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
                    child: const Text('确认',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
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

class TabBean {
  String? value;
  String? text;
  int positionId;

  TabBean(this.value, this.text, this.positionId);
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
