import 'package:people_living_flutterdemo/core/extension/string_extension.dart';
import 'package:people_living_flutterdemo/core/service/NetWork/httpManager.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/InterViewSetting/model/OneDayModel.dart';

import '../model/InterViewManger.dart';

class InterViewSettingViewModel {
  InterViewSettingViewModel({this.sltDateString = '2023-03-23'});
  
  final weekList = ['日','一','二','三','四','五','六'];

  String sltDateString;

  int? selectIndex;

  late List<InterModel> interviewList = [];
  late List<DayModel> dateStatusList = [ 
    // DayModel(statusName: '日'), 
    // DayModel(statusName: '一'),
    // DayModel(statusName: '二'),
    // DayModel(statusName: '三'),
    // DayModel(statusName: '四'),
    // DayModel(statusName: '五'),
    // DayModel(statusName: '六'),
  ];

  String get today {
    String year = BKDateTime.todayToYear();
    String month = BKDateTime.todayToMonth();
    return '$year/$month';
  }

  double get mainAxisSpacing {
    return 10;
  }
  double get crossAxisSpacing {
    return 10;
  }
  double get cellHeight {
    return 20;
  }
  
  String futterString(List<DayModel> itemList, int index) {
    int current = index - weekList.length;
    String name = itemList[current].scheduleDate ?? '';
    // return name.substring(name.length - 2);
    return name;
  }

  String selectDateString(List<DayModel> itemList, int index) {
    int current = index - weekList.length;
    String name = itemList[current].scheduleDate ?? '';
    return name;
  }

  bool isCurrentDay(String day, int index) {
    if (selectIndex == null && day == BKDateTime.today()) {
      selectIndex = index;
      return true;
    }
    return selectIndex == index;
  }

  
}


class InterViewSettingService {
  static Future<List<DayModel>> requestMonthDayList() async {
    final result = await HttpManager.request('/interviewSchedule/appList');
    final model =  OneDayModel.fromJson(result);
    return model.data ?? [];
  }

  static getMonthDayList(Function(ResultData object) onCompletion) {
    HttpManager.GET('/interviewSchedule/appList').then((value) {
      if (value.isSuccess) {
        final model =  OneDayModel.fromJson(value.params);
        value.data = model;
      }
      onCompletion(value);
    });
  }

  /// 获取当前时间的面试记录
  static Future<List<InterModel>> getInterviewList(String day) async {
    final result = await HttpManager.request('/interview/appListDate', params: {
      'interviewDate': day
    });
    final model =  InterViewManger.fromJson(result);
    return model.data ?? [];
  }
  // static getInterviewList(String day, Function(InterViewManger object) onCompletion) {
  //   HttpManager.GET('/interview/appListDate', params: {
  //     'interviewDate': day
  //   }).then((value) {
  //     if (value.isSuccess) {
  //       final model =  InterViewManger.fromJson(value.params);
  //       // value.data = model;
  //       onCompletion(model);
  //     }
  //   });
  // }
}
