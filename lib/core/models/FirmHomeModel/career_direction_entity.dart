import 'package:people_living_flutterdemo/generated/json/base/json_field.dart';
import 'package:people_living_flutterdemo/generated/json/career_direction_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class CareerDirectionEntity {
	List<CareerDirectionData>? data;

	CareerDirectionEntity();

	factory CareerDirectionEntity.fromJson(Map<String, dynamic> json) => $CareerDirectionEntityFromJson(json);

	Map<String, dynamic> toJson() => $CareerDirectionEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class CareerDirectionData {
	List<CareerDirectionDataChildren>? children;
	int? id;
	String? name;
	int? parentId;
	String value='';
	String text='';


	CareerDirectionData();

	factory CareerDirectionData.fromJson(Map<String, dynamic> json) => $CareerDirectionDataFromJson(json);

	Map<String, dynamic> toJson() => $CareerDirectionDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class CareerDirectionDataChildren {
	List<CareerDirectionDataChildrenChildren>? children;
	int? id;
	String? name;
	int? parentId;

	CareerDirectionDataChildren();

	factory CareerDirectionDataChildren.fromJson(Map<String, dynamic> json) => $CareerDirectionDataChildrenFromJson(json);

	Map<String, dynamic> toJson() => $CareerDirectionDataChildrenToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class CareerDirectionDataChildrenChildren {
	dynamic children;
	int? id;
	String? name;
	int? parentId;

	CareerDirectionDataChildrenChildren();

	factory CareerDirectionDataChildrenChildren.fromJson(Map<String, dynamic> json) => $CareerDirectionDataChildrenChildrenFromJson(json);

	Map<String, dynamic> toJson() => $CareerDirectionDataChildrenChildrenToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}