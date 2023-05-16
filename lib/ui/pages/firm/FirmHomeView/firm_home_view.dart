import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';
import 'package:people_living_flutterdemo/core/components/m_AppBar.dart';
import 'package:people_living_flutterdemo/core/components/placeholderWidget.dart';
import 'package:people_living_flutterdemo/core/extension/int_extension.dart';
import 'package:people_living_flutterdemo/core/models/FirmHomeModel/career_direction_entity.dart';
import 'package:people_living_flutterdemo/core/models/FirmHomeModel/dev_info_item_entity.dart';
import 'package:people_living_flutterdemo/ui/pages/firm/FirmHomeView/firm_home_search_view.dart';
import 'package:people_living_flutterdemo/ui/pages/firm/FirmHomeView/widgets/DevItemView.dart';
import 'package:people_living_flutterdemo/ui/widget/EasyRefreshHeader.dart';
import 'package:people_living_flutterdemo/utils/utils.dart';
import '../../../../core/service/firm_home_api/firm_home_api.dart';

class firm_home_View extends StatefulWidget {
  @override
  static const String routeName = '/homeview';

  State<firm_home_View> createState() => _firm_home_ViewState();
}

class _firm_home_ViewState extends State<firm_home_View>
    with TickerProviderStateMixin {
  late EasyRefreshController _controller;

  // late TextEditingController _searchController;

  int _careerIds = 1;
  List<CareerDirectionData> _tabList = [];
  List<DevInfoItemDataList> _devList = [];
  int _pageNum = 1;

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
    getCareerDirection();
    getFirmDevApi(_careerIds, _pageNum);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: m_AppBar(context, '找工作', isHiddenLeading: true, elevation: 0),
        // body: listRow()
        body: EasyRefresh(
          // 是否开启控制结束加载
          enableControlFinishLoad: false,
          enableControlFinishRefresh: false,
          // 控制器
          controller: _controller,
          onRefresh: () async {
            await Future.delayed(Duration(seconds: 0), () {
              // 结束加载
              _pageNum = 1;
              getFirmDevApi(_careerIds, _pageNum);
              // _controller.finishRefresh();
            });
          },
          // 上拉加载事件回调
          onLoad: () async {
            await Future.delayed(Duration(seconds: 2), () {
              // 结束加载
              _pageNum++;
              getFirmDevApi(_careerIds, _pageNum);
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

  List<Widget> tagView(List titles) {
    List<Widget> childArray = [];
    for (var title in titles) {
      childArray.add(Container(
        //margin: EdgeInsets.fromLTRB(0, 0, 4, 0),
        width: 80.px,
        height: 30.px,
        alignment: Alignment.center,
        padding: EdgeInsets.only(left: 10.px, right: 10.px),
        // padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
        decoration: const BoxDecoration(
            //设置四周圆角 角度
            borderRadius: BorderRadius.all(Radius.circular(2.0)),
            //设置四周边框
            //border: Border.all(width: 1, color: m_colors.backColor),
            color: m_colors.back_01_color),
        child: Text(
          title,
          style: TextStyle(fontSize: 14.px, color: m_colors.content_01_color),
        ),
      ));
    }
    if (childArray.length > 4) {
      return childArray.sublist(0, 4);
    } else {
      return childArray;
    }
  }


  /// 搜索框
  Widget _topSearch(BuildContext context) {
    return SliverToBoxAdapter(
      child: GestureDetector(
        child: Container(
            alignment: Alignment.centerLeft,
            height: 46.px,
            padding: EdgeInsets.symmetric(horizontal: 16.px),
            margin: EdgeInsets.symmetric(horizontal: 16.px),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey, width: 0.5),
                borderRadius: BorderRadius.all(Radius.circular(30.px))),
            child: Text(
              '搜索职位技能',
              style: TextStyle(color: Colors.grey),
            )),
        onTap: () {
          Navigator.of(context).pushNamed(firm_home_search_View.routeName);
        },
      ),
    );
  }

  /// 分类滚动view
  Widget _topStickyBar() {
    return SliverPersistentHeader(
      pinned: true, //是否固定在顶部
      floating: true,
      delegate: _SliverAppBarDelegate(
          minHeight: 70.px, //收起的高度
          maxHeight: 70.px, //展开的最大高度
          child: Container(
            padding: EdgeInsets.only(left: 16.px),
            margin: EdgeInsets.only(bottom: 20.px),
            color: Colors.white,
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Expanded(
                  child: MenuTab(
                    menuList: _tabList,
                    onPress: (e) {
                      _careerIds = e.id;
                      getFirmDevApi(_careerIds, 1);
                    },
                  ) 
                ),
                Container(
                  width: 50.px,
                  alignment: Alignment.center,
                  child: Text("三", style: TextStyle(fontSize: 18.px)),
                )
              ],
            ),
          )),
    );
  }

  Widget _buildList(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
          (context, index) {
            return _devList.isEmpty ? 
            PlaceholderWidget() :
            DevItemView(data: _devList[index]);
      },
      childCount: _devList.isEmpty ? 1 : _devList.length,
    ));
  }

  ///
  void getCareerDirection() {
    FirmHomeService.getCareerDirectionApi((object) {
      if (object.isSuccess) {
        for (int i = 0; i < object.data.length; i++) {
          object.data[i].value = '${i + 1}';
          object.data[i].text = object.data[i].name!;
        }
        setState(() {
          _tabList.addAll(object.data);
          LogUtils.d(_tabList.toString());
        });
      } else {
        EasyLoading.showToast(object.message ?? '请求错误！');
      }
    });
  }

  void getFirmDevApi(int id, int pageNum) {
    FirmHomeService.getFirmDevApi(id, pageNum, (object) {

      if (pageNum == 1) {
         _controller.finishRefresh();
      }else {
        _controller.finishLoad();
      }

      if (object.isSuccess) {
        
          DevInfoItemData newdata = object.data;
          if (newdata.list != null) {
            // if (id != careerIds) {
            //   _devList.clear();
            // }
            if (pageNum == 1) {
              _devList.clear();
              setState(() {
                _devList.addAll(newdata.list!); 
              });
            } else {
              if (newdata.list!.isNotEmpty) {
                _devList.addAll(newdata.list!);
              }
            }
          }
      } else {
        EasyLoading.showToast(object.message ?? '请求错误！');
      }
    });
  }
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

class MenuTab extends StatefulWidget {
  final Function? onPress;
  final List<CareerDirectionData> menuList;

  const MenuTab({Key? key, required this.menuList, this.onPress})
      : super(key: key);

  @override
  State<MenuTab> createState() => _MenuTabState();
}

class _MenuTabState extends State<MenuTab> {
  final ScrollController _controller = ScrollController();
  late String currerValue = "1";
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
              padding: EdgeInsets.only(right: 10),
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
