// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'industry_typeModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Industry_typeModel _$Industry_typeModelFromJson(Map<String, dynamic> json) =>
    Industry_typeModel()
      ..id = json['id'] as num?
      ..name = json['name'] as String?
      ..parentId = json['parentId'] as num?
      ..status = json['status'] as num?
      ..typeId = json['typeId'] as String?
      ..children = json['children'] as String?;

Map<String, dynamic> _$Industry_typeModelToJson(Industry_typeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'parentId': instance.parentId,
      'status': instance.status,
      'typeId': instance.typeId,
      'children': instance.children,
    };
