import 'package:flutter/cupertino.dart';

class LogUtil {
  static var _separator = "=";
  static var _split =
      "$_separator$_separator$_separator$_separator$_separator$_separator$_separator$_separator$_separator";
  static var _title = "日志打印";
  static var _isDebug = true;
  static int _limitLength = 800000;
  static String _startLine = "$_split$_title$_split";
  static String _endLine = "$_split$_separator$_separator$_separator$_split";

  static void init(
      {required String title,
      required bool isDebug,
      required int limitLength}) {
    _title = title;
    _isDebug = isDebug;
    _limitLength = limitLength ??= _limitLength;
    _startLine = "$_split$_title$_split";
    var endLineStr = StringBuffer();
    var cnCharReg = RegExp("[\u4e00-\u9fa5]");
    for (int i = 0; i < _startLine.length; i++) {
      if (cnCharReg.stringMatch(_startLine[i]) != null) {
        endLineStr.write(_separator);
      }
      endLineStr.write(_separator);
    }
    _endLine = endLineStr.toString();
  }

  //仅Debug模式可见
  static void d(dynamic obj) {
    if (_isDebug) {
      _log(obj.toString());
    }
  }

  static void v(dynamic obj) {
    _log(obj.toString());
  }

  static void _log(String msg) {
    print("$_startLine");
    _logEmpyLine();
    if (msg.length < _limitLength) {
      print(msg);
    } else {
      segmentationLog(msg);
    }
    _logEmpyLine();
    print("$_endLine");
  }

  static void segmentationLog(String msg) {
    var outStr = StringBuffer();
    for (var index = 0; index < msg.length; index++) {
      outStr.write(msg[index]);
      if (index % _limitLength == 0 && index != 0) {
        print(outStr);
        outStr.clear();
        var lastIndex = index + 1;
        if (msg.length - lastIndex < _limitLength) {
          var remainderStr = msg.substring(lastIndex, msg.length);
          print(remainderStr);
          break;
        }
      }
    }
  }

  static void _logEmpyLine() {
    print("");
  }

  static void p(String msg, {String title = "Log"}) {
    //因为String的length是字符数量不是字节数量所以为了防止中文字符过多，
    //  把4*1024的MAX字节打印长度改为1000字符数
    print("===================${title}日志打印======================");
    print("\n");
    int maxStrLength = 1000;
    //大于1000时

    while (msg.length > maxStrLength) {
      print(msg.substring(0, maxStrLength));
      msg = msg.substring(maxStrLength);
    }
    //剩余部分
    print(msg);
    print("\n");
    print("==================${title}日志结束=======================");
  }
}
