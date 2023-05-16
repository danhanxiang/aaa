// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_position_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Home_position_detail_model _$Home_position_detail_modelFromJson(
        Map<String, dynamic> json) =>
    Home_position_detail_model()
      ..positionId = json['positionId'] as num?
      ..title = json['title'] as String?
      ..workDaysModeName = json['workDaysModeName'] as String?
      ..startPay = json['startPay'] as num?
      ..endPay = json['endPay'] as num?
      ..recruitCount = json['recruitCount'] as num?
      ..workYearsName = json['workYearsName'] as String?
      ..educationName = json['educationName'] as String?
      ..skillNames = json['skillNames'] as List<dynamic>?
      ..description = json['description'] as String?
      ..companyName = json['companyName'] as String?
      ..companyIndustryName = json['companyIndustryName'] as String?
      ..companyPersonSizeName = json['companyPersonSizeName'] as String?
      ..companyTeamToolsDescNames =
          json['companyTeamToolsDescNames'] as List<dynamic>?
      ..selfRecommendStatus = json['selfRecommendStatus'] as bool?;

Map<String, dynamic> _$Home_position_detail_modelToJson(
        Home_position_detail_model instance) =>
    <String, dynamic>{
      'positionId': instance.positionId,
      'title': instance.title,
      'workDaysModeName': instance.workDaysModeName,
      'startPay': instance.startPay,
      'endPay': instance.endPay,
      'recruitCount': instance.recruitCount,
      'workYearsName': instance.workYearsName,
      'educationName': instance.educationName,
      'skillNames': instance.skillNames,
      'description': instance.description,
      'companyName': instance.companyName,
      'companyIndustryName': instance.companyIndustryName,
      'companyPersonSizeName': instance.companyPersonSizeName,
      'companyTeamToolsDescNames': instance.companyTeamToolsDescNames,
      'selfRecommendStatus': instance.selfRecommendStatus,
    };
