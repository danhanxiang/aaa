import 'package:json_annotation/json_annotation.dart';
import "skillsClassModel.dart";
part 'person_projectDto.g.dart';

@JsonSerializable()
class Person_projectDto {
  Person_projectDto();

  num? id;
  num? developerId;
  String? projectName;
  String? projectStartDate;
  String? projectEndDate;
  String? position;
  num? industryId;
  num? workMode;
  String? description;
  String? companyName;
  String? workModeName;
  List<SkillsClassModel>? projectSkillList;
  String? industryName;
  
  factory Person_projectDto.fromJson(Map<String,dynamic> json) => _$Person_projectDtoFromJson(json);
  Map<String, dynamic> toJson() => _$Person_projectDtoToJson(this);
}
