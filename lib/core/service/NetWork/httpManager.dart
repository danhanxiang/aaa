import 'package:dio/dio.dart';
import 'dio_request.dart';
import 'error.dart';

class ResultData {
  late Map<String, dynamic> params;
  dynamic data;
  bool isSuccess = false;
  int? code;
  String? message;

  ResultData(Map<String, dynamic> params, dynamic data, bool isSuccess, {int? code, String? message}) {
    this.params = params;
    this.data = data;
    this.isSuccess = isSuccess;
    this.code = code;
    this.message = message;
  }
}

class HttpManager {
  
  static Future<T> request<T>(
    String api, 
    {String path = "/manpower-rest-api", bool isGateway = true, Map<String, dynamic>? params,}) async {
    Response response;
    try {
      if (params != null) {
        response = await DioRequest.getInstance(isGateway: isGateway).dio.get(path + api, queryParameters: params);
      } else {
        response = await DioRequest.getInstance(isGateway: isGateway).dio.get(path + api);
      }

      return response.data;
    } catch (e) {
      return Future.error(e);
    }
  }
  //get请求
  // ignore: non_constant_identifier_names
  static Future<ResultData> GET(
    String api, 
    {String path = "/manpower-rest-api", bool isGateway = true, Map<String, dynamic>? params,}) async {
    Response response;
    try {
      if (params != null) {
        response = await DioRequest.getInstance(isGateway: isGateway).dio.get(path + api, queryParameters: params);
      } else {
        response = await DioRequest.getInstance(isGateway: isGateway).dio.get(path + api);
      }

      return getResule(response);
    } catch (e) {
      String errorStr = error(e);
      return ResultData({},[], false, message: errorStr);
    }
  }

  //   static Future<Response> GETJson(
  //   String api, 
  //   {String path = "/manpower-rest-api", bool isGateway = true, Map<String, dynamic>? params,}) async {
  //   Response response;
  //   try {
  //     if (params != null) {
  //       response = await DioRequest.getInstance(isGateway: isGateway).dio.get(path + api, queryParameters: params);
  //     } else {
  //       response = await DioRequest.getInstance(isGateway: isGateway).dio.get(path + api);
  //     }

  //     return response;
  //   } catch (e) {
  //     String errorStr = error(e);
  //     // return ResultData([], false, message: errorStr);
  //   }
  // }

  //post请求 
  static Future<ResultData> POST(String api, var data, {String path = "/manpower-rest-api", bool isGateway = true}) async {
    Response response;
    try {
      response = await DioRequest.getInstance(isGateway: isGateway).dio.post(path + api, data: data);
      return getResule(response);
    } catch (e) {
      String errorStr = error(e);
      return ResultData({},[], false, message: errorStr);
    }
  }


  //post请求 上传文件-单文件
  static Future<ResultData> POST_file(String api, Map<String, dynamic> data,
      String filePath, String fileformat) async {
    Response response;
    data.addAll({
      "files":
          await MultipartFile.fromFile(filePath, filename: "file.${fileformat}")
    });
    var formData = FormData.fromMap(data);
    try {
      response = await DioRequest.getInstance().dio.post(api, data: formData);
      return getResule(response);
    } catch (e) {
      String errorStr = error(e);
      return ResultData({},[], false, message: errorStr);
    }
  }

//post 请求  多文件上传
  static Future<ResultData> POST_fileList(String api, Map<String, dynamic> data,
      List filePaths, String fileformat) async {
    Response response;
    List<MapEntry<String, MultipartFile>> list = [];
    int i = 0;
    var formData = FormData.fromMap(data);
    for (var path in filePaths) {
      list.add(MapEntry(
        'files',
        MultipartFile.fromFileSync(path, filename: "file_${i}.${fileformat}"),
      ));
      i++;
    }
    formData.files.addAll(list);

    try {
      response = await DioRequest.getInstance().dio.post(api, data: formData);
      return getResule(response);
    } catch (e) {
      String errorStr = error(e);
      return ResultData({},[], false, message: errorStr);
    }
  }

  //delete请求
  static Future<ResultData> Delete(
      String api, 
      Map<String, dynamic> data,
      [bool isGateway = true]) async {
    Response response;
    try {
      response = await DioRequest.getInstance(isGateway: isGateway).dio.delete(api, data: data);
      return getResule(response);
    } catch (e) {
      String errorStr = error(e);
      return ResultData({},[], false, message: errorStr);
    }
  }

  //put请求
  static Future<ResultData> Put(String api, Map<String, dynamic> data) async {
    Response response;
    try {
      response = await DioRequest.getInstance().dio.put(api, data: data);
      return getResule(response);
    } catch (e) {
      String errorStr = error(e);
      return ResultData({},[], false, message: errorStr);
    }
  }
}

ResultData getResule(Response response) {
  if (response.statusCode == 200) {
    if (response.data["code"] == 200) {
      //请求成功
      return ResultData(response.data,response.data["data"], true,
          code: response.data["code"]);
    } else {
      return ResultData(response.data,response.data, false,
          message: response.data["message"]);
    }
  } else {
    return ResultData({},[], false,
        message: "请求错误" + response.statusCode.toString());
  }
}
