import 'package:json_annotation/json_annotation.dart';

part 'town.g.dart';

@JsonSerializable()
class Town {
  Town();

  num? id;
  String? regionName;
  String? regionShortName;
  String? regionCode;
  num? parentId;
  num? regionLevel;
  String? children;
  
  factory Town.fromJson(Map<String,dynamic> json) => _$TownFromJson(json);
  Map<String, dynamic> toJson() => _$TownToJson(this);
}
