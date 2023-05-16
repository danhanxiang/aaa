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
  String? typeId;
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
  num? profitTotal;
  String? contractStatus;
  num? serviceStatus;
  
  factory Login_userInfo.fromJson(Map<String,dynamic> json) => _$Login_userInfoFromJson(json);
  Map<String, dynamic> toJson() => _$Login_userInfoToJson(this);
}
