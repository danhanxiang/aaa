import 'package:people_living_flutterdemo/generated/json/base/json_field.dart';
import 'package:people_living_flutterdemo/generated/json/collect_status_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class CollectStatusEntity {
	late bool data;

	CollectStatusEntity();

	factory CollectStatusEntity.fromJson(Map<String, dynamic> json) => $CollectStatusEntityFromJson(json);

	Map<String, dynamic> toJson() => $CollectStatusEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}