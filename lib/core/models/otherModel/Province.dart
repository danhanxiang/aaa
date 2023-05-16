import 'package:json_annotation/json_annotation.dart';
import "city.dart";
part 'Province.g.dart';

@JsonSerializable()
class Province {
  Province();

  num? id;
  String? regionName;
  String? regionShortName;
  String? regionCode;
  String? parentId;
  num? regionLevel;
  List<City>? children;
  
  factory Province.fromJson(Map<String,dynamic> json) => _$ProvinceFromJson(json);
  Map<String, dynamic> toJson() => _$ProvinceToJson(this);
}
