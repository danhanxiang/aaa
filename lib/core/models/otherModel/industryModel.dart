import 'package:json_annotation/json_annotation.dart';
import "industry_typeModel.dart";
part 'industryModel.g.dart';

@JsonSerializable()
class IndustryModel {
  IndustryModel();

  num? id;
  String? name;
  num? parentId;
  num? status;
  String? typeId;
  List<Industry_typeModel>? children;
  
  factory IndustryModel.fromJson(Map<String,dynamic> json) => _$IndustryModelFromJson(json);
  Map<String, dynamic> toJson() => _$IndustryModelToJson(this);
}
