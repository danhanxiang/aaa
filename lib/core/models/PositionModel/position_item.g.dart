// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'position_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Position_item _$Position_itemFromJson(Map<String, dynamic> json) =>
    Position_item()
      ..id = json['id'] as num
      ..realName = json['realName'] as String?
      ..mobile = json['mobile'] as String
      ..avatarUrl = json['avatarUrl'] as String?
      ..careerDirectionId = json['careerDirectionId'] as num
      ..careerDirectionName = json['careerDirectionName'] as String?
      ..cityName = json['cityName'] as String?
      ..curSalary = json['curSalary'] as num
      ..workYearsId = json['workYearsId'] as num
      ..workYearsName = json['workYearsName'] as String?
      ..skillName = json['skillName'] as String
      ..expectSalary = json['expectSalary'] as num
      ..workDayMode = json['workDayMode'] as num
      ..workDayModeName = json['workDayModeName'] as String?
      // ..educationId = json['educationId'] as num
      ..educationName = json['educationName'] as String?;

Map<String, dynamic> _$Position_itemToJson(Position_item instance) =>
    <String, dynamic>{
      'id': instance.id,
      'realName': instance.realName,
      'mobile': instance.mobile,
      'avatarUrl': instance.avatarUrl,
      'careerDirectionId': instance.careerDirectionId,
      'careerDirectionName': instance.careerDirectionName,
      'cityName': instance.cityName,
      'curSalary': instance.curSalary,
      'workYearsId': instance.workYearsId,
      'workYearsName': instance.workYearsName,
      'skillName': instance.skillName,
      'expectSalary': instance.expectSalary,
      'workDayMode': instance.workDayMode,
      'workDayModeName': instance.workDayModeName,
      'educationId': instance.educationId,
      'educationName': instance.educationName,
    };
