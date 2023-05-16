import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

/// 刷新组建
class BKRefresh {
  ClassicalHeader refreshHeader = ClassicalHeader(
      textColor: Colors.black,
      showInfo: false,
      refreshText: '下拉可以刷新',
      refreshReadyText: '释放立即刷新',
      refreshingText: "正在刷新...",
      refreshedText: '刷新完成');

  static ClassicalHeader addRefreshHeader() {
    return BKRefresh().refreshHeader;
  }

  /// 加载footer的样式
  ClassicalFooter loadFooter = ClassicalFooter(
    bgColor: Colors.white,
    //  更多信息文字颜色
    infoColor: Colors.grey,
    // 字体颜色
    textColor: Colors.black,
    // 加载失败时显示的文字
    loadText: "加载失败",
    // 没有更多时显示的文字
    noMoreText: 'moMore',
    // 是否显示提示信息
    showInfo: false,
    // 正在加载时的文字
    loadingText: "正在加载中...",
    // 加载完成显示的文字
    loadedText: "加载完成",
  );

  static ClassicalFooter addLoadFooter() {
    return BKRefresh().loadFooter;
  }
}
