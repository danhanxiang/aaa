import 'package:intl/intl.dart';

import '../core/models/index.dart';

class m_tools {
  static String SubString(String str) {
    if (str.length >= 2) {
      return str.substring(str.length - 2);
    }
    return str;
  }

  static String getPayText(int startnum, int endNum) {
    String newStartNum = "${(startnum / 1000).toInt()}";
    String newEndNUm = "${(endNum / 1000).toInt()}";

    String newStartNumString =
        ((startnum.toDouble()) / (1000.toDouble())).toString();
    String newEndNumString =
        ((endNum.toDouble()) / (1000.toDouble())).toString();

    if (startnum >= 1000) {
      newStartNumString =
          ((startnum.toDouble()) / (1000.toDouble())).toString();
    }
    if (endNum >= 1000) {
      newEndNumString = "${(endNum.toDouble()) / (1000.toDouble())}k";
    }
    if (startnum % 1000 == 0) {
      newStartNumString = newStartNum;
    }
    if (endNum % 1000 == 0) {
      newEndNumString = "${newEndNUm}k";
    }

    return '${newStartNumString}-${newEndNumString}/月';
  }

  //根据出生日期返回年龄
  static String getAge(DateTime brt) {
    int age = 0;
    DateTime dateTime = DateTime.now();
    // if (dateTime.isAfter(brt)) {
    //   //出生日期晚于当前时间，无法计算
    //   return '出生日期不正確';
    // }
    int yearNow = dateTime.year; //当前年份
    int monthNow = dateTime.month; //当前月份
    int dayOfMonthNow = dateTime.day; //当前日期

    int yearBirth = brt.year;
    int monthBirth = brt.month;
    int dayOfMonthBirth = brt.day;
    age = yearNow - yearBirth; //计算整岁数
    if (monthNow <= monthBirth) {
      if (monthNow == monthBirth) {
        if (dayOfMonthNow < dayOfMonthBirth) age--; //当前日期在生日之前，年龄减一
      } else {
        age--; //当前月份在生日之前，年龄减一
      }
    }
    return age.toString();
  }

//地区模型 ->  转字符串集合
  static Map getProvince(List<Province> proLists) {
    Map multiData = new Map();
    for (int i = 0; i < proLists.length; i++) {
      List<City> citys = (proLists[i].children)!;
      Map cityStr = new Map();

      for (int t = 0; t < citys.length; t++) {
        List<Town> town = citys[t].children ?? [];
        List townStr = [];
        if (town != null) {
          for (int l = 0; l < town.length; l++) {
            townStr.add(town[l].regionName);
          }
        }
        cityStr[citys[t].regionName] = townStr;
      }
      multiData[proLists[i].regionName] = cityStr;
    }
    return multiData;
  }

//地区
  static List getIndexProvince(List<Province> provinces, List indexs) {
    String pro = "";
    String city = "";
    String town = "";
    Province provinceModel = provinces[indexs[0]];
    City cityModel = provinceModel.children![indexs[1]];
    Town townModel = cityModel.children![indexs[2]];
    pro = provinceModel.id.toString();
    city = cityModel.id.toString();
    town = townModel.id.toString();

    return [pro, city, town];
  }

//time ->String 时间转字符串
  static String stringFormat(DateTime time) {
    DateTime date = time;
    String dateString = DateFormat("yyyy-MM-dd").format(date).toString();
    return dateString;
  }

  ///日期转时间戳
  static int dateToTimestamp(String date, {isMicroseconds = false}) {
    DateTime dateTime = DateTime.parse(date);
    int timestamp = dateTime.millisecondsSinceEpoch;
    if (isMicroseconds) {
      timestamp = dateTime.microsecondsSinceEpoch;
    }
    return timestamp;
  }

//时间戳转时间格式
  static DateTime timestampToDate(int timestamp) {
    DateTime dateTime = DateTime.now();

    ///如果是十三位时间戳返回这个
    if (timestamp.toString().length == 13) {
      dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    } else if (timestamp.toString().length == 16) {
      ///如果是十六位时间戳
      dateTime = DateTime.fromMicrosecondsSinceEpoch(timestamp);
    }
    return dateTime;
  }

  ///时间戳转日期
  ///[timestamp] 时间戳
  ///[onlyNeedDate ] 是否只显示日期 舍去时间
  static String timestampToDateStr(int timestamp, {onlyNeedDate = false}) {
    DateTime dataTime = timestampToDate(timestamp);
    String dateTime = dataTime.toString();

    ///去掉时间后面的.000
    dateTime = dateTime.substring(0, dateTime.length - 4);
    if (onlyNeedDate) {
      List<String> dataList = dateTime.split(" ");
      dateTime = dataList[0];
    }
    return dateTime;
  }

//将传进来的 时间戳/日期格式 转成 DateTime 格式
  static DateTime _changeTimeDate(time) {
    ///如果传进来的是字符串 13/16位 而且不包含-
    DateTime dateTime = DateTime.now();
    if (time is String) {
      if ((time.length == 13 || time.length == 16) && !time.contains("-")) {
        dateTime = timestampToDate(int.parse(time));
      } else {
        dateTime = DateTime.parse(time);
      }
    } else if (time is int) {
      dateTime = timestampToDate(time);
    }
    return dateTime;
  }

  ///检测时间距离当前是今天 昨天 前天还是某个日期 跨年显示 年-月-日 不跨年显示 月-日
  static String getDateScope({required checkDate}) {
    String temp = DateTime.now().toString();
    List listTemp = temp.split(" ");
    temp = listTemp[0];
    DateTime nowTime = DateTime.parse(temp);
    DateTime checkTime = _changeTimeDate(checkDate);

    Duration diff = checkTime.difference(nowTime);

    ///如果不同年 返回 年-月-日 小时:分钟 不显示秒及其.000
    if (checkTime.year != nowTime.year) {
      return checkTime.toString().substring(0, checkTime.toString().length - 7);
    }

    /// 同年判断是不是前天/昨天/今天/
    if ((diff < const Duration(hours: 24)) &&
        (diff > const Duration(hours: 0))) {
      return "今天 ${_dataNum(checkTime.hour)}:${_dataNum(checkTime.minute)}";
    } else if ((diff < const Duration(hours: 0)) &&
        (diff > const Duration(hours: -24))) {
      return "昨天 ${_dataNum(checkTime.hour)}:${_dataNum(checkTime.minute)}";
    } else if (diff < const Duration(hours: -24) &&
        diff > const Duration(hours: -48)) {
      return "前天 ${_dataNum(checkTime.hour)}:${_dataNum(checkTime.minute)}";
    }

    ///如果剩下都不是就返回 月-日 然后时间
    return checkTime.toString().substring(5, checkTime.toString().length - 7);
  }

  static String _dataNum(numb) {
    if (numb < 10) {
      return "0$numb";
    }
    return numb.toString();
  }

  ///数组转字符串
  static String getTaskScreen(List list) {
    String str = "";
    list.forEach((f) {
      if (str.length <= 0) {
        str = "${f}";
      } else {
        str = "${str},${f}";
      }
    });

    return str;
  }
}
