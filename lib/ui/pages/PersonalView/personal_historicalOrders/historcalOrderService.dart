import 'package:people_living_flutterdemo/ui/pages/PersonalView/personal_historicalOrders/historcalOrderModel.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/personal_historicalOrders/historcalOrder_model_list.dart';
import 'package:people_living_flutterdemo/core/service/NetWork/httpManager.dart';

class HistorcalOrderService {
  static GetHistoryList(Function(ResultData object) onCompletion) {
    HttpManager.GET('/order/appHistoryList',params: {
      "orderDate": '2020-02-28',
    }).then((value) {
      if (value.isSuccess) {
        final model =  HistorcalOrder_model_list.fromJson(value.params);
        value.data = model;
      }
      onCompletion(value);
    });
  }

  static Future<List<HistorcalOrderModel>> requestHistoryList() async {
    final result = await HttpManager.request('/order/appHistoryList',params: {
      "orderDate": '2020-02-28',
    });
    final model =  HistorcalOrder_model_list.fromJson(result);
    return model.data ?? [];
  }
}