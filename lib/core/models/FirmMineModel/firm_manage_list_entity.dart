import 'package:people_living_flutterdemo/generated/json/base/json_field.dart';
import 'package:people_living_flutterdemo/generated/json/firm_manage_list_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class FirmManageListEntity {
	FirmManageListData? data;

	FirmManageListEntity();

	factory FirmManageListEntity.fromJson(Map<String, dynamic> json) => $FirmManageListEntityFromJson(json);

	Map<String, dynamic> toJson() => $FirmManageListEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class FirmManageListData {
	int? total;
	int? pageNum;
	List<FirmManageListDataList>? list;

	FirmManageListData();

	factory FirmManageListData.fromJson(Map<String, dynamic> json) => $FirmManageListDataFromJson(json);

	Map<String, dynamic> toJson() => $FirmManageListDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class FirmManageListDataList {
	int? id;
	dynamic realName;
	String? positionName;
	String? mobile;

	FirmManageListDataList();

	factory FirmManageListDataList.fromJson(Map<String, dynamic> json) => $FirmManageListDataListFromJson(json);

	Map<String, dynamic> toJson() => $FirmManageListDataListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}