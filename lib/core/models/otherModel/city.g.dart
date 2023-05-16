// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

City _$CityFromJson(Map<String, dynamic> json) => City()
  ..id = json['id'] as num?
  ..regionName = json['regionName'] as String?
  ..regionShortName = json['regionShortName'] as String?
  ..regionCode = json['regionCode'] as String?
  ..parentId = json['parentId'] as num?
  ..regionLevel = json['regionLevel'] as num?
  ..children = (json['children'] as List<dynamic>?)
      ?.map((e) => Town.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'id': instance.id,
      'regionName': instance.regionName,
      'regionShortName': instance.regionShortName,
      'regionCode': instance.regionCode,
      'parentId': instance.parentId,
      'regionLevel': instance.regionLevel,
      'children': instance.children,
    };
