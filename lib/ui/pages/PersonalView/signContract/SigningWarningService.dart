import 'package:people_living_flutterdemo/core/service/NetWork/httpManager.dart';

class SigningWarningService {

  static saveSigningInfo(
    String realName,
    String mobile,
    String bankCardId,
    String idNumber,
    String bankName,
    Function(ResultData object) onCompletion) async {
    await HttpManager.POST('/developer/signContract/sign', 
     {
      'realName': realName,
      'mobile': mobile,
      "bankCardId": bankCardId,
      'idNumber': idNumber,
      'bankName': bankName
    }).then((value) {
      if (value.isSuccess) {
        String token = value.data['contractUrl'];
      }
      onCompletion(value);
    });
  }
}