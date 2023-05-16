import 'package:people_living_flutterdemo/core/models/FirmCollectModel/collect_status_entity.dart';
import 'package:people_living_flutterdemo/core/models/FirmHomeModel/career_direction_entity.dart';
import 'package:people_living_flutterdemo/core/service/NetWork/httpManager.dart';
import '../../../utils/utils.dart';
import '../../models/FirmCollectModel/firm_collect_entity.dart';
import '../../models/index.dart';

class FirmCollectService {
  //
  static getFavoriteDeveloperApi(pageNum,Function(ResultData object) onCompletion) async {
    await HttpManager.GET('/companyRecruiterFavorite/page/getFavoriteDeveloper',params: {'pageNum':pageNum})
        .then((value) {
      if (value.isSuccess) {
        FirmCollectData newdata = FirmCollectData.fromJson(value.data);
        // for (Map<String, dynamic> item in value.data) {
        //   // newdata.add(CareerDirectionData.fromJson(item));
        //
        // }
        value.data = newdata;
      }
      onCompletion(value);
    });
  }

  ///收藏开发者
  static collectDeveloper(String developerId,Function(ResultData object) onCompletion) async {
    await HttpManager.POST_QUERY('/companyRecruiterFavorite/favoriteDeveloper',params: {'developerId':developerId})
        .then((value) {
      if (value.isSuccess) {
        // FirmCollectData newdata = FirmCollectData.fromJson(value.data);
        //
        // value.data = newdata;
      }
      onCompletion(value);
    });
  }

  ///取消收藏开发者
  static cancelCollectDeveloper(String developerId,Function(ResultData object) onCompletion) async {
    await HttpManager.POST_QUERY('/companyRecruiterFavorite/cancelFavorite',params:{'developerId':developerId})
        .then((value) {
      if (value.isSuccess) {
        // FirmCollectData newdata = FirmCollectData.fromJson(value.data);
        //
        // value.data = newdata;
      }
      onCompletion(value);
    });
  }


  ///判断收藏状态
  static getCollectStatus(developerId,Function(ResultData object) onCompletion) async {
    await HttpManager.GET('/companyRecruiterFavorite/judgeFavoriteStatus',params: {'developerId':developerId})
        .then((value) {
      if (value.isSuccess) {
        bool collect = value.data;
        value.data = collect;
      }
      onCompletion(value);
    });
  }
}
