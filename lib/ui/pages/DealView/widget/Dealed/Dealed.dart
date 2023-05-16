import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:people_living_flutterdemo/core/components/placeholderWidget.dart';
import 'package:people_living_flutterdemo/core/extension/int_extension.dart';
import 'package:people_living_flutterdemo/ui/pages/DealView/https/DealService.dart';
import 'package:people_living_flutterdemo/ui/pages/DealView/model/DealModel.dart';
import 'package:people_living_flutterdemo/ui/pages/DealView/widget/Dealing/DealList.dart';
import 'package:people_living_flutterdemo/ui/widget/EasyRefreshHeader.dart';

class Dealed extends StatefulWidget {

  Dealed({Key? key, this.orderList, this.listBlock}): super(key: key);
  // 服务中的订单
  List<DealModel>? orderList;
  /// 回掉获取当前list 个数
  Function(List<DealModel>)? listBlock;

  @override
  State<Dealed> createState() => _DealedState();
}

class _DealedState extends State<Dealed> with AutomaticKeepAliveClientMixin {
  /// 避免重复刷新 从缓存中获取
  @override
  bool get wantKeepAlive => true;

  EasyRefreshController _controller = EasyRefreshController();
  List<DealModel> orderList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    orderList.addAll(widget.orderList ?? []);

  }

  onRefresh() {
    EasyLoading();
    DealService.requestDealList(2).then((value) {
      EasyLoading.dismiss();
      _controller.finishRefresh();
      setState(() {
        orderList = value;
        if (widget.listBlock !=null) {
          widget.listBlock!(orderList);
        }
      });
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
        await Future.delayed(const Duration(seconds: 0), () {
          // 结束加载
          onRefresh();
        });
      },
    );
  }

  Widget dealedCell(){
    return Padding(
      padding: EdgeInsets.all(16.px),
      child: Column(
        children: [
          DealList(list: orderList),
          PlaceholderWidget(title: '待服务状态无需填写日报', iconName: 'dealed_placeHolder', imgWidth: 128.px, imgHeight: 95.px,)
        ]
      )
    );
  }

  Widget content(){
    return orderList.isEmpty ?
     PlaceholderWidget(title: '暂无服务', iconName: 'order_placeholder', imgWidth: 128.px, imgHeight: 128.px,) : 
     dealedCell();
  }
}