import 'package:json_annotation/json_annotation.dart';

part 'person_careerDto.g.dart';

@JsonSerializable()
class Person_careerDto {
  Person_careerDto();

  num? id;
  num? workYearsId;
  num? curSalary;
  num? developerId;
  num? careerDirectionId;
  String? careerDirectionName;
  String? workYearsName;
  
  factory Person_careerDto.fromJson(Map<String,dynamic> json) => _$Person_careerDtoFromJson(json);
  Map<String, dynamic> toJson() => _$Person_careerDtoToJson(this);
}
