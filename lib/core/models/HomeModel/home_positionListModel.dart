import 'package:json_annotation/json_annotation.dart';

part 'home_positionListModel.g.dart';

@JsonSerializable()
class Home_positionListModel {
  Home_positionListModel();

  late num positionId;
  late String title;
  late String workDaysModeName;
  late num startPay;
  late num endPay;
  late String educationName;
  late String workYearsName;
  late List skillNames;
  late String description;
  late String companyName;
  late String companyRecruiterRealName;
  late String companyRecruiterPosition;
  late bool selfRecommendStatus;
  late bool recommendByOperate;
  
  factory Home_positionListModel.fromJson(Map<String,dynamic> json) => _$Home_positionListModelFromJson(json);
  Map<String, dynamic> toJson() => _$Home_positionListModelToJson(this);
}
