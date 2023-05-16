import 'package:people_living_flutterdemo/core/models/FirmHomeModel/career_direction_entity.dart';
import 'package:people_living_flutterdemo/core/models/FirmHomeModel/dev_info_item_entity.dart';
import 'package:people_living_flutterdemo/core/models/FirmHomeModel/developer_detail_entity.dart';
import 'package:people_living_flutterdemo/core/service/NetWork/httpManager.dart';

class FirmHomeService {
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

  ///获取开发者列表
  static getFirmDevApi(
      careerIds, pageNum, Function(ResultData object) onCompletion) async {
    await HttpManager.GET('/developerReveal/getDeveloper',
        params: {'careerIds': careerIds, "pageNum": pageNum}).then((value) {
      if (value.isSuccess) {
        DevInfoItemData newdata = DevInfoItemData.fromJson(value.data);

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

  ///获取开发者详情
  static getDeveloperDetail(
      developerId,  Function(ResultData object) onCompletion) async {
    await HttpManager.GET('/developerReveal/getDeveloperDetail',
        params: {'developerId': developerId}).then((value) {
      if (value.isSuccess) {
        DeveloperDetailData newdata = DeveloperDetailData.fromJson(value.data);
        //
        value.data = newdata;
      }
      onCompletion(value);
    });
  }

}
