//本地化操作文件
import 'dart:convert';
import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/material.dart';
import 'package:people_living_flutterdemo/core/components/custom_animation.dart';
import '../core/models/index.dart';


/// 本地key: 身份切换 0 开发者端 1企业端
String IdentityKey = 'isIdentity';
/// 本地token
String TokenKey = 'token';
/// 用户开发者端信息
String DeveloperInfoKey = 'login_DevUserInfo';
/// 企业端用户信息
String CompanyInfoKey = 'login_CompanyUserInfo';

String IsloginKey = 'islogin';
/// 省市区
String ProvinceKey = 'province';
/// 更新token
String LoginRoleKey = 'loginRole';

String Home_searchKey = 'home_search';

class User {
  static late SharedPreferences _prefs;
  static Login_userInfo userInfo = Login_userInfo();

  static String token = '';
  static var isLogin;
  static String loginRole = 'Recruiter';
  /// 第一次进来显示
  static bool isFirst = true;

  /// 0 开发端 1 企业端 默认开发者端
  static int identity = 0;

  //区域数据
  static List<Province> provinceList = [];

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    //注册微信

    _configLoading(); //注册全局loading

    _prefs = await SharedPreferences.getInstance();

    /// 获取身份切换
    identity = _prefs.getInt(IdentityKey) ?? 0;
    
    String? _loginRole = _prefs.getString(LoginRoleKey);
    if (_loginRole != null) {
      loginRole = _loginRole;
    }

    bool? _islogin = _prefs.getBool(IsloginKey);
    if (_islogin != null) {
      isLogin = _islogin;
    }
    

    String? _token = _prefs.getString(TokenKey);
    if (_token != null) {
      token = _token;
    }

    /// 用户信息
    var _profile = _prefs.getString(DeveloperInfoKey);
    if (_profile != null) {
      try {
        userInfo = Login_userInfo.fromJson(jsonDecode(_profile));
      } catch (e) {
        print(e);
      }
    } else {}


    /// 省市区
    var _provinceList = _prefs.getStringList(ProvinceKey);
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

  static String identityToTitle(){
    switch (identity) {
      case 0:
        return '开发者端';
      case 1:
       return '企业端';
      default: return '';
    } 
  }

  static String statusTitle(){
    if (User.userInfo.status == 1) {
      return "待完善";
    } else if (User.userInfo.status == 2) {
      return "待审核";
    } else if (User.userInfo.status == 3) {
      return "审核成功";
    } else if (User.userInfo.status == 4) {
      return "审核失败";
    } else {
      return "未知";
    }
  }

  /// 存储身份 0 企业端 1 开发者端
  static saveChangeStyle(int stlye){
    _prefs.setInt(IdentityKey, stlye);
    identity = stlye;
  }

  // 存储开发者用户信息
  static saveUserInfo(Login_userInfo value) {
    _prefs.setString(DeveloperInfoKey, jsonEncode(value.toJson()));

    //更新信息
    var _profile = _prefs.getString(DeveloperInfoKey)!;
    userInfo = Login_userInfo.fromJson(jsonDecode(_profile));
  }

  /// 存储企业端用户信息
  static saveCompUserInf(Login_userCompInfo value) {
    _prefs.setString(CompanyInfoKey, jsonEncode(value.toJson()));
    //更新信息
    var _profile = _prefs.getString(CompanyInfoKey)!;
    userInfo = Login_userInfo.fromJson(jsonDecode(_profile));
  }

  // 保存登录状态
  static saveIsLogin(bool value) {
    _prefs.setBool(IsloginKey, value);

    //更新信息
    isLogin = _prefs.getBool(IsloginKey) ?? false;
  }

  // 保存token
  static saveIsToken(String value) {
    _prefs.setString(TokenKey, value);

    //更新token
    token = _prefs.getString(TokenKey) ?? '';
  }
  // 保存token
  static saveRole(String value) {
    _prefs.setString(LoginRoleKey, value);

    //更新token
    loginRole = _prefs.getString(LoginRoleKey)??'';
  }


// 存储地区信息
  static saveProvince(List<Province> ProvincesList) {
    List<String> provinceJson = [];
    for (var e in ProvincesList) {
      provinceJson.add(jsonEncode(e.toJson()));
    }
    _prefs.setStringList(ProvinceKey, provinceJson);

    List<Province> NewProvinces = [];
    //更新信息
    var _provinceLists = _prefs.getStringList(ProvinceKey);
    if (_provinceLists != null) {
      for (var e in _provinceLists) {
        NewProvinces.add(Province.fromJson(jsonDecode(e)));
      }

      provinceList = NewProvinces;
    }
  }

  static saveDevSearch(String search) {
    var list = _prefs.getStringList(Home_searchKey);
    if (list != null) {
      list.add(search);
      list.reversed.toList();
      _prefs.setStringList(Home_searchKey, list);
    }
  }

  static List<String> getDecSearch() {
    var stringList = _prefs.getStringList(Home_searchKey);
    if (stringList != null) {
      return stringList;
    } else {
      return [];
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
    saveObject(DeveloperInfoKey, value);
  }

  //获取用户信息  Login_userInfo
  static Future<Login_userInfo> getUserInfo() async {
    Login_userInfo newmodel = await user_manager.getObject(DeveloperInfoKey);
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
