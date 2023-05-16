import 'package:json_annotation/json_annotation.dart';

part 'WorkAgeModel.g.dart';

@JsonSerializable()
class WorkAgeModel {
  WorkAgeModel();

  num? id;
  String? name;
  num? parentId;
  num? status;
  String? typeId;
  String? children;
  
  factory WorkAgeModel.fromJson(Map<String,dynamic> json) => _$WorkAgeModelFromJson(json);
  Map<String, dynamic> toJson() => _$WorkAgeModelToJson(this);
}
