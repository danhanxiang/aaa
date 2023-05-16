import 'package:json_annotation/json_annotation.dart';

part 'position_item.g.dart';

@JsonSerializable()
class Position_item {
  Position_item();

  late num id;
  String? realName;
  late String mobile;
  String? avatarUrl;
  late num careerDirectionId;
  String? careerDirectionName;
  String? cityName;
  late num curSalary;
  late num workYearsId;
  String? workYearsName;
  late String skillName;
  late num expectSalary;
  late num workDayMode;
  String? workDayModeName;
  late num educationId;
  String? educationName;
  
  factory Position_item.fromJson(Map<String,dynamic> json) => _$Position_itemFromJson(json);
  Map<String, dynamic> toJson() => _$Position_itemToJson(this);
}
