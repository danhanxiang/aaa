import 'package:json_annotation/json_annotation.dart';
import "person_careerDto.dart";
import "person_educationDto.dart";
import "person_workModeDto.dart";
import "person_projectDto.dart";
import "person_workExperienceDto.dart";
part 'person_inUuserData.g.dart';

@JsonSerializable()
class Person_inUuserData {
  Person_inUuserData();

  num? id;
  String? mobile;
  String? nickName;
  String? realName;
  String? createDate;
  num? status;
  num? serviceStatus;
  String? serviceStatusName;
  String? channel;
  num? typeId;
  num? businessStatus;
  num? sex;
  String? birthday;
  num? provinceId;
  String? provinceName;
  num? cityId;
  String? cityName;
  num? areasId;
  String? areasName;
  String? avatarUrl;
  String? lastModifyDate;
  num? remoteWorkReason;
  String? remoteWorkReasonStr;
  String? recommend;
  String? coverUrl;
  String? interviewStatus;
  String? interviewStatusName;
  String? contractStatus;
  num? ssoMemberId;
  String? recommendReason;
  Person_careerDto? careerDto;
  List<Person_educationDto>? educationDtoList;
  List<Person_workModeDto>? workModeDtoList;
  List<Person_projectDto>? projectDtoList;
  List<Person_workExperienceDto>? workExperienceDtoList;
  
  factory Person_inUuserData.fromJson(Map<String,dynamic> json) => _$Person_inUuserDataFromJson(json);
  Map<String, dynamic> toJson() => _$Person_inUuserDataToJson(this);

  /// 是否显示提交审核按钮
  bool isShowStatusBtn(){
    return status == 1 || status == 4;
  }
}
