// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cultivateModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CultivateModel _$CultivateModelFromJson(Map<String, dynamic> json) =>
    CultivateModel()
      ..id = json['id'] as num?
      ..name = json['name'] as String?
      ..parentId = json['parentId'] as num?
      ..status = json['status'] as num?
      ..typeId = json['typeId'] as String?
      ..children = json['children'] as String?;

Map<String, dynamic> _$CultivateModelToJson(CultivateModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'parentId': instance.parentId,
      'status': instance.status,
      'typeId': instance.typeId,
      'children': instance.children,
    };
