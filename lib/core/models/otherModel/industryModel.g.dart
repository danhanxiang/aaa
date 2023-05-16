// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'industryModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IndustryModel _$IndustryModelFromJson(Map<String, dynamic> json) =>
    IndustryModel()
      ..id = json['id'] as num?
      ..name = json['name'] as String?
      ..parentId = json['parentId'] as num?
      ..status = json['status'] as num?
      ..typeId = json['typeId'] as String?
      ..children = (json['children'] as List<dynamic>?)
          ?.map((e) => Industry_typeModel.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$IndustryModelToJson(IndustryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'parentId': instance.parentId,
      'status': instance.status,
      'typeId': instance.typeId,
      'children': instance.children,
    };
