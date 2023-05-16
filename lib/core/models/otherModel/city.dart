import 'package:json_annotation/json_annotation.dart';
import "town.dart";
part 'city.g.dart';

@JsonSerializable()
class City {
  City();

  num? id;
  String? regionName;
  String? regionShortName;
  String? regionCode;
  num? parentId;
  num? regionLevel;
  List<Town>? children;
  
  factory City.fromJson(Map<String,dynamic> json) => _$CityFromJson(json);
  Map<String, dynamic> toJson() => _$CityToJson(this);
}
