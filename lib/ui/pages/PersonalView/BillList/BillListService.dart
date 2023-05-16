
import 'package:people_living_flutterdemo/core/service/NetWork/httpManager.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/BillList/BillDetailManager.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/BillList/BillList.dart';

class BillListService {

  // static getBillList(Function(BillManagerModel object) onCompletion) {
  //   HttpManager.GET('/developerBill/list').then((value) {
  //     if (value.isSuccess) {
  //       final model =  BillManagerModel.fromJson(value.params);
  //       value.data = model;
  //     }
  //     onCompletion(value);
  //   });
  // }

  static Future<List<Bill>> requestBillList() async {
    final result = await HttpManager.request('/developerBill/list');
    final model =  BillManagerModel.fromJson(result);
    return model.data!.list!;
  }

  /// 账单明细
  static Future<BillDetailModel?> requestBillDetail(int billId) async {
    final result = await HttpManager.request('/developerBill/detail', params: {
      'developerBillId':billId
    });
    final model =  BillDetailManager.fromJson(result);
    return model.data;
  }
}