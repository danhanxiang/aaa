import 'package:json_annotation/json_annotation.dart';

part 'cultivateModel.g.dart';

@JsonSerializable()
class CultivateModel {
  CultivateModel();

  num? id;
  String? name;
  num? parentId;
  num? status;
  String? typeId;
  String? children;
  
  factory CultivateModel.fromJson(Map<String,dynamic> json) => _$CultivateModelFromJson(json);
  Map<String, dynamic> toJson() => _$CultivateModelToJson(this);
}
