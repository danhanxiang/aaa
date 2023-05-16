import 'package:json_annotation/json_annotation.dart';

part 'login_userInfo.g.dart';

@JsonSerializable()
class Login_userInfo {
  Login_userInfo();

  num? id;
  String? mobile;
  String? nickName;
  String? realName;
  String? createDate;
  num? status;
  String? channel;
  int? typeId;
  num? businessStatus;
  num? sex;
  String? birthday;
  num? provinceId;
  num? cityId;
  num? areasId;
  String? avatarUrl;
  String? lastModifyDate;
  num? remoteWorkReason;
  String? recommend;
  num? careerDirectionId;
  String? careerDirection;
  num? signContractNum;
  double? profitTotal;
  String? contractStatus;
  num? serviceStatus;
  
  factory Login_userInfo.fromJson(Map<String,dynamic> json) => _$Login_userInfoFromJson(json);
  Map<String, dynamic> toJson() => _$Login_userInfoToJson(this);
}
/// 企业端用户信息
class Login_userCompInfo {
  int? id;
  String? mobile;
  String? realName;
  String? position;
  String? avatarUrl;
  int? status;
  int? typeId;

  Login_userCompInfo(
      {this.id,
      this.mobile,
      this.realName,
      this.position,
      this.avatarUrl,
      this.status,
      this.typeId});

  Login_userCompInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mobile = json['mobile'];
    realName = json['realName'];
    position = json['position'];
    avatarUrl = json['avatarUrl'];
    status = json['status'];
    typeId = json['typeId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['mobile'] = this.mobile;
    data['realName'] = this.realName;
    data['position'] = this.position;
    data['avatarUrl'] = this.avatarUrl;
    data['status'] = this.status;
    data['typeId'] = this.typeId;
    return data;
  }
}