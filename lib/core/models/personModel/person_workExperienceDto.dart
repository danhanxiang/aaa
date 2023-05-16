import 'package:json_annotation/json_annotation.dart';

part 'person_workExperienceDto.g.dart';

@JsonSerializable()
class Person_workExperienceDto {
  Person_workExperienceDto();

  num? id;
  num? developerId;
  String? companyName;
  num? industryId;
  String? positionName;
  String? workStartTime;
  String? workEndTime;
  String? industryName;
  
  factory Person_workExperienceDto.fromJson(Map<String,dynamic> json) => _$Person_workExperienceDtoFromJson(json);
  Map<String, dynamic> toJson() => _$Person_workExperienceDtoToJson(this);
}
