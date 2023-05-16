// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_projectDto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Person_projectDto _$Person_projectDtoFromJson(Map<String, dynamic> json) =>
    Person_projectDto()
      ..id = json['id'] as num?
      ..developerId = json['developerId'] as num?
      ..projectName = json['projectName'] as String?
      ..projectStartDate = json['projectStartDate'] as String?
      ..projectEndDate = json['projectEndDate'] as String?
      ..position = json['position'] as String?
      ..industryId = json['industryId'] as num?
      ..workMode = json['workMode'] as num?
      ..description = json['description'] as String?
      ..companyName = json['companyName'] as String?
      ..workModeName = json['workModeName'] as String?
      ..projectSkillList = (json['projectSkillList'] as List<dynamic>?)
          ?.map((e) => SkillsClassModel.fromJson(e as Map<String, dynamic>))
          .toList()
      ..industryName = json['industryName'] as String?;

Map<String, dynamic> _$Person_projectDtoToJson(Person_projectDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'developerId': instance.developerId,
      'projectName': instance.projectName,
      'projectStartDate': instance.projectStartDate,
      'projectEndDate': instance.projectEndDate,
      'position': instance.position,
      'industryId': instance.industryId,
      'workMode': instance.workMode,
      'description': instance.description,
      'companyName': instance.companyName,
      'workModeName': instance.workModeName,
      'projectSkillList': instance.projectSkillList,
      'industryName': instance.industryName,
    };
