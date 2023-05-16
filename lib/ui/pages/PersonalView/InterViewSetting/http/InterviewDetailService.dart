
import '../../../../../core/service/NetWork/httpManager.dart';
import '../model/InterViewDetail.dart';

class InterviewDetailService {

  static Future<InterViewDetail> requestInterDetail(int id) async {
    final result = await HttpManager.request('/interview/appDetail',params: {
      "interviewId": id,
    });
    final model =  InterViewDetail.fromJson(result);
    return model;
  }

  static getInterDetail(int inId, Function(ResultData object) onCompletion) {
    HttpManager.GET('/interview/appDetail',params: {
      "interviewId": inId,
    }).then((value) {
      if (value.isSuccess) {
        final model =  InterViewDetail.fromJson(value.data);
        value.data = model;
      }
      onCompletion(value);
    });
  }
}