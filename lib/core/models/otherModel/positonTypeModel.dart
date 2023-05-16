import 'package:json_annotation/json_annotation.dart';

part 'positonTypeModel.g.dart';

@JsonSerializable()
class PositonTypeModel {
  PositonTypeModel();

  num? id;
  String? name;
  num? parentId;
  num? status;
  String? typeId;
  String? children;
  
  factory PositonTypeModel.fromJson(Map<String,dynamic> json) => _$PositonTypeModelFromJson(json);
  Map<String, dynamic> toJson() => _$PositonTypeModelToJson(this);
}
