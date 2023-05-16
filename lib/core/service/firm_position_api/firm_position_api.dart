import 'package:people_living_flutterdemo/core/models/FirmHomeModel/career_direction_entity.dart';
import 'package:people_living_flutterdemo/core/models/FirmHomeModel/dev_info_item_entity.dart';
import 'package:people_living_flutterdemo/core/models/FirmPositionModel/firm_position_entity.dart';
import 'package:people_living_flutterdemo/core/service/NetWork/httpManager.dart';

import '../../models/FirmPositionModel/firm_info_id_bean_entity.dart';
import '../../models/FirmPositionModel/firm_recommend_bean_entity.dart';

class FirmPositionService {
  ///获取首页职位推荐列表
  static getCareerDirectionApi(Function(ResultData object) onCompletion) async {
    await HttpManager.GET('/developerReveal/getCareerDirection').then((value) {
      if (value.isSuccess) {
        List<CareerDirectionData> newdata = [];
        for (Map<String, dynamic> item in value.data) {
          newdata.add(CareerDirectionData.fromJson(item));
        }

        value.data = newdata;
      }
      onCompletion(value);
    });
  }

  ///获取发布职位列表
  static getFirmPositionApi(
      status, pageNum, Function(ResultData object) onCompletion) async {
    await HttpManager.GET('/position/app/page',
        params: {"status": status, "pageNum": pageNum}).then((value) {
      if (value.isSuccess) {
        FirmPositionData newdata = FirmPositionData.fromJson(value.data);

        value.data = newdata;
      }
      onCompletion(value);
    });
  }

  ///搜索相关开发者
  static searchDeveloperApi(
      search, pageNum, Function(ResultData object) onCompletion) async {
    await HttpManager.GET('/developerReveal/searchDeveloper',
        params: {'search': search, "pageNum": pageNum}).then((value) {
      if (value.isSuccess) {
        DevInfoItemData newdata = DevInfoItemData.fromJson(value.data);

        value.data = newdata;
      }
      onCompletion(value);
    });
  }

  ///获取推荐列表
  static getFirmRecommendsApi(
      positionId, pageNum, Function(ResultData object) onCompletion) async {
    await HttpManager.GET('/position/app/recommends',
        params: {'positionId': positionId, "pageNum": pageNum}).then((value) {
      if (value.isSuccess) {
        FirmRecommendBeanData newdata =
            FirmRecommendBeanData.fromJson(value.data);

        value.data = newdata;
      }
      onCompletion(value);
    });
  }

  ///获取自荐列表
  static getFirmSelfRecommendsApi(
      positionId, pageNum, Function(ResultData object) onCompletion) async {
    await HttpManager.GET('/position/app/self_recommends',
        params: {'positionId': positionId, "pageNum": pageNum}).then((value) {
      if (value.isSuccess) {
        FirmRecommendBeanData newdata =
            FirmRecommendBeanData.fromJson(value.data);

        value.data = newdata;
      }
      onCompletion(value);
    });
  }

  ///获取职位相关id
  static getPositionOriginalApi(
      positionId, Function(ResultData object) onCompletion) async {
    await HttpManager.GET('/position/original',
        params: {'positionId': positionId}).then((value) {
      if (value.isSuccess) {
        FirmInfoIdBeanData newdata = FirmInfoIdBeanData.fromJson(value.data);

        value.data = newdata;
      }
      onCompletion(value);
    });
  }

  ///关闭职位 status 0关1开
  static closePosition(
      positionId, status, Function(ResultData object) onCompletion) async {
    await HttpManager.PUT_OTHER('/position/status',
        params: {'positionId': positionId, 'status': status}).then((value) {
      if (value.isSuccess) {
        // FirmInfoIdBeanData newdata = FirmInfoIdBeanData.fromJson(value.data);
        // value.data = newdata;
      }
      onCompletion(value);
    });
  }

  ///发布职位
  static SendPositionApi(
      String careerDirectionId,
      String title,
      String description,
      String recruitCount,
      String workOperId,
      String workYearsId,
      String educationId,
      String trainingModeId,
      String workDaysMode,
      String startPay,
      String endPay,
      String industryMandatory,
      List skillIds,
      Function(ResultData object) onCompletion) async {
    await HttpManager.POST('/position/publish', {
      'careerDirectionId': careerDirectionId,
      'title': title,
      'description': description,
      'recruitCount': recruitCount,
      'workOperId': workOperId,
      'workYearsId': workYearsId,
      'educationId': educationId,
      'trainingModeId': trainingModeId,
      'workDaysMode': workDaysMode,
      'startPay': startPay,
      'endPay': endPay,
      'industryMandatory': industryMandatory,
      'skillIds': skillIds,
    }).then((value) {
      if (value.isSuccess) {
        // FirmCollectData newdata = FirmCollectData.fromJson(value.data);
        //
        // value.data = newdata;
      }
      onCompletion(value);
    });
  }


  ///更新发布职位
  static UpdatePositionApi(
      String id,
      String careerDirectionId,
      String title,
      String description,
      String recruitCount,
      String workOperId,
      String workYearsId,
      String educationId,
      String trainingModeId,
      String workDaysMode,
      String startPay,
      String endPay,
      String industryMandatory,
      List skillIds,
      Function(ResultData object) onCompletion) async {
    await HttpManager.Put('/position/update', {
      'id':id,//职位id
      'careerDirectionId': careerDirectionId,//开发者类型(对应字典表id)
      'title': title,//职位名称
      'description': description,//职位描述
      'recruitCount': recruitCount, //需求数
      'workOperId': workOperId, //工作方式：远程办公(对应字典表id)
      'workYearsId': workYearsId, //工作年限要求(对应字典表id)
      'educationId': educationId, //学历要求(对应字典表id)
      'trainingModeId': trainingModeId, //学历性质(对应字典表id)
      'workDaysMode': workDaysMode,   //工作方式要求(1-全日 2-半日)
      'startPay': startPay,  //	薪资范围-开始薪资
      'endPay': endPay, //	薪资范围-开始薪资
      'industryMandatory': industryMandatory, //行业强制性
      'skillIds': skillIds,//技能id
    }).then((value) {
      if (value.isSuccess) {
        // FirmCollectData newdata = FirmCollectData.fromJson(value.data);
        //
        // value.data = newdata;
      }
      onCompletion(value);
    });
  }
}
