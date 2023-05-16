import 'package:people_living_flutterdemo/generated/json/base/json_field.dart';
import 'package:people_living_flutterdemo/generated/json/firm_info_id_bean_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class FirmInfoIdBeanEntity {
	FirmInfoIdBeanData? data;

	FirmInfoIdBeanEntity();

	factory FirmInfoIdBeanEntity.fromJson(Map<String, dynamic> json) => $FirmInfoIdBeanEntityFromJson(json);

	Map<String, dynamic> toJson() => $FirmInfoIdBeanEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class FirmInfoIdBeanData {
	int? id;
	List<int>? careerDirectionId;
	String? title;
	String? description;
	int? recruitCount;
	int? workOperId;
	int? workYearsId;
	int? educationId;
	int? trainingModeId;
	int? workDaysMode;
	double? startPay;
	double? endPay;
	int? industryMandatory;
	List<int>? skillIds;

	FirmInfoIdBeanData();

	factory FirmInfoIdBeanData.fromJson(Map<String, dynamic> json) => $FirmInfoIdBeanDataFromJson(json);

	Map<String, dynamic> toJson() => $FirmInfoIdBeanDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}