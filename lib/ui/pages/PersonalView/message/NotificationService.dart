import 'package:people_living_flutterdemo/core/service/NetWork/httpManager.dart';
import 'NotificationManager.dart';

class NotificationService {
  /// 开发者端小心列表
  static getMessageList(
    int page,
    int pageSize,
    Function(ResultData object) onCompletion) async {
    await HttpManager.GET('/jpush/getMessageList', 
    params: {
      'pageNum': page,
      'pageSize': pageSize,
    }).then((value) {
      if (value.isSuccess) {
        NotificationManager model =  NotificationManager.fromJson(value.data);
        value.data = model;
      }
      onCompletion(value);
    });
  }

  /// 企业端小心列表
  static getCompanyMessageList(
    int page,
    int pageSize,
    Function(ResultData object) onCompletion) async {
    await HttpManager.GET('/JPushCompanyRecruiter/getMessageList', 
    params: {
      'pageNum': page,
      'pageSize': pageSize,
    }).then((value) {
      if (value.isSuccess) {
        CompNotificationManager model =  CompNotificationManager.fromJson(value.data);
        value.data = model;
      }
      onCompletion(value);
    });
  }

}