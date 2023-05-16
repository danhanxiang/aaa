import 'package:dio/dio.dart';
import 'package:people_living_flutterdemo/core/service/NetWork/httpManager.dart';
import 'package:people_living_flutterdemo/ProjectConfig/user_manager.dart';
import '../../models/index.dart';


class LoginService {
  //获取手机号码
  static GetUserLoginPhone(String loginChannel, String youVerifyToken,
      Function(ResultData object) onCompletion) async {
    await HttpManager.POST('/login/one_key', {
      "loginChannel": loginChannel,
      'youVerifyToken': youVerifyToken
    }).then((value) {
      if (value.isSuccess) {
        //请求成功  存储token 更新登录状态
        if (value.code == 200 &&
            value.data['access_token'].toString().length > 0) {
          String token = value.data['access_token'];
          User.saveIsToken(token);
          User.saveIsLogin(true);
        }
      }
      onCompletion(value);
    });
  }

//获取用户信息
  static GetUserInfo(Function(ResultData object) onCompletion) async {
    await HttpManager.GET('/developer/info').then((value) {
      if (value.isSuccess) {
        //请求成功  存储用户信息
        User.saveUserInfo(Login_userInfo.fromJson(value.data));
      }
      onCompletion(value);
    });
  }

  //验证码登录
  static PostCodeLogin(String phone, String code, Function(ResultData object) onCompletion) async {
    
    FormData formData = FormData.fromMap({
      "mobile": phone,
      "smsCode": code,
      "scope": "all",
      "loginChannel": "Member",
      "grant_type": "sms_code",
      "register_source": "flutter",
      "register_platform": "mp"
    });
 
    await HttpManager.POST('/oauth/token', formData, path: "/tntlinking-sso-authcenter").then((value) {
      if (value.isSuccess) {
        //请求成功  存储token 更新登录状态
        if (value.code == 200 &&
            value.data['access_token'].toString().length > 0) {
          String token = value.data['access_token'];
          User.saveIsToken(token);
          User.saveIsLogin(true);
        }
      }
      onCompletion(value);
    });
  }

  //获取验证码
  static GetSendCode(String phone, Function(ResultData object) onCompletion) async {
    await HttpManager.GET('/sms/send/1', path: "/tntlinking-sso-authcenter",
        params: {"mobile": phone}).then((value) {
      onCompletion(value);
    });
  }
}
