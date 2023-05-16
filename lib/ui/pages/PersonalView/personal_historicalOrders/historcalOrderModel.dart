import 'package:json_annotation/json_annotation.dart';

class HistorcalOrderModel {
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

  String? dateLine;

  HistorcalOrderModel(
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
      this.workStartDate,
      this.dateLine});

  HistorcalOrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderStatus = json['orderStatus'];
    orderNo = json['orderNo'];
    workDaysMode = json['workDaysMode'];
    workDaysModeName = json['workDaysModeName'] ?? '';
    companyName = json['companyName'] ?? '未知公司';
    positionName = json['positionName'] ?? '未知公司';
    statusName = json['statusName'];
    serviceName = json['serviceName'];
    finishDate = json['finishDate'] ?? '';
    workStartDate = json['workStartDate'] ?? '';

    if (finishDate!.length > 10) {
      finishDate = finishDate!.substring(0, 10);
    }
    if (workStartDate!.length > 10) {
      workStartDate = workStartDate!.substring(0, 10);
    }

    dateLine = '$workDaysModeName | $workStartDate - $finishDate';
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
 