import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_pickers/pickers.dart';
import 'package:flutter_pickers/time_picker/model/date_mode.dart';
import 'package:flutter_pickers/time_picker/model/pduration.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';
import 'package:people_living_flutterdemo/core/components/m_AppBar.dart';
import 'package:people_living_flutterdemo/core/models/FirmMineModel/account_wallet_entity.dart';
import 'package:people_living_flutterdemo/ui/shared/app_size_fit.dart';
import 'package:people_living_flutterdemo/ui/widget/EasyRefreshHeader.dart';
import '../../../../core/models/FirmMineModel/account_wallet_list_entity.dart';
import '../../../../core/service/firm_mine_api/firm_mine_api.dart';
import '../../../../utils/CommonUtils.dart';

class AccountManageView extends StatefulWidget {
  AccountManageView({Key? key}) : super(key: key);

  static const String routeName = '/firm/accountmanage';

  @override
  State<AccountManageView> createState() => _AccountManageViewState();
}

class _AccountManageViewState extends State<AccountManageView> {
  late EasyRefreshController _controller;
  List<AccountWalletListDataList> list = [];
  var pageNum = 1;
  AccountWalletData? _accountWalletData;
  PDuration? addAgeText;
  String _inTime='';
  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
    // getPositionApi(pageNum);
    getFirmWalletCurrent();
    getFirmFreezeRecordList('',pageNum);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: m_AppBar(context, '账户管理'),
      body: contentWidget(),
      backgroundColor: Colors.white,
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
          await Future.delayed(const Duration(seconds: 1), () {
            // 结束加载
            // getUserInfo();
            // getPositionApi(1);
            pageNum=1;
            getFirmFreezeRecordList(_inTime,1);
          });
        },
        onLoad: () async {
          await Future.delayed(const Duration(seconds: 1), () {
            // 结束加载
            // getUserInfo();
            pageNum++;
            // getPositionApi(pageNum);
            getFirmFreezeRecordList(_inTime,pageNum);
          });

        });
  }

  /// 获取可用余额和冻结余额
  void getFirmWalletCurrent() {
    FirmMineService.getFirmWalletCurrent( (object) {
      if (object.isSuccess) {
        setState(() {
          _accountWalletData= object.data;

        });
      } else {
        EasyLoading.showToast(object.message ?? '请求错误！');
      }
    });
  }
  /// 获取冻结记录列表
  void getFirmFreezeRecordList(String date,int pageNum) {
    FirmMineService.getFirmFreezeRecordApi(date,pageNum, (object) {
      if (object.isSuccess) {
        setState(() {
          AccountWalletListData newdata = object.data;
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(16),
            width: BKSizeFit.screenWidth,
            decoration: BoxDecoration(
              color: m_colors.backColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${_accountWalletData?.availableMoney}',
                      style:const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 2),
                    Text(
                      "可用余额",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                  width: 1,
                  child: Container(
                    color: Colors.white,
                  ),
                ),
                GestureDetector(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "¥${_accountWalletData?.freezeMoney}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 2),
                      Text(
                        "已冻结余额",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                  onTap: () {
                    // Navigator.of(context).pushNamed(BillListWidget.routeName);
                  },
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(16, 10, 16, 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              const  Text(
                  '冻结记录',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                GestureDetector(
                  child:   Image.asset(
                    'assets/images/icon_date_select.png',
                    width: 30,
                    height: 30,
                  ) ,
                  onTap: (){
                    Pickers.showDatePicker(context,
                        mode: DateMode.YM,
                        onConfirm: (p){
                          EasyLoading.showToast(p.toString());
                          _inTime = '${p.year}-${CommonUtils.formatDate(p.month!)}';
                          getFirmFreezeRecordList(_inTime,pageNum);
                        },
                        // pickerStyle: ClosePickerStyle(
                        //     haveRadius: true,
                        //     title: "请选择出生日期"), onChanged: (p) {
                        //   setState(() {
                        //     addAgeText = p;
                        //
                        //
                        //   });
                        // }
                    );
                    
                  },
                )
             
              ],
            ),
          )
        ],
      ),
    );
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
        return ItemView(context, list[index]);
      },
      childCount: list.length,
    ));
  }
}

/// 列表item widget
Widget ItemView(BuildContext context, AccountWalletListDataList data) {
  return Container(
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(color: m_colors.divider_01_color, width: 10))
      ),
      padding:const EdgeInsets.fromLTRB(16, 20, 16, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
               '¥ ${data.money}',
                style:const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '${data.createDate??''}/k',
                style:const TextStyle(
                    color: Colors.black,
                    fontSize: 14),
              ),
            ],
          ),
         const  SizedBox(height: 8),
          Text(
            data.orderNo??'',
            style:const TextStyle(
                color: Colors.black,
                fontSize: 14),
          ),
        ],
      ));
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
