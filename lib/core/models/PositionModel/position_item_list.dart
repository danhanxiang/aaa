import 'package:json_annotation/json_annotation.dart';
import "position_item.dart";
part 'position_item_list.g.dart';

@JsonSerializable()
class Position_item_list {
  Position_item_list();

  late num total;
  late num pageNum;
  List<Position_item>? list;
  
  factory Position_item_list.fromJson(Map<String,dynamic> json) => _$Position_item_listFromJson(json);
  Map<String, dynamic> toJson() => _$Position_item_listToJson(this);
}
