import 'package:people_living_flutterdemo/generated/json/base/json_field.dart';
import 'package:people_living_flutterdemo/generated/json/treaty_order_list_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class TreatyOrderListEntity {
	TreatyOrderListData? data;

	TreatyOrderListEntity();

	factory TreatyOrderListEntity.fromJson(Map<String, dynamic> json) => $TreatyOrderListEntityFromJson(json);

	Map<String, dynamic> toJson() => $TreatyOrderListEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class TreatyOrderListData {
	int? total;
	int? pageNum;
	List<TreatyOrderListDataList>? list;

	TreatyOrderListData();

	factory TreatyOrderListData.fromJson(Map<String, dynamic> json) => $TreatyOrderListDataFromJson(json);

	Map<String, dynamic> toJson() => $TreatyOrderListDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class TreatyOrderListDataList {
	int? id;
	String? orderNo;
	int? orderStatus;
	String? orderStatusName;
	String? workStartDate;
	String? realName;
	String? workDaysModeName;
	String? careerDirectionName;

	TreatyOrderListDataList();

	factory TreatyOrderListDataList.fromJson(Map<String, dynamic> json) => $TreatyOrderListDataListFromJson(json);

	Map<String, dynamic> toJson() => $TreatyOrderListDataListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}