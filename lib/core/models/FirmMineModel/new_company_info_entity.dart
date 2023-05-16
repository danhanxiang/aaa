import 'package:people_living_flutterdemo/generated/json/base/json_field.dart';
import 'package:people_living_flutterdemo/generated/json/new_company_info_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class NewCompanyInfoEntity {
	NewCompanyInfoData? data;

	NewCompanyInfoEntity();

	factory NewCompanyInfoEntity.fromJson(Map<String, dynamic> json) => $NewCompanyInfoEntityFromJson(json);

	Map<String, dynamic> toJson() => $NewCompanyInfoEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class NewCompanyInfoData {
	String? companyName;
	String? taxInvoice;
	String? businessLicense;
	String? address;

	NewCompanyInfoData();

	factory NewCompanyInfoData.fromJson(Map<String, dynamic> json) => $NewCompanyInfoDataFromJson(json);

	Map<String, dynamic> toJson() => $NewCompanyInfoDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}