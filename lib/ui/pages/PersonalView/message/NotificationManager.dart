/// 开发者端消息
class NotificationManager {
  int? total;
  int? pageNum;
  List<NotificationModel>? list;

  NotificationManager({this.total, this.pageNum, this.list});

  NotificationManager.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    pageNum = json['pageNum'];
    if (json['list'] != null) {
      list = <NotificationModel>[];
      json['list'].forEach((v) {
        list!.add(new NotificationModel.fromJson(v));
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

class NotificationModel {
  int? id;
  int? developerId;
  int? messageType;
  int? typeId;
  String? messageStr;
  String? createTime;
  String? sendTime;
  int? isRead;

  String get messageTypeTitle {
    switch (messageType) {
      case 2: return "面试详情"; // 面试邀约
      case 3: return "面试详情"; // 面试提醒
      case 4: return ""; // 面试取消
      case 5: return "查看职位"; // 入驻通过
      case 6: return "去修改";
      default: return "";
    }
  }

  NotificationModel(
      {this.id,
      this.developerId,
      this.messageType,
      this.typeId,
      this.messageStr,
      this.createTime,
      this.sendTime,
      this.isRead});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    developerId = json['developerId'];
    messageType = json['messageType'];
    typeId = json['typeId'];
    messageStr = json['messageStr'];
    createTime = json['createTime'];
    sendTime = json['sendTime'];
    isRead = json['isRead'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['developerId'] = this.developerId;
    data['messageType'] = this.messageType;
    data['typeId'] = this.typeId;
    data['messageStr'] = this.messageStr;
    data['createTime'] = this.createTime;
    data['sendTime'] = this.sendTime;
    data['isRead'] = this.isRead;
    return data;
  }
}


/// 企业端小心
class CompNotificationManager {
  int? total;
  int? pageNum;
  List<CompNotification>? list;

  CompNotificationManager({this.total, this.pageNum, this.list});

  CompNotificationManager.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    pageNum = json['pageNum'];
    if (json['list'] != null) {
      list = <CompNotification>[];
      json['list'].forEach((v) {
        list!.add(new CompNotification.fromJson(v));
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

class CompNotification {
  int? id;
  int? companyRecruiterId;
  int? messageType;
  int? typeId;
  String? messageStr;
  String? createTime;
  String? sendTime;
  int? isRead;

  CompNotification(
      {this.id,
      this.companyRecruiterId,
      this.messageType,
      this.typeId,
      this.messageStr,
      this.createTime,
      this.sendTime,
      this.isRead});

  CompNotification.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyRecruiterId = json['companyRecruiterId'];
    messageType = json['messageType'];
    typeId = json['typeId'];
    messageStr = json['messageStr'];
    createTime = json['createTime'];
    sendTime = json['sendTime'];
    isRead = json['isRead'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['companyRecruiterId'] = this.companyRecruiterId;
    data['messageType'] = this.messageType;
    data['typeId'] = this.typeId;
    data['messageStr'] = this.messageStr;
    data['createTime'] = this.createTime;
    data['sendTime'] = this.sendTime;
    data['isRead'] = this.isRead;
    return data;
  }

  String get messageTypeTitle {
    switch (messageType) {
      case 7: return "去面试";
      default: return "";
    }
  }
}