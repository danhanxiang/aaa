import 'package:dio/dio.dart';

String error(e) {
  if (e is DioError) {
    switch (e.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        return '网络超时';
      case DioErrorType.other:
        return '未知错误';
      case DioErrorType.response:
        int? statusCode = e.response?.statusCode;
        switch (statusCode) {
          case 400:
            return '请求语法错误';
          case 401:
            return '没有权限';
          case 403:
            return '服务器拒绝执行';
          case 404:
            return '请求资源部不存在';
          case 405:
            return '请求方法被禁止';
          case 500:
            return '服务器内部错误';
          case 502:
            return '无效请求';
          case 503:
            return '服务器异常';
          default:
            return '未知错误';
        }
      default:
        return '未知错误';
    }
  } else {
    return '未知错误';
  }
}
