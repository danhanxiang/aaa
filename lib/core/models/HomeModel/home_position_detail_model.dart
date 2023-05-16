import 'package:json_annotation/json_annotation.dart';

part 'home_position_detail_model.g.dart';

@JsonSerializable()
class Home_position_detail_model {
  Home_position_detail_model();

  num? positionId;
  String? title;
  String? workDaysModeName;
  num? startPay;
  num? endPay;
  num? recruitCount;
  String? workYearsName;
  String? educationName;
  List? skillNames;
  String? description;
  String? companyName;
  String? companyIndustryName;
  String? companyPersonSizeName;
  List? companyTeamToolsDescNames;
  bool? selfRecommendStatus;
  
  factory Home_position_detail_model.fromJson(Map<String,dynamic> json) => _$Home_position_detail_modelFromJson(json);
  Map<String, dynamic> toJson() => _$Home_position_detail_modelToJson(this);
}
