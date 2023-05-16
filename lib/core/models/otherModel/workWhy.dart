import 'package:json_annotation/json_annotation.dart';

part 'workWhy.g.dart';

@JsonSerializable()
class WorkWhy {
  WorkWhy();

  num? id;
  String? name;
  num? parentId;
  num? status;
  String? typeId;
  String? children;
  
  factory WorkWhy.fromJson(Map<String,dynamic> json) => _$WorkWhyFromJson(json);
  Map<String, dynamic> toJson() => _$WorkWhyToJson(this);
}
