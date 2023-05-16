import 'package:people_living_flutterdemo/core/extension/string_extension.dart';

class BillDetailManager {
  int? code;
  String? message;
  BillDetailModel? data;

  BillDetailManager({this.code, this.message, this.data});

  BillDetailManager.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new BillDetailModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class BillDetailModel {
  String? timeStart;
  String? timeEnd;
  String? createDate;
  int? developerId;
  double personalTax = 0.0;
  double actualMoney = 0.0;
  int? orderCounts;
  int? status;
  List<BillOrders> orders = [];

  BillDetailModel(
      {this.timeStart,
      this.timeEnd,
      this.createDate,
      this.developerId,
      // this.personalTax,
      // this.actualMoney,
      this.orderCounts,
      this.status,
      // this.orders
      });

  BillDetailModel.fromJson(Map<String, dynamic> json) {
    timeStart = json['timeStart'];
    timeEnd = json['timeEnd'];
    createDate = json['createDate'];
    developerId = json['developerId'];
    personalTax = json['personalTax'];
    actualMoney = json['actualMoney'];
    orderCounts = json['orderCounts'];
    status = json['status'];
    if (json['orders'] != null) {
      orders = <BillOrders>[];
      json['orders'].forEach((v) {
        orders!.add(new BillOrders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['timeStart'] = this.timeStart;
    data['timeEnd'] = this.timeEnd;
    data['createDate'] = this.createDate;
    data['developerId'] = this.developerId;
    data['personalTax'] = this.personalTax;
    data['actualMoney'] = this.actualMoney;
    data['orderCounts'] = this.orderCounts;
    data['status'] = this.status;
    if (this.orders != null) {
      data['orders'] = this.orders!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  String get getTimeStartAndEnd {
    String start = timeStart ?? '';
    String end = timeEnd ?? '';
    return '${start.toYear}-${start.toMonth}-${start.toDay} - ${end.toYear}-${end.toMonth}-${end.toDay}';
  }
}

class BillOrders {
  int? id;
  String? orderNo;
  Null? companyId;
  Null? developerId;
  Null? developerName;
  Null? checkoutType;
  String? workStartDate;
  String? finishDate;
  String? createDate;
  double? devTotalAmount;
  double serviceMoney = 0.0;
  double totalAmount = 0.0;
  double refundMoney = 0.0;
  double? salary;
  double devSalary = 0.0;
  double actualMoney = 0.0;
  String? refundReason;
  int? days;
  int? orderStatus;

  BillOrders(
      {this.id,
      this.orderNo,
      this.companyId,
      this.developerId,
      this.developerName,
      this.checkoutType,
      this.workStartDate,
      this.finishDate,
      this.createDate,
      this.devTotalAmount,
      // this.serviceMoney,
      // this.totalAmount,
      // this.refundMoney,
      this.salary,
      // this.devSalary,
      // this.actualMoney,
      this.refundReason,
      this.days,
      this.orderStatus});

  BillOrders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderNo = json['orderNo'];
    companyId = json['companyId'];
    developerId = json['developerId'];
    developerName = json['developerName'];
    checkoutType = json['checkoutType'];
    workStartDate = json['workStartDate'];
    finishDate = json['finishDate'];
    createDate = json['createDate'];
    devTotalAmount = json['devTotalAmount'];
    serviceMoney = json['serviceMoney'].runtimeType == Null ? 0.0 : json['serviceMoney'];
    totalAmount = json['totalAmount'];
    refundMoney = json['refundMoney'];
    salary = json['salary'];
    devSalary = json['devSalary'].runtimeType == Null ? 0.0 : json['serviceMoney'];

    actualMoney = json['actualMoney'];
    refundReason = json['refundReason'];
    days = json['days'];
    orderStatus = json['orderStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['orderNo'] = this.orderNo;
    data['companyId'] = this.companyId;
    data['developerId'] = this.developerId;
    data['developerName'] = this.developerName;
    data['checkoutType'] = this.checkoutType;
    data['workStartDate'] = this.workStartDate;
    data['finishDate'] = this.finishDate;
    data['createDate'] = this.createDate;
    data['devTotalAmount'] = this.devTotalAmount;
    data['serviceMoney'] = this.serviceMoney;
    data['totalAmount'] = this.totalAmount;
    data['refundMoney'] = this.refundMoney;
    data['salary'] = this.salary;
    data['devSalary'] = this.devSalary;
    data['actualMoney'] = this.actualMoney;
    data['refundReason'] = this.refundReason;
    data['days'] = this.days;
    data['orderStatus'] = this.orderStatus;
    return data;
  }

  String get serviceDays {
    String start = createDate ?? '';
    String end = workStartDate ?? '';
    return '${start.toYear}-${start.toMonth}-${start.toDay} - ${end.toYear}-${end.toMonth}-${end.toDay}';
  }
}