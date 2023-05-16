import 'package:json_annotation/json_annotation.dart';
import "skillsClassModel.dart";
part 'skillsModel.g.dart';

@JsonSerializable()
class SkillsModel {
  SkillsModel();

  num? id;
  String? skillName;
  num? parentId;
  List<SkillsClassModel>? children;
  
  factory SkillsModel.fromJson(Map<String,dynamic> json) => _$SkillsModelFromJson(json);
  Map<String, dynamic> toJson() => _$SkillsModelToJson(this);
}
