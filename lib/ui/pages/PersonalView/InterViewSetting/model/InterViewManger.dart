import 'package:people_living_flutterdemo/core/extension/string_extension.dart';

class InterViewManger {
  int? code;
  String? message;
  List<InterModel>? data;

  InterViewManger({this.code, this.message, this.data});

  InterViewManger.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <InterModel>[];
      json['data'].forEach((v) {
        data!.add(new InterModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class InterModel {
  int? id;
  int? workDaysMode;
  String? workDaysModeName;
  String? companyName;
  String? positionName;
  String? interviewTimeType;
  String? interviewStartDate;
  String? interviewEndDate;
  double? startPay;
  double? endPay;

  InterModel(
      {this.id,
      this.workDaysMode,
      this.workDaysModeName,
      this.companyName,
      this.positionName,
      this.interviewTimeType,
      this.interviewStartDate,
      this.interviewEndDate,
      this.startPay,
      this.endPay});

  InterModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    workDaysMode = json['workDaysMode'];
    workDaysModeName = json['workDaysModeName'];
    companyName = json['companyName'];
    positionName = json['positionName'];
    interviewTimeType = json['interviewTimeType'];
    interviewStartDate = json['interviewStartDate'];
    interviewEndDate = json['interviewEndDate'];
    startPay = json['startPay'];
    endPay = json['endPay'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['workDaysMode'] = this.workDaysMode;
    data['workDaysModeName'] = this.workDaysModeName;
    data['companyName'] = this.companyName;
    data['positionName'] = this.positionName;
    data['interviewTimeType'] = this.interviewTimeType;
    data['interviewStartDate'] = this.interviewStartDate;
    data['interviewEndDate'] = this.interviewEndDate;
    data['startPay'] = this.startPay;
    data['endPay'] = this.endPay;
    return data;
  }


  String payToMonth() {
    double s = (startPay ?? 0.0) / 1000;
    double e = (endPay ?? 0.0) / 1000.0;
    return  '${workDaysModeName}·$s-$e/k月'; 
  }

  String getinterviewdateline() {
    String start = interviewStartDate ?? '';
    String end = interviewEndDate ?? '';
    return '${start.yearMonthDay} ${start.toTime} - ${end.toTime}';
  }
}