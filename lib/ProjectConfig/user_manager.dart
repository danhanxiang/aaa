//本地化操作文件
import 'dart:convert';
import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/material.dart';

import 'package:people_living_flutterdemo/core/components/custom_animation.dart';

import '../core/models/index.dart';
//import 'package:firebase_core/firebase_core.dart';

class User {
  static late SharedPreferences _prefs;
  static Login_userInfo userInfo = Login_userInfo();

  static String token = '';
  static var isLogin;

  //区域数据
  static List<Province> provinceList = [];

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    //注册微信

    _configLoading(); //注册全局loading

    _prefs = await SharedPreferences.getInstance();

    var _profile = _prefs.getString("login_userInfo");
    bool? _islogin = _prefs.getBool('islogin');
    String? _token = _prefs.getString('token');
    var _provinceList = _prefs.getStringList("province");

    if (_islogin != null) {
      isLogin = _islogin;
    }
    //
    if (_token != null) {
      token = _token;
    }

    if (_profile != null) {
      try {
        userInfo = Login_userInfo.fromJson(jsonDecode(_profile));
      } catch (e) {
        print(e);
      }
    } else {}

    if (_provinceList != null) {
      try {
        List<Province> Provinces = [];
        for (var e in _provinceList) {
          Provinces.add(Province.fromJson(jsonDecode(e)));
        }

        provinceList = Provinces;
      } catch (e) {
        print(e);
      }
    }
  }

  // 存储用户信息
  static saveUserInfo(Login_userInfo value) {
    _prefs.setString("login_userInfo", jsonEncode(value.toJson()));

    //更新信息
    var _profile = _prefs.getString("login_userInfo")!;
    userInfo = Login_userInfo.fromJson(jsonDecode(_profile));
  }

  // 保存登录状态
  static saveIsLogin(bool value) {
    _prefs.setBool('islogin', value);

    //更新信息
    isLogin = _prefs.getBool('islogin')!;
  }

  // 保存token
  static saveIsToken(String value) {
    _prefs.setString('token', value);

    //更新token
    token = _prefs.getString('token')!;
  }

// 存储地区信息
  static saveProvince(List<Province> ProvincesList) {
    List<String> provinceJson = [];
    for (var e in ProvincesList) {
      provinceJson.add(jsonEncode(e.toJson()));
    }
    _prefs.setStringList("province", provinceJson);

    List<Province> NewProvinces = [];
    //更新信息
    var _provinceLists = _prefs.getStringList("province");
    if (_provinceLists != null) {
      for (var e in _provinceLists) {
        NewProvinces.add(Province.fromJson(jsonDecode(e)));
      }

      provinceList = NewProvinces;
    }
  }

  static _configLoading() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.circle
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 30.0
      ..radius = 10.0
      ..progressColor = Colors.white
      ..backgroundColor = Color.fromARGB(255, 29, 29, 29)
      ..indicatorColor = Colors.white
      ..textColor = Colors.white
      ..textStyle = const TextStyle(
          fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white)
      ..maskColor = Colors.blue.withOpacity(0.5)
      ..userInteractions = true
      ..dismissOnTap = false
      ..customAnimation = CustomAnimation()
      ..toastPosition = EasyLoadingToastPosition.bottom
      ..contentPadding = const EdgeInsets.fromLTRB(14, 10, 14, 10);
  }
}

class user_manager {
  //存储用户信息
  static saveUserInfo(Login_userInfo value) {
    saveObject('login_userInfo', value);
  }

  //获取用户信息  Login_userInfo
  static Future<Login_userInfo> getUserInfo() async {
    Login_userInfo newmodel = await user_manager.getObject('login_userInfo');
    return newmodel;
  }

  //用于获取instance的，可以在block中使用sharedPreferences等操作
  //例如： setBool(getBool)  setInt(getInt)   setDouble(getDouble)   setString(getString)
  static Future operator(
      Function(SharedPreferences instance) instanceBlock) async {
    final manager = await SharedPreferences.getInstance();
    instanceBlock(manager);
  }

  //保存基本类型
  static saveInfo(String key, dynamic value) {
    user_manager.operator((SharedPreferences instance) {
      instance.setString(key, value.toString());
    });
  }

  //获取存储信息
  static Future<dynamic> getInfo(String key) async {
    final manager = await SharedPreferences.getInstance();
    return manager.getString(key);
  }

  //通过block获取信息
  static getBaseInfoBlock(String key, Function(dynamic value) block) {
    user_manager.operator((SharedPreferences instance) {
      block(instance.getString(key));
    });
  }

  //保存模型信息 无回调方法
  static saveObject(String key, Login_userInfo value) {
    user_manager.operator((SharedPreferences instance) {
      final userMap = value.toJson();
      final jsonString = jsonEncode(userMap);
      instance.setString(key, jsonString);
      log('保存的登录信息jsonString： ==' + jsonString);
    });
  }

  //保存模型信息  有回调方法
  static Future saveObjectSync(String key, Login_userInfo value) async {
    final manager = await SharedPreferences.getInstance();
    final userMap = value.toJson();
    final jsonString = jsonEncode(userMap);
    await manager.setString(key, jsonString);
    await Future.delayed(const Duration(seconds: 2), () {
      log('delayed');
    });
  }

  //获取模型信息    无回调方法
  static Future<dynamic> getObject(String key) async {
    final manager = await SharedPreferences.getInstance();
    final jsonString = manager.getString(key);
    if (jsonString != null) {
      log('用户登录信息 ：==' + jsonString);
      return Login_userInfo.fromJson(jsonDecode(jsonString));
    }
    return null;
  }

  //获取模型信息   有回调方法
  static getObjectBlock(
      String key, Function(Map<String, Login_userInfo>? value) block) {
    user_manager.operator((SharedPreferences instance) {
      final jsonString = instance.getString(key);
      final userMap = jsonDecode(jsonString!);
      if (jsonString != null) {
        block(userMap);
      } else {
        block(null);
      }
    });
  }

  //删除
  static remove(String key) async {
    final manager = await SharedPreferences.getInstance();
    manager.remove(key);
  }
}
