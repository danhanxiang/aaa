import 'package:people_living_flutterdemo/generated/json/base/json_field.dart';
import 'package:people_living_flutterdemo/generated/json/company_info_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class CompanyInfoEntity {
	CompanyInfoData? data;

	CompanyInfoEntity();

	factory CompanyInfoEntity.fromJson(Map<String, dynamic> json) => $CompanyInfoEntityFromJson(json);

	Map<String, dynamic> toJson() => $CompanyInfoEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class CompanyInfoData {
	int? id;
	String? companyName;
	String? shortName;
	String? industry;
	String? taxInvoice;
	String? personSize;
	int? personSizeId;
	String? emailSuffix;
	String? officialWebsite;
	String? address;
	dynamic foundDate;
	String? registeredFund;
	String? profile;
	String? businessLicense;
	int? industryId;
	int? parentIndustryId;

	CompanyInfoData();

	factory CompanyInfoData.fromJson(Map<String, dynamic> json) => $CompanyInfoDataFromJson(json);

	Map<String, dynamic> toJson() => $CompanyInfoDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}