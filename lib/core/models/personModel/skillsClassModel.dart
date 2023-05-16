import 'package:json_annotation/json_annotation.dart';

part 'skillsClassModel.g.dart';

@JsonSerializable()
class SkillsClassModel {
  SkillsClassModel();

  num? id;
  String? skillName;
  num? parentId;
  String? children;
  bool? selected;
  
  factory SkillsClassModel.fromJson(Map<String,dynamic> json) => _$SkillsClassModelFromJson(json);
  Map<String, dynamic> toJson() => _$SkillsClassModelToJson(this);
}
