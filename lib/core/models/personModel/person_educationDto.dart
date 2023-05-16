import 'package:json_annotation/json_annotation.dart';

part 'person_educationDto.g.dart';

@JsonSerializable()
class Person_educationDto {
  Person_educationDto();

  num? id;
  num? developerId;
  num? educationId;
  String? collegeName;
  String? major;
  String? inSchoolStartTime;
  String? inSchoolEndTime;
  num? trainingMode;
  String? educationName;
  String? trainingModeName;
  
  factory Person_educationDto.fromJson(Map<String,dynamic> json) => _$Person_educationDtoFromJson(json);
  Map<String, dynamic> toJson() => _$Person_educationDtoToJson(this);
}
