import 'package:people_living_flutterdemo/core/service/NetWork/httpManager.dart';
import 'package:people_living_flutterdemo/ui/pages/DealView/model/DealListModel.dart';
import '../model/DealModel.dart';

class DealService {
  /// 获取服务中的订单
  static Future<ResultData> getAppList(int orderStatus) async {
    final result = await HttpManager.GET('/order/appList', 
    params: {
      'orderStatus': orderStatus
    });

    if (result.isSuccess) {
        List<DealModel> list = [];
        for (var json in result.data) {
          list.add(DealModel.fromJson(json));
        }
        result.data = list;
      }
    return result;
  }
  
  /// 获取服务中的订单
  static Future<List<DealModel>> requestDealList(int orderStatus) async {
    final result = await HttpManager.GET('/order/appList', 
    params: {
      'orderStatus': orderStatus
    });
    List<DealModel> list = [];
    if (result.isSuccess) {
      for (var json in result.data) {
        list.add(DealModel.fromJson(json));
      } 
    }
    return list;
  }

  /** 获取所有日报类型数据
   *  orderId: 当前订单id
  */
  static Future<ResultData> getOrderScheduleList(int orderId) async {
    final result = await HttpManager.GET('/orderSchedule/list', 
    params: {
      'orderId': orderId,
    });

    if (result.isSuccess) {
      DealListModel model = DealListModel.fromJson(result.data);
      result.data = model;
    }
    return result;
  }


  /// 获取历史日报
  static getHistoryDailyList(int orderId, int pageNum, int pageSize, Function(ResultData object) onCompletion) async {
    await HttpManager.GET('/orderSchedule/historyList', 
    params: {
      'orderId': orderId,
      'pageNum': pageNum,
      'pageSize': pageSize
    }).then((value) {
      if (value.isSuccess) {
        List<DealListModel> list = [];
        for (var daily in value.data) {
          DealListModel model = DealListModel.fromJson(daily);
          list.add(model);
        }
        value.data = list;
      }
      onCompletion(value);
    });
  }


   /** 提交日报
   * orderId: 订单id
   * typeId: 日报类型
   * item: 提交写的日报字符串
  */
  static postCreatDeal(int orderId, int typeId, String item, Function(ResultData object) onCompletion) async {
    await HttpManager.POST('/orderSchedule/create', 
    {
      'createDate': '',
      'dateOf':'',
      'item': item,
      'orderId': orderId,
      'typeId': typeId,
    }).then((value) {
      onCompletion(value);
    });
  }

  /** 更新当前订单下 日志
   * orderId: 订单id
   * typeId: 日报类型
   * id: 当前更新的日志id
   * item: 提交写的日报字符串
  */
  static updateDeal(int id, int orderId, int typeId, String item, Function(ResultData object) onCompletion) async {
    await HttpManager.POST('/orderSchedule/update', 
    {
      'id': id, 
      'typeId': typeId, 
      'item': item,  
      'orderId': orderId,
    }).then((value) {
      onCompletion(value);
    });
  }

  /** 删除日报
   *  orderScheduleId: 当前删除日报id
  */
  static deleteDeal(int orderScheduleId, Function(ResultData object) onCompletion) async {
    await HttpManager.POST_QUERY('/orderSchedule/delete',params:
    {
      'orderScheduleId': orderScheduleId, 
    }).then((value) {
      onCompletion(value);
    });
  }
}