// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_workModeDto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Person_workModeDto _$Person_workModeDtoFromJson(Map<String, dynamic> json) =>
    Person_workModeDto()
      ..id = json['id'] as num?
      ..workDayMode = json['workDayMode'] as num?
      ..developerId = json['developerId'] as num?
      ..expectSalary = json['expectSalary'] as num?
      ..lowestSalary = json['lowestSalary'] as num?
      ..highestSalary = json['highestSalary'] as num?
      ..hourlyPay = json['hourlyPay'] as String?
      ..workDayModeName = json['workDayModeName'] as String?
      ..workDayModeDesc = json['workDayModeDesc'] as String?;

Map<String, dynamic> _$Person_workModeDtoToJson(Person_workModeDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'workDayMode': instance.workDayMode,
      'developerId': instance.developerId,
      'expectSalary': instance.expectSalary,
      'lowestSalary': instance.lowestSalary,
      'highestSalary': instance.highestSalary,
      'hourlyPay': instance.hourlyPay,
      'workDayModeName': instance.workDayModeName,
      'workDayModeDesc': instance.workDayModeDesc,
    };
