// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skillsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SkillsModel _$SkillsModelFromJson(Map<String, dynamic> json) => SkillsModel()
  ..id = json['id'] as num?
  ..skillName = json['skillName'] as String?
  ..parentId = json['parentId'] as num?
  ..children = (json['children'] as List<dynamic>?)
      ?.map((e) => SkillsClassModel.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$SkillsModelToJson(SkillsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'skillName': instance.skillName,
      'parentId': instance.parentId,
      'children': instance.children,
    };
