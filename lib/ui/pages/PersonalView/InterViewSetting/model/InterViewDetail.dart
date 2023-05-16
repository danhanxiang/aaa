class InterViewDetail {
  int? id;
  String? companyName;
  int? workDayMode;
  String? workDaysModeName;
  int? interviewWayId;
  String? interviewWayName;
  String? positionName;
  String? interviewStartDate;
  String? interviewEndDate;
  String? meetingCode;
  String? meetingUrl;
  String? offlineAddress;
  String? developerMobile;
  String? developerName;
  String? recruiterMobile;

  InterViewDetail(
      {this.id,
      this.companyName,
      this.workDayMode,
      this.workDaysModeName,
      this.interviewWayId,
      this.interviewWayName,
      this.positionName,
      this.interviewStartDate,
      this.interviewEndDate,
      this.meetingCode,
      this.meetingUrl,
      this.offlineAddress,
      this.developerMobile,
      this.developerName,
      this.recruiterMobile});

  InterViewDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyName = json['companyName'];
    workDayMode = json['workDayMode'];
    workDaysModeName = json['workDaysModeName'];
    interviewWayId = json['interviewWayId'];
    interviewWayName = json['interviewWayName'];
    positionName = json['positionName'];
    interviewStartDate = json['interviewStartDate'];
    interviewEndDate = json['interviewEndDate'];
    meetingCode = json['meetingCode'];
    meetingUrl = json['meetingUrl'];
    offlineAddress = json['offlineAddress'];
    developerMobile = json['developerMobile'];
    developerName = json['developerName'];
    recruiterMobile = json['recruiterMobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['companyName'] = this.companyName;
    data['workDayMode'] = this.workDayMode;
    data['workDaysModeName'] = this.workDaysModeName;
    data['interviewWayId'] = this.interviewWayId;
    data['interviewWayName'] = this.interviewWayName;
    data['positionName'] = this.positionName;
    data['interviewStartDate'] = this.interviewStartDate;
    data['interviewEndDate'] = this.interviewEndDate;
    data['meetingCode'] = this.meetingCode;
    data['meetingUrl'] = this.meetingUrl;
    data['offlineAddress'] = this.offlineAddress;
    data['developerMobile'] = this.developerMobile;
    data['developerName'] = this.developerName;
    data['recruiterMobile'] = this.recruiterMobile;
    return data;
  }
}