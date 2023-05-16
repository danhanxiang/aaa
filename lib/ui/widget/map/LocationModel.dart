import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_baidu_mapapi_map/flutter_baidu_mapapi_map.dart';
import 'package:flutter_bmflocation/flutter_bmflocation.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:flutter_baidu_mapapi_base/flutter_baidu_mapapi_base.dart'
    show BMFCoordinate, BMFEdgeInsets, BMFMapSDK, BMF_COORD_TYPE;


class LocationManager {

  LocationManager._internal();
  
  factory LocationManager() => _instance;
  
  static late final LocationManager _instance = LocationManager._internal();
  bool _suc = false;

  final LocationFlutterPlugin myLocPlugin = LocationFlutterPlugin();

  // 初始化百度
  void setLocation() {

    /// 动态申请定位权限
    requestPermission();
    // 设置是否隐私政策
    myLocPlugin.setAgreePrivacy(true);
    BMFMapSDK.setAgreePrivacy(true);

    if (Platform.isIOS) {
      /// 设置ios端ak, android端ak可以直接在清单文件中配置
      myLocPlugin.authAK('iLYbZ6m6LUchssLIoGe3vKFiQDBxaFbv');
      BMFMapSDK.setApiKeyAndCoordType(
          'iLYbZ6m6LUchssLIoGe3vKFiQDBxaFbv', BMF_COORD_TYPE.BD09LL);
    } else if (Platform.isAndroid) {
      // Android 目前不支持接口设置Apikey,
      // 请在主工程的Manifest文件里设置，详细配置方法请参考官网(https://lbsyun.baidu.com/)demo
      BMFMapSDK.setCoordType(BMF_COORD_TYPE.BD09LL);
    }

    /// iOS端鉴权结果
    myLocPlugin.getApiKeyCallback(callback: (String result) {
      String str = result;
      print('鉴权结果：' + str);
    });
  }

  // 动态申请定位权限
  void requestPermission() async {
    // 申请权限
    bool hasLocationPermission = await requestLocationPermission();
    if (hasLocationPermission) {
      // 权限申请通过
    } else {}
  }

  /// 申请定位权限
  /// 授予定位权限返回true， 否则返回false
  Future<bool> requestLocationPermission() async {
    //获取当前的权限
    var status = await Permission.location.status;
    if (status == PermissionStatus.granted) {
      //已经授权
      return true;
    } else {
      //未授权则发起一次申请
      status = await Permission.location.request();
      if (status == PermissionStatus.granted) {
        return true;
      } else {
        return false;
      }
    }
  }
  
  void setupLocation(Function(BaiduLocation result) callback) {
    // LocationFlutterPlugin _myLocPlugin = LocationFlutterPlugin();
    ///单次定位时如果是安卓可以在内部进行判断调用连续定位
    if (Platform.isIOS) {
      ///接受定位回调
      myLocPlugin.singleLocationCallback(callback: (BaiduLocation result) {
        callback(result);
      });
    } else if (Platform.isAndroid) {
      ///接受定位回调
      myLocPlugin.seriesLocationCallback(callback: (BaiduLocation result) {
        callback(result);
      });
    }
  }
  void locationAction() async {
    /// 设置android端和ios端定位参数
    /// android 端设置定位参数
    /// ios 端设置定位参数
    Map iosMap = initIOSOptions().getMap();
    Map androidMap = initAndroidOptions().getMap();

    _suc = await myLocPlugin.prepareLoc(androidMap, iosMap);
    print('设置定位参数：$iosMap');
  }
  
  /// 启动定位
  Future<void> startLocation() async {
    if (Platform.isIOS) {
      _suc = await myLocPlugin
          .singleLocation({'isReGeocode': true, 'isNetworkState': true});
      print('开始单次定位：$_suc');
    } else if (Platform.isAndroid) {
      _suc = await myLocPlugin.startLocation();
    }
  }

  /// 设置地图参数
  BaiduLocationAndroidOption initAndroidOptions() {
    BaiduLocationAndroidOption options = BaiduLocationAndroidOption(
        coorType: 'bd09ll',
        locationMode: BMFLocationMode.hightAccuracy,
        isNeedAddress: true,
        isNeedAltitude: true,
        isNeedLocationPoiList: true,
        isNeedNewVersionRgc: true,
        isNeedLocationDescribe: true,
        openGps: true,
        locationPurpose: BMFLocationPurpose.sport,
        coordType: BMFLocationCoordType.bd09ll);
    return options;
  }

  BaiduLocationIOSOption initIOSOptions() {
    BaiduLocationIOSOption options = BaiduLocationIOSOption(
        coordType: BMFLocationCoordType.bd09ll,
        BMKLocationCoordinateType: 'BMKLocationCoordinateTypeBMK09LL',
        desiredAccuracy: BMFDesiredAccuracy.best);
    return options;
  }
}


class MapManager {
  late BMFMapController _myMapController;
  BaiduLocation loationResult = BaiduLocation();

  void onBMFMapCreated(BMFMapController controller) {
    _myMapController = controller;

    /// 地图加载回调
    _myMapController.setMapDidLoadCallback(callback: () {
      print('mapDidLoad-地图加载完成');
    });
  }
  
  ///定位完成添加mark
  void locationFinish() {
    /// 创建BMFMarker
    BMFMarker marker = BMFMarker.icon(
        position: BMFCoordinate(
            loationResult.latitude ?? 0.0, loationResult.longitude ?? 0.0),
        title: 'sunbeck',
        identifier: 'flutter_marker',
        icon: 'resoures/icon_mark.png');
    print(loationResult.latitude.toString() +
        loationResult.longitude.toString());

    /// 添加Marker
    _myMapController.addMarker(marker);

    ///设置中心点
    _myMapController.setCenterCoordinate(
        BMFCoordinate(
            loationResult.latitude ?? 0.0, loationResult.longitude ?? 0.0),
        false);
  }

  /// 设置地图参数
  BMFMapOptions initMapOptions() {
    BMFMapOptions mapOptions = BMFMapOptions(
        center: BMFCoordinate(39.917215, 116.380341),
        zoomLevel: 12,
        mapPadding: BMFEdgeInsets(top: 0, left: 0, right: 0, bottom: 0));
    return mapOptions;
  }
}