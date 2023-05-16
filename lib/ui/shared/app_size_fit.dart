import 'dart:ui';
import 'package:people_living_flutterdemo/utils/log.dart';

/*
  获取手机方法第二种 使用MediaQuery
  在MyApp build方法里报错 - 因为MediaQuery没有初始化成功 为了更快的获取绕过MediaQuery获取
  final widths = MediaQuery.of(context).size.width;
*/

class BKSizeFit {
  // 手机分辨率宽
  static double? physicalWidth;
  // 手机分辨率高
  static double? physicalHeight;
  // 手机大小宽
  static double? screenWidth;
  // 手机大小高
  static double? screenHeight;
  // 手机像素比 
  static double dpr = 0;
  // 手机状态栏高度
  static double? statusHeight;

  static double? rpx;
  static double? px;


  // standardSize: 设计稿尺寸 默认750
  static void initialize( {double standardSize: 750} ) {
    // 1. 手机物理分辨率
    physicalWidth = window.physicalSize.width;
    physicalHeight = window.physicalSize.height;

    // 2. 获取手机屏幕宽高
    // 手机像素比 
    dpr =  window.devicePixelRatio;

    screenWidth = physicalWidth ?? 0 / dpr;
    screenHeight = physicalHeight ?? 0 / dpr;

    // 状态了高度
    statusHeight = window.padding.top / dpr;

    // 计算rpx大小 
    rpx = screenWidth ?? 0 / standardSize;
    px = screenWidth ?? 0 / standardSize * 2;

    String printTitle = '\n 分辨率:$physicalWidth * $physicalHeight \n 宽高:$screenWidth * $screenHeight \n 状态栏高度:$statusHeight \n rpx: $rpx';
    bkLog(printTitle,  StackTrace.current);
  }

  /** 小程序的适配方式 以为iphone6为设计稿 的像素 750
   *  例如: iphone6 320/750 = 0.5 1px = 2rpx
   *  手机宽 / 像素
   **/ 

  // 设计稿为像素: 设计稿200 setRpx(200 * 2)
  static double setRpx(double size) {
    return rpx ?? 0 * size;
  }
  // 设计稿为pt 设计稿200 setRpx(200)
  static double setPx(double size) {
    return px ?? 0 * size;
  }
}