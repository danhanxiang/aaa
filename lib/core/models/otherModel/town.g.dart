// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'town.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Town _$TownFromJson(Map<String, dynamic> json) => Town()
  ..id = json['id'] as num?
  ..regionName = json['regionName'] as String?
  ..regionShortName = json['regionShortName'] as String?
  ..regionCode = json['regionCode'] as String?
  ..parentId = json['parentId'] as num?
  ..regionLevel = json['regionLevel'] as num?
  ..children = json['children'] as String?;

Map<String, dynamic> _$TownToJson(Town instance) => <String, dynamic>{
      'id': instance.id,
      'regionName': instance.regionName,
      'regionShortName': instance.regionShortName,
      'regionCode': instance.regionCode,
      'parentId': instance.parentId,
      'regionLevel': instance.regionLevel,
      'children': instance.children,
    };
