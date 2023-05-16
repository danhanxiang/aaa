// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_educationDto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Person_educationDto _$Person_educationDtoFromJson(Map<String, dynamic> json) =>
    Person_educationDto()
      ..id = json['id'] as num?
      ..developerId = json['developerId'] as num?
      ..educationId = json['educationId'] as num?
      ..collegeName = json['collegeName'] as String?
      ..major = json['major'] as String?
      ..inSchoolStartTime = json['inSchoolStartTime'] as String?
      ..inSchoolEndTime = json['inSchoolEndTime'] as String?
      ..trainingMode = json['trainingMode'] as num?
      ..educationName = json['educationName'] as String?
      ..trainingModeName = json['trainingModeName'] as String?;

Map<String, dynamic> _$Person_educationDtoToJson(
        Person_educationDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'developerId': instance.developerId,
      'educationId': instance.educationId,
      'collegeName': instance.collegeName,
      'major': instance.major,
      'inSchoolStartTime': instance.inSchoolStartTime,
      'inSchoolEndTime': instance.inSchoolEndTime,
      'trainingMode': instance.trainingMode,
      'educationName': instance.educationName,
      'trainingModeName': instance.trainingModeName,
    };
