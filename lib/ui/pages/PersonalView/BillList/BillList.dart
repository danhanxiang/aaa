class BillManagerModel {
  int? code;
  String? message;
  DataPar? data;

  BillManagerModel({this.code, this.message, this.data});

  BillManagerModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new DataPar.fromJson(json['data']) : null;
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

class DataPar {
  int? total;
  int? pageNum;
  List<Bill>? list;

  DataPar({this.total, this.pageNum, this.list});

  DataPar.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    pageNum = json['pageNum'];
    if (json['list'] != null) {
      list = <Bill>[];
      json['list'].forEach((v) {
        list!.add(new Bill.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['pageNum'] = this.pageNum;
    if (this.list != null) {
      data['list'] = this.list!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Bill {
  int? id;
  String? orderId;
  int? developerId;
  double serviceMoney = 0.0;
  double deductMoney = 0.0;
  double personalTax = 0.0;
  double actualMoney = 0.0;
  String? createDate;
  int? status;
  String? grantDate;

  Bill(
      {this.id,
      this.orderId,
      this.developerId,
      // this.serviceMoney = 0.0,
      // this.deductMoney,
      // this.personalTax,
      // this.actualMoney,
      this.createDate,
      this.status,
      this.grantDate});

  Bill.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['orderId'];
    developerId = json['developerId'];
    serviceMoney = json['serviceMoney'];
    deductMoney = json['deductMoney'];
    personalTax = json['personalTax'];
    actualMoney = json['actualMoney'];
    createDate = json['createDate'];
    status = json['status'];
    grantDate = json['grantDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['orderId'] = this.orderId;
    data['developerId'] = this.developerId;
    data['serviceMoney'] = this.serviceMoney;
    data['deductMoney'] = this.deductMoney;
    data['personalTax'] = this.personalTax;
    data['actualMoney'] = this.actualMoney;
    data['createDate'] = this.createDate;
    data['status'] = this.status;
    data['grantDate'] = this.grantDate;
    return data;
  }
}