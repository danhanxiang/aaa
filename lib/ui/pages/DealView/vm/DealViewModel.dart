
import 'dart:ffi';

import 'package:people_living_flutterdemo/core/service/NetWork/error.dart';
import 'package:people_living_flutterdemo/ui/pages/DealView/model/DealModel.dart';
import '../https/DealService.dart';

class DealViewModel {
  bool isHasData = false;
  /// 服务中
  String homeOrder = "服务中";
  List<DealModel> homeOrderlist = [];

  /// 待服务
  String waitingOrder = "待服务";
  List<DealModel> waitingOrderList = [];

  /// 待结算
  String unsettledOrder = "待结算";
  List<DealModel> unsettledOrderlist = [];
  

// 假如请求多个接口，都返回后再一起处理，这里我就不再实现其他，其他和这获取订单详情一样
  httpGetData(Function(bool) comp ,Function(String) errorBlock){
    // 判断
    Future.wait([
      DealService.requestDealList(3),
      DealService.requestDealList(2), 
      DealService.requestDealList(4)]
    ).then((value) {
      homeOrderlist = value[0];
      waitingOrderList = value[1];
      unsettledOrderlist = value[2];
      addStyleList(comp);
    }).catchError((error) {
      error(error);
    });
  }

  // 获取当前服务中 待服务 待结算个数
  addStyleList(Function(bool) comp){
    bool hasList = false;
      if (homeOrderlist.length > 0) {
        homeOrder = '服务中(${homeOrderlist.length})';
        hasList = true;
      }
      if (waitingOrderList.length > 0) {
        waitingOrder = '待服务(${waitingOrderList.length})';
         hasList = true;
      }

      if (unsettledOrderlist.length > 0) {      
        unsettledOrder = "待结算(${unsettledOrderlist.length})";
         hasList = true;
      }
      comp(hasList);
  }
}