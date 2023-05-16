import 'package:people_living_flutterdemo/generated/json/base/json_field.dart';
import 'package:people_living_flutterdemo/generated/json/audition_item_list_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class AuditionItemListEntity {
	int? code;
	String? message;
	AuditionItemListData? data;

	AuditionItemListEntity();

	factory AuditionItemListEntity.fromJson(Map<String, dynamic> json) => $AuditionItemListEntityFromJson(json);

	Map<String, dynamic> toJson() => $AuditionItemListEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AuditionItemListData {
	int? total;
	int? pageNum;
	List<AuditionItemListDataList>? list;

	AuditionItemListData();

	factory AuditionItemListData.fromJson(Map<String, dynamic> json) => $AuditionItemListDataFromJson(json);

	Map<String, dynamic> toJson() => $AuditionItemListDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AuditionItemListDataList {
	int? developerId;
	int? positionId;
	int? interviewId;
	String? interviewStartDate;
	String? interviewEndDate;
	String? realName;
	String? title;
	int? meetingCode;
	String? meetingUrl;
	String? dayType;
	String? developerName;
	String? positionName;

	AuditionItemListDataList();

	factory AuditionItemListDataList.fromJson(Map<String, dynamic> json) => $AuditionItemListDataListFromJson(json);

	Map<String, dynamic> toJson() => $AuditionItemListDataListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}