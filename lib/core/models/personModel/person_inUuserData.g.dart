// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_inUuserData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Person_inUuserData _$Person_inUuserDataFromJson(Map<String, dynamic> json) =>
    Person_inUuserData()
      ..id = json['id'] as num?
      ..mobile = json['mobile'] as String?
      ..nickName = json['nickName'] as String?
      ..realName = json['realName'] as String?
      ..createDate = json['createDate'] as String?
      ..status = json['status'] as num?
      ..serviceStatus = json['serviceStatus'] as num?
      ..serviceStatusName = json['serviceStatusName'] as String?
      ..channel = json['channel'] as String?
      ..typeId = json['typeId'] as num?
      ..businessStatus = json['businessStatus'] as num?
      ..sex = json['sex'] as num?
      ..birthday = json['birthday'] as String?
      ..provinceId = json['provinceId'] as num?
      ..provinceName = json['provinceName'] as String?
      ..cityId = json['cityId'] as num?
      ..cityName = json['cityName'] as String?
      ..areasId = json['areasId'] as num?
      ..areasName = json['areasName'] as String?
      ..avatarUrl = json['avatarUrl'] as String?
      ..lastModifyDate = json['lastModifyDate'] as String?
      ..remoteWorkReason = json['remoteWorkReason'] as num?
      ..remoteWorkReasonStr = json['remoteWorkReasonStr'] as String?
      ..recommend = json['recommend'] as String?
      ..coverUrl = json['coverUrl'] as String?
      ..interviewStatus = json['interviewStatus'] as String?
      ..interviewStatusName = json['interviewStatusName'] as String?
      ..contractStatus = json['contractStatus'] as String?
      ..ssoMemberId = json['ssoMemberId'] as num?
      ..recommendReason = json['recommendReason'] as String?
      ..careerDto = json['careerDto'] == null
          ? null
          : Person_careerDto.fromJson(json['careerDto'] as Map<String, dynamic>)
      ..educationDtoList = (json['educationDtoList'] as List<dynamic>?)
          ?.map((e) => Person_educationDto.fromJson(e as Map<String, dynamic>))
          .toList()
      ..workModeDtoList = (json['workModeDtoList'] as List<dynamic>?)
          ?.map((e) => Person_workModeDto.fromJson(e as Map<String, dynamic>))
          .toList()
      ..projectDtoList = (json['projectDtoList'] as List<dynamic>?)
          ?.map((e) => Person_projectDto.fromJson(e as Map<String, dynamic>))
          .toList()
      ..workExperienceDtoList =
          (json['workExperienceDtoList'] as List<dynamic>?)
              ?.map((e) =>
                  Person_workExperienceDto.fromJson(e as Map<String, dynamic>))
              .toList();

Map<String, dynamic> _$Person_inUuserDataToJson(Person_inUuserData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mobile': instance.mobile,
      'nickName': instance.nickName,
      'realName': instance.realName,
      'createDate': instance.createDate,
      'status': instance.status,
      'serviceStatus': instance.serviceStatus,
      'serviceStatusName': instance.serviceStatusName,
      'channel': instance.channel,
      'typeId': instance.typeId,
      'businessStatus': instance.businessStatus,
      'sex': instance.sex,
      'birthday': instance.birthday,
      'provinceId': instance.provinceId,
      'provinceName': instance.provinceName,
      'cityId': instance.cityId,
      'cityName': instance.cityName,
      'areasId': instance.areasId,
      'areasName': instance.areasName,
      'avatarUrl': instance.avatarUrl,
      'lastModifyDate': instance.lastModifyDate,
      'remoteWorkReason': instance.remoteWorkReason,
      'remoteWorkReasonStr': instance.remoteWorkReasonStr,
      'recommend': instance.recommend,
      'coverUrl': instance.coverUrl,
      'interviewStatus': instance.interviewStatus,
      'interviewStatusName': instance.interviewStatusName,
      'contractStatus': instance.contractStatus,
      'ssoMemberId': instance.ssoMemberId,
      'recommendReason': instance.recommendReason,
      'careerDto': instance.careerDto,
      'educationDtoList': instance.educationDtoList,
      'workModeDtoList': instance.workModeDtoList,
      'projectDtoList': instance.projectDtoList,
      'workExperienceDtoList': instance.workExperienceDtoList,
    };
