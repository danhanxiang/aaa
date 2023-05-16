// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_workExperienceDto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Person_workExperienceDto _$Person_workExperienceDtoFromJson(
        Map<String, dynamic> json) =>
    Person_workExperienceDto()
      ..id = json['id'] as num?
      ..developerId = json['developerId'] as num?
      ..companyName = json['companyName'] as String?
      ..industryId = json['industryId'] as num?
      ..positionName = json['positionName'] as String?
      ..workStartTime = json['workStartTime'] as String?
      ..workEndTime = json['workEndTime'] as String?
      ..industryName = json['industryName'] as String?;

Map<String, dynamic> _$Person_workExperienceDtoToJson(
        Person_workExperienceDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'developerId': instance.developerId,
      'companyName': instance.companyName,
      'industryId': instance.industryId,
      'positionName': instance.positionName,
      'workStartTime': instance.workStartTime,
      'workEndTime': instance.workEndTime,
      'industryName': instance.industryName,
    };
