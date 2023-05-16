import 'package:people_living_flutterdemo/core/service/NetWork/httpManager.dart';
import '../../models/index.dart';


class PositionService {
  //获取首页职位推荐列表
  static getPositionList(Function(ResultData object) onCompletion,number) async {
    await HttpManager.GET('/developerReveal/getDeveloper',params: {'PageNum':number}).then((value) {
      if (value.isSuccess) {
        value.data = Position_item_list.fromJson(value.data);
      }
      onCompletion(value);
    });
  }


//接单状态
  static getIsserviceStatus(
      String type, Function(ResultData object) onCompletion) async {
    await HttpManager.POST('/developer/updateServiceStatus', {'type': type})
        .then((value) {
      if (value.isSuccess) {}
      onCompletion(value);
    });
  }

  //获取职位详情
  static getPositionDetails(
      String developerId, Function(ResultData object) onCompletion) async {
    await HttpManager.GET('/developerReveal/getDeveloperDetail',
        params: {"developerId": developerId}).then((value) {
      if (value.isSuccess) {
        value.data = Home_position_detail_model.fromJson(value.data);
      }
      onCompletion(value);
    });
  }

//获取职位详情
  static getPositionDetail(
      String postitionID, Function(ResultData object) onCompletion) async {
    await HttpManager.GET('/developer_recommends/position_info',
        params: {"positionId": postitionID}).then((value) {
      if (value.isSuccess) {
        value.data = Home_position_detail_model.fromJson(value.data);
      }
      onCompletion(value);
    });
  }

  //立即自荐
  static postRecommended(
      String positionId, Function(ResultData object) onCompletion) async {
    await HttpManager.POST(
        '/developer_recommends/self_recommend/${positionId}', {}).then((value) {
      if (value.isSuccess) {}
      onCompletion(value);
    });
  }
}
