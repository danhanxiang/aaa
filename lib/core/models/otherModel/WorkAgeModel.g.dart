// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'WorkAgeModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkAgeModel _$WorkAgeModelFromJson(Map<String, dynamic> json) => WorkAgeModel()
  ..id = json['id'] as num?
  ..name = json['name'] as String?
  ..parentId = json['parentId'] as num?
  ..status = json['status'] as num?
  ..typeId = json['typeId'] as String?
  ..children = json['children'] as String?;

Map<String, dynamic> _$WorkAgeModelToJson(WorkAgeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'parentId': instance.parentId,
      'status': instance.status,
      'typeId': instance.typeId,
      'children': instance.children,
    };
