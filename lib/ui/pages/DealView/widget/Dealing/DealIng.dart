import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';
import 'package:people_living_flutterdemo/core/components/placeholderWidget.dart';
import 'package:people_living_flutterdemo/core/extension/int_extension.dart';
import 'package:people_living_flutterdemo/core/extension/string_extension.dart';
import 'package:people_living_flutterdemo/ui/pages/DealView/HistoryDailyView.dart';
import 'package:people_living_flutterdemo/ui/pages/DealView/https/DealService.dart';
import 'package:people_living_flutterdemo/ui/pages/DealView/model/DealListModel.dart';
import 'package:people_living_flutterdemo/ui/pages/DealView/widget/Dealing/CreatUpdateDaily.dart';
import 'package:people_living_flutterdemo/ui/pages/DealView/widget/Dealing/DealList.dart';
import 'package:people_living_flutterdemo/ui/pages/DealView/widget/Dealing/WriteDailyReport.dart';
import 'package:people_living_flutterdemo/ui/widget/EasyRefreshHeader.dart';
import '../../model/DealModel.dart';


class DealIng extends StatefulWidget  {
  DealIng({Key? key, this.orderList, this.listBlock}): super(key: key);
  // 服务中的订单
  List<DealModel>? orderList;
  /// 回掉获取当前list 个数
  Function(List<DealModel>)? listBlock;

  @override
  State<DealIng> createState() => _DealIngState();
}

class _DealIngState extends State<DealIng> with AutomaticKeepAliveClientMixin {
  /// 避免重复刷新 从缓存中获取
  @override
  bool get wantKeepAlive => true;

  EasyRefreshController _controller = EasyRefreshController();
  
  /// 服务中
  List<DealModel> orderList = [];

  /// 当前订单
  DealModel? dealModel;

  // 日报数据模型
  DealListModel model = DealListModel();

  String dealText = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    /// 请求服务中接口
    orderList = widget.orderList ?? [];
    
    getOrderSchedule();
  }

  /// 获取订单 - 日报接口
  onRefresh(){
    EasyLoading();
    Future.wait([
      DealService.getAppList(3),
    ]).then((value) {
      EasyLoading.dismiss();
      _controller.finishRefresh();
      // 获取订单
      orderList = value[0].data;
      // 请求日报接口
      getOrderSchedule();
      if (widget.listBlock !=null) {
          widget.listBlock!(orderList);
      }
    }).catchError((error) {
      orderList.clear();
      EasyLoading.dismiss();
      EasyLoading.showError(error ?? '');
    });
  }

  /// 获取日报
  getOrderSchedule(){
    if (orderList.isEmpty) { return; }
    dealModel = orderList.first;
    DealService.getOrderScheduleList(dealModel!.id ?? 0).then((value) {
      _controller.finishRefresh();
      if (value.isSuccess) {
        setState(() {
          model = value.data;
        });
      }else {
        EasyLoading.showError(value.message ?? '');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
      enableControlFinishRefresh: true,
      header: BKRefresh.addRefreshHeader(),
      controller: _controller,
      child: content(),
      onRefresh: () async{  
        await Future.delayed(const Duration(seconds: 1), () {
          // 结束加载
          onRefresh();
        });
      },
    );
  }

  Widget content(){
    return orderList.isEmpty ?
     PlaceholderWidget(title: '暂无服务', iconName: 'order_placeholder', imgWidth: 128.px, imgHeight: 128.px,) : 
     dealingCell();
  }

  Widget dealingCell(){
    return Padding(
      padding: EdgeInsets.all(16.px),
      child: Column(
        children: [
          DealList(list: orderList),
          SizedBox(height: 8.px),
          daily(),
          Divider(),
          WriteDailyReport(model: model, onTap: (style, styleId, text, dealId){
            if (style == 2) {
              // 删除日报
              deleteDeal(dealId);
            }else {
              dealText = text ?? '';
              showWriteDaily(style, styleId ?? 0, dealId);
            }
          }),
        ]
      ),
    );
  }

  Widget daily(){
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.px),
      child: GestureDetector(
        child: Row(
          children: [
          Expanded(
            child: Text(
              '写日报${BKDateTime.today()}', 
              style: TextStyle(
                fontSize: 15.px, 
                fontWeight: FontWeight.w600, 
                color: m_colors.title_01_color
              )
            )
          ),
          Image.asset('daily'.png, width: 17.px, height: 17.px),
          SizedBox(width: 6.px),
          Text('历史日报', style: TextStyle(fontSize: 15.px, fontWeight: FontWeight.w400, color: m_colors.content_01_color))
          ]
        ),
        onTap: () { 
          if (dealModel != null) {
            Navigator.of(context).pushNamed(HistoryDailyView.routeName, arguments: dealModel!.id ?? 0);
          }
        },
      ),
    );
  }

  ///  弹框写日报
  showWriteDaily(int style, int styleId, int dealId){
    showModalBottomSheet(
      backgroundColor: Colors.transparent,//重点
      context: context,
      builder: (context) {
        return CreatUpdateDaily((value) {
          dealText = value;
          sureContent(style, styleId, dealId);
        },dealText: dealText, style: style);
      }
    );
  }

  sureContent(int style, int styleId, int dealId){
    if (dealText.isNotEmpty) {
      switch (style) {
        case 0:
        // 创建日报
        createWriteDeal(styleId);
        break;
        case 1:
        // 修改
        updateDeal(dealId, styleId);
          break;
      }
      Navigator.pop(context);
    }
  }

  /// 写日志
  createWriteDeal(int typeId){
    EasyLoading();
    int orderId = 0;
    if (dealModel != null) {
      orderId = dealModel!.id ?? 0;
    }
    
    DealService.postCreatDeal(orderId, typeId + 1, dealText, (object) {
      EasyLoading.dismiss();
      if (object.isSuccess) {
        getOrderSchedule();
      }else {
        EasyLoading.showError(object.message ?? '');
      }
    });
  }

  /// 更新日志
  updateDeal(int id, int typeId){
    EasyLoading();
    int orderId = 0;
    if (dealModel != null) {
      orderId = dealModel!.id ?? 0;
    }
    
    DealService.updateDeal(id, orderId, typeId + 1, dealText, (object) {
      EasyLoading.dismiss();
      if (object.isSuccess) {
        getOrderSchedule();
      }else {
        EasyLoading.showError(object.message ?? '');
      }
    });
  }

  // 删除日报
  deleteDeal(int dealId){
    EasyLoading();
    DealService.deleteDeal(dealId, (object) {
      EasyLoading.dismiss();
      if (object.isSuccess) {
        getOrderSchedule();
      }else {
        EasyLoading.showError(object.message ?? '');
      }
    });
  }
}