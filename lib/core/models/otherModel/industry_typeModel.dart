import 'package:json_annotation/json_annotation.dart';

part 'industry_typeModel.g.dart';

@JsonSerializable()
class Industry_typeModel {
  Industry_typeModel();

  num? id;
  String? name;
  num? parentId;
  num? status;
  String? typeId;
  String? children;
  
  factory Industry_typeModel.fromJson(Map<String,dynamic> json) => _$Industry_typeModelFromJson(json);
  Map<String, dynamic> toJson() => _$Industry_typeModelToJson(this);
}
