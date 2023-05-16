import 'package:people_living_flutterdemo/core/service/NetWork/httpManager.dart';
import '../../models/index.dart';

class HomeService {
  //获取首页职位推荐列表
  static getPositionList(Function(ResultData object) onCompletion) async {
    await HttpManager.GET('/developer_recommends/position').then((value) {
      if (value.isSuccess) {
        List newdata = [];
        for (Map<String, dynamic> item in value.data) {
          newdata.add(Home_positionListModel.fromJson(item));
        }

        value.data = newdata;
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
