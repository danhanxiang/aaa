import 'package:json_annotation/json_annotation.dart';

part 'RecordScrollModel.g.dart';

@JsonSerializable()
class RecordScrollModel {
  RecordScrollModel();

  num? id;
  String? name;
  num? parentId;
  num? status;
  String? typeId;
  String? children;
  
  factory RecordScrollModel.fromJson(Map<String,dynamic> json) => _$RecordScrollModelFromJson(json);
  Map<String, dynamic> toJson() => _$RecordScrollModelToJson(this);
}
