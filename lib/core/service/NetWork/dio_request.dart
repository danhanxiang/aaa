import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:people_living_flutterdemo/ProjectConfig/Navigate/NavigateService.dart';
import 'package:people_living_flutterdemo/ProjectConfig/Navigate/service_locator.dart';
import 'package:people_living_flutterdemo/ProjectConfig/ProjectConfig.dart';
import 'package:people_living_flutterdemo/ProjectConfig/user_manager.dart';
import 'package:people_living_flutterdemo/ui/pages/Login/login.dart';
import 'package:people_living_flutterdemo/utils/utils.dart';


// 网络请求工具类
class DioRequest {
  @required bool is_gateway = false;
  late Dio dio;
  static DioRequest? _ginstance;

  static DioRequest? _minstance;

  /// 构造函数
  DioRequest({required bool is_gateway}) {
    bool isGateway = false;
    dio = Dio();

    dio.options = BaseOptions(
        baseUrl: is_gateway ? ProjectConfig.G_URl : ProjectConfig.M_URl,
        connectTimeout: 10000,
        sendTimeout: 10000,
        receiveTimeout: 10000,
        // contentType: "multipart/form-data",
        // contentType: 'application/json; charset=utf-8',
        headers: {});


    /// 请求拦截器 and 响应拦截机 and 错误处理
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      if (options.path == '/login/one_key' ||
          options.path == '/tntlinking-sso-authcenter/oauth/token' ||
          options.path == "/sms/send/verification/code") {
        options.headers = {
          "apiVersion": "1.0",
          "os": "3", // 1.ios, 2.android 3 flutter
          "Authorization": "Basic" + " " + "dG50bGlua2luZzptYW5wb3dlcg==",
        };
      } else {
        options.headers = {
          "apiVersion": "1.0",
          "os": "3", // 1.ios, 2.android 3flutter
          "Authorization": "Bearer" + " " + User.token,
        };
      }
      print("\n================== 请求数据 ================== ");
      print("${options.contentType}");
      print("http-->url:${options.uri.toString()}");
      print("http-->headers:${options.headers}");
      print("http-->data :${options.data}");
      print("http-->queryParameters:${options.queryParameters}");


      return handler.next(options);
    }, onResponse: (response, handler) {
      print("\n================== 响应数据================== ");
      print("\nhttp-->code:  ${response.statusCode} ");
      // print("Json源数据 = ${jsonEncode(response.data)}");
      // print("data 数据 = ${response.data}");
      LogUtil.p('${response.data}', title: 'json返回数据');
      if (response.data["code"] == 401 &&
          response.data["message"] == "token已过期,请重新获取最新token") {
        // 重新登录
        User.saveIsLogin(false);
        getIt<NavigateService>().pushNamed(LoginView.routeName);
      }
      handler.next(response);
    }, onError: (DioError e, handler) {
      print("\n================== 错误响应数据================== ");
      print("\nhttp-->type:${e.type} ");
      print("\nhttp-->message:${e.message} ");
      print("\n");
      return handler.next(e);
    }));

    login(dynamic data){
      if (data["code"] == 401 && data["message"] == "token已过期,请重新获取最新token") {
        print("token 过期 重新登录");
        // 重新登录
        User.saveIsLogin(false);
        getIt<NavigateService>().pushNamed(LoginView.routeName);
      }
    }
  }

  /// 默认 /manpower-rest-api
  static DioRequest getInstance({bool isGateway = true}) {
    return _minstance ??= DioRequest(is_gateway: isGateway,);
  }
}
