import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
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


  ///post请求 URLEncoding
  static Future<ResultData> POST_QUERY( String api, {String path = "/manpower-rest-api", bool isGateway = true, Map<String, dynamic>? params,}) async {
    Response response;
    try {
      if (params != null) {
        response = await DioRequest.getInstance(isGateway: isGateway).dio.post(path + api, queryParameters: params);
      } else {
        response = await DioRequest.getInstance(isGateway: isGateway).dio.post(path + api);
      }

      return getResule(response);
    } catch (e) {
      String errorStr = error(e);
      return ResultData({},[], false, message: errorStr);
    }
  }


  ///post请求 JSONEncoding
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


/// post请求 上传文件-单文件
/// api: 请求地址
/// file: PlatformFile
  static Future<ResultData> POST_file(
    String api, 
    PlatformFile file,
    ) async {
    
    Response response;

    String f = file.path ?? '';
    String filename = f.substring(f.lastIndexOf("/") + 1);
    String suffix = filename.substring(filename.lastIndexOf(".") + 1);
    
    MultipartFile multipartFile = await MultipartFile.fromFile(
      f,
      filename: "filename.$suffix",
        // contentType: MediaType.parse("image/$suffix"),
    );
    
    FormData formData = FormData.fromMap({
      'file': multipartFile
    });

    try {
      response = await DioRequest.getInstance().dio.post(api, data: formData);
      return getResule(response);
    } catch (e) {
      String errorStr = error(e);
      return ResultData({},[], false, message: errorStr);
    }
  }

  //post请求 上传文件-单文件
  static Future<ResultData> POST_CompanyImage(String api, Map<String, dynamic> data,
      String filePath, String fileformat,{String path = "/manpower-rest-api", bool isGateway = true}) async {
    Response response;
    data.addAll({
      "multipartFile":
      await MultipartFile.fromFile(filePath, filename: "file.${fileformat}")
    });
    var formData = FormData.fromMap(data);
    try {
      response = await DioRequest.getInstance().dio.post(path + api, data: formData);
      return getResule(response);
    } catch (e) {
      String errorStr = error(e);
      return ResultData({},[], false, message: errorStr);
    }
  }

//post 请求  多文件上传
  static Future<ResultData> POST_fileList(
    String api, 
    List<PlatformFile>uploadFiles) async {
      Response response;
    // List<MultipartFile> files = [];
    // var formData = FormData.fromMap(files);
    // for (PlatformFile file in uploadFiles) {
    //   String f = file.path ?? '';
    //   String filename = f.substring(f.lastIndexOf("/") + 1);
    //   var suffix = filename.substring(filename.lastIndexOf(".") + 1);
    //   MultipartFile multipartFile = await MultipartFile.fromFile(
    //     f,
    //     filename: "filename.$suffix",
    //     // contentType: MediaType.parse("image/$suffix"),
    //   );
    //   files.add(multipartFile);
    // }

      List<MapEntry<String, MultipartFile>> list = [];
      int i = 0;

      for (var file in uploadFiles) {
        String f = file.path ?? '';
        String filename = f.substring(f.lastIndexOf("/") + 1);
        String suffix = filename.substring(filename.lastIndexOf(".") + 1);
      
        MultipartFile multipartFile = await MultipartFile.fromFile(
          f,
          filename: "filename.$suffix",
        );

        list.add(MapEntry(
          'file',
          multipartFile
        ));
        i++;
      }
      FormData formData = FormData.fromMap({
        'file': list
      });
      // formData.files.addAll(list);

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

  static Future<ResultData> PUT_OTHER(String api, {String path = "/manpower-rest-api", bool isGateway = true, Map<String, dynamic>? params,}) async {
    Response response;
    try {
      if (params != null) {
        response = await DioRequest.getInstance(isGateway: isGateway).dio.put(path + api, queryParameters: params);
      } else {
        response = await DioRequest.getInstance(isGateway: isGateway).dio.put(path + api);
      }
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
      EasyLoading.showToast('${response.data["message"]}');
      return ResultData(response.data,response.data, false,
          message: response.data["message"]);
    }
  } else {
    return ResultData({},[], false,
        message: "请求错误" + response.statusCode.toString());
  }
}
