// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Province.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Province _$ProvinceFromJson(Map<String, dynamic> json) => Province()
  ..id = json['id'] as num?
  ..regionName = json['regionName'] as String?
  ..regionShortName = json['regionShortName'] as String?
  ..regionCode = json['regionCode'] as String?
  ..parentId = json['parentId'] as String?
  ..regionLevel = json['regionLevel'] as num?
  ..children = (json['children'] as List<dynamic>?)
      ?.map((e) => City.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$ProvinceToJson(Province instance) => <String, dynamic>{
      'id': instance.id,
      'regionName': instance.regionName,
      'regionShortName': instance.regionShortName,
      'regionCode': instance.regionCode,
      'parentId': instance.parentId,
      'regionLevel': instance.regionLevel,
      'children': instance.children,
    };
