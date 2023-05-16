import 'package:people_living_flutterdemo/generated/json/base/json_field.dart';
import 'package:people_living_flutterdemo/generated/json/firm_position_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class FirmPositionEntity {
	FirmPositionData? data;

	FirmPositionEntity();

	factory FirmPositionEntity.fromJson(Map<String, dynamic> json) => $FirmPositionEntityFromJson(json);

	Map<String, dynamic> toJson() => $FirmPositionEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class FirmPositionData {
	int? total;
	int? pageNum;
	List<FirmPositionDataList>? list;

	FirmPositionData();

	factory FirmPositionData.fromJson(Map<String, dynamic> json) => $FirmPositionDataFromJson(json);

	Map<String, dynamic> toJson() => $FirmPositionDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class FirmPositionDataList {
	int? id;
	int? companyId;
	int? recruiterId;
	String? careerDirection;
	String? title;
	String? description;
	int? recruitCount;
	String? workOper;
	String? education;
	String? trainingMode;
	String? workYears;
	String? createDate;
	int? status;
	String? workDaysMode;
	double? startPay;
	double? endPay;
	bool? industryMandatory;
	List<String>? skills;
	int? auditStatus;
	String? companyName;
	String? industryName;
	String? auditFailReason;
	int? countRecommends;
	int? countSelfRecommends;

	FirmPositionDataList();

	factory FirmPositionDataList.fromJson(Map<String, dynamic> json) => $FirmPositionDataListFromJson(json);

	Map<String, dynamic> toJson() => $FirmPositionDataListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}