import 'package:json_annotation/json_annotation.dart';

part 'person_workModeDto.g.dart';

@JsonSerializable()
class Person_workModeDto {
  Person_workModeDto();

  num? id;
  num? workDayMode;
  num? developerId;
  num? expectSalary;
  num? lowestSalary;
  num? highestSalary;
  String? hourlyPay;
  String? workDayModeName;
  String? workDayModeDesc;
  
  factory Person_workModeDto.fromJson(Map<String,dynamic> json) => _$Person_workModeDtoFromJson(json);
  Map<String, dynamic> toJson() => _$Person_workModeDtoToJson(this);
}
