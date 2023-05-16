// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_positionListModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Home_positionListModel _$Home_positionListModelFromJson(
        Map<String, dynamic> json) =>
    Home_positionListModel()
      ..positionId = json['positionId'] as num
      ..title = json['title'] as String
      ..workDaysModeName = json['workDaysModeName'] as String
      ..startPay = json['startPay'] as num
      ..endPay = json['endPay'] as num
      ..educationName = json['educationName'] as String
      ..workYearsName = json['workYearsName'] as String
      ..skillNames = json['skillNames'] as List<dynamic>
      ..description = json['description'] as String
      ..companyName = json['companyName'] as String
      ..companyRecruiterRealName = json['companyRecruiterRealName'] as String
      ..companyRecruiterPosition = json['companyRecruiterPosition'] as String
      ..selfRecommendStatus = json['selfRecommendStatus'] as bool
      ..recommendByOperate = json['recommendByOperate'] as bool;

Map<String, dynamic> _$Home_positionListModelToJson(
        Home_positionListModel instance) =>
    <String, dynamic>{
      'positionId': instance.positionId,
      'title': instance.title,
      'workDaysModeName': instance.workDaysModeName,
      'startPay': instance.startPay,
      'endPay': instance.endPay,
      'educationName': instance.educationName,
      'workYearsName': instance.workYearsName,
      'skillNames': instance.skillNames,
      'description': instance.description,
      'companyName': instance.companyName,
      'companyRecruiterRealName': instance.companyRecruiterRealName,
      'companyRecruiterPosition': instance.companyRecruiterPosition,
      'selfRecommendStatus': instance.selfRecommendStatus,
      'recommendByOperate': instance.recommendByOperate,
    };
