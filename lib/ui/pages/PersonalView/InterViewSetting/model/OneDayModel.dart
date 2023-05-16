class OneDayModel {
  int? code;
  String? message;
  List<DayModel>? data;

  OneDayModel({this.code, this.message, this.data});

  OneDayModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DayModel>[];
      json['data'].forEach((v) {
        data!.add(new DayModel.fromJson(v));
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

class DayModel {
  int? developerId;
  String? scheduleDate;
  int? status;
  String? statusName;

  DayModel({this.developerId, this.scheduleDate, this.status, this.statusName});

  DayModel.fromJson(Map<String, dynamic> json) {
    developerId = json['developerId'];
    scheduleDate = json['scheduleDate'];
    status = json['status'];
    statusName = json['statusName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['developerId'] = this.developerId;
    data['scheduleDate'] = this.scheduleDate;
    data['status'] = this.status;
    data['statusName'] = this.statusName;
    return data;
  }
}