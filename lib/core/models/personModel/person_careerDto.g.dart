// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_careerDto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Person_careerDto _$Person_careerDtoFromJson(Map<String, dynamic> json) =>
    Person_careerDto()
      ..id = json['id'] as num?
      ..workYearsId = json['workYearsId'] as num?
      ..curSalary = json['curSalary'] as num?
      ..developerId = json['developerId'] as num?
      ..careerDirectionId = json['careerDirectionId'] as num?
      ..careerDirectionName = json['careerDirectionName'] as String?
      ..workYearsName = json['workYearsName'] as String?;

Map<String, dynamic> _$Person_careerDtoToJson(Person_careerDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'workYearsId': instance.workYearsId,
      'curSalary': instance.curSalary,
      'developerId': instance.developerId,
      'careerDirectionId': instance.careerDirectionId,
      'careerDirectionName': instance.careerDirectionName,
      'workYearsName': instance.workYearsName,
    };
