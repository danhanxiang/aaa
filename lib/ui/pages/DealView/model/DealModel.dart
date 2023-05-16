import 'package:people_living_flutterdemo/core/extension/string_extension.dart';

class DealModel {
  int? id;
  int? orderStatus;
  String? orderNo;
  int? workDaysMode;
  String? workDaysModeName;
  String? companyName;
  String? positionName;
  String? statusName;
  String? serviceName;
  String? finishDate;
  String? workStartDate;

  String getInfo() {
    String s = workStartDate ?? '';
    String e = finishDate ?? '';
    return '${workDaysModeName}| ${s.yearMonthDay}-${e.yearMonthDay}';
  }

  DealModel(
      {this.id,
      this.orderStatus,
      this.orderNo,
      this.workDaysMode,
      this.workDaysModeName,
      this.companyName,
      this.positionName,
      this.statusName,
      this.serviceName,
      this.finishDate,
      this.workStartDate});

  DealModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderStatus = json['orderStatus'];
    orderNo = json['orderNo'];
    workDaysMode = json['workDaysMode'];
    workDaysModeName = json['workDaysModeName'];
    companyName = json['companyName'];
    positionName = json['positionName'];
    statusName = json['statusName'];
    serviceName = json['serviceName'];
    finishDate = json['finishDate'];
    workStartDate = json['workStartDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['orderStatus'] = this.orderStatus;
    data['orderNo'] = this.orderNo;
    data['workDaysMode'] = this.workDaysMode;
    data['workDaysModeName'] = this.workDaysModeName;
    data['companyName'] = this.companyName;
    data['positionName'] = this.positionName;
    data['statusName'] = this.statusName;
    data['serviceName'] = this.serviceName;
    data['finishDate'] = this.finishDate;
    data['workStartDate'] = this.workStartDate;
    return data;
  }
}