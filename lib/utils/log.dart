import 'package:flutter/foundation.dart';

void bkLog(Object message, StackTrace current){
  BKCustomTrace programInfo = BKCustomTrace(current);
  if(kReleaseMode){
    //Do sth for release

  } else {
    //Do sth for debug
      debugPrint('所在文件:${programInfo.fileName}, 所在行:${programInfo.lineNumber}, 打印信息:${message}');
  }
}

class BKCustomTrace{
  final StackTrace _trace;

  late String fileName;
  late int lineNumber;
  late int columnNumber;

  BKCustomTrace(this._trace){
    _parseTrace();
  }

  void _parseTrace(){
    var traceString = this._trace.toString().split('\n')[0];
    var indexOfFileName = traceString.indexOf(RegExp(r'[A-Za-z_]+.dart'));
    var fileInfo = traceString.substring(indexOfFileName);
    var listOfInfos = fileInfo.split(':');
    this.fileName = listOfInfos[0];
    this.lineNumber = int.parse(listOfInfos[1]);
    var columnStr = listOfInfos[2];
    columnStr = columnStr.replaceFirst(')', '');
    this.columnNumber = int.parse(columnStr);
  }
}