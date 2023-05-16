// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skillsClassModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SkillsClassModel _$SkillsClassModelFromJson(Map<String, dynamic> json) =>
    SkillsClassModel()
      ..id = json['id'] as num?
      ..skillName = json['skillName'] as String?
      ..parentId = json['parentId'] as num?
      ..children = json['children'] as String?
      ..selected = json['selected'] as bool?;

Map<String, dynamic> _$SkillsClassModelToJson(SkillsClassModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'skillName': instance.skillName,
      'parentId': instance.parentId,
      'children': instance.children,
      'selected': instance.selected,
    };
