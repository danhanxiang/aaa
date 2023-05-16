// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_userInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Login_userInfo _$Login_userInfoFromJson(Map<String, dynamic> json) =>
    Login_userInfo()
      ..id = json['id'] as num?
      ..mobile = json['mobile'] as String?
      ..nickName = json['nickName'] as String?
      ..realName = json['realName'] as String?
      ..createDate = json['createDate'] as String?
      ..status = json['status'] as num?
      ..channel = json['channel'] as String?
      ..typeId = json['typeId'] as int?
      ..businessStatus = json['businessStatus'] as num?
      ..sex = json['sex'] as num?
      ..birthday = json['birthday'] as String?
      ..provinceId = json['provinceId'] as num?
      ..cityId = json['cityId'] as num?
      ..areasId = json['areasId'] as num?
      ..avatarUrl = json['avatarUrl'] as String?
      ..lastModifyDate = json['lastModifyDate'] as String?
      ..remoteWorkReason = json['remoteWorkReason'] as num?
      ..recommend = json['recommend'] as String?
      ..careerDirectionId = json['careerDirectionId'] as num?
      ..careerDirection = json['careerDirection'] as String?
      ..signContractNum = json['signContractNum'] as num?
      ..profitTotal = json['profitTotal'] as double?
      ..contractStatus = json['contractStatus'] as String?
      ..serviceStatus = json['serviceStatus'] as num?;

Map<String, dynamic> _$Login_userInfoToJson(Login_userInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mobile': instance.mobile,
      'nickName': instance.nickName,
      'realName': instance.realName,
      'createDate': instance.createDate,
      'status': instance.status,
      'channel': instance.channel,
      'typeId': instance.typeId,
      'businessStatus': instance.businessStatus,
      'sex': instance.sex,
      'birthday': instance.birthday,
      'provinceId': instance.provinceId,
      'cityId': instance.cityId,
      'areasId': instance.areasId,
      'avatarUrl': instance.avatarUrl,
      'lastModifyDate': instance.lastModifyDate,
      'remoteWorkReason': instance.remoteWorkReason,
      'recommend': instance.recommend,
      'careerDirectionId': instance.careerDirectionId,
      'careerDirection': instance.careerDirection,
      'signContractNum': instance.signContractNum,
      'profitTotal': instance.profitTotal,
      'contractStatus': instance.contractStatus,
      'serviceStatus': instance.serviceStatus,
    };
