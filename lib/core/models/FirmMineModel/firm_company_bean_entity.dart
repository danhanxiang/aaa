import 'package:people_living_flutterdemo/generated/json/base/json_field.dart';
import 'package:people_living_flutterdemo/generated/json/firm_company_bean_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class FirmCompanyBeanEntity {
	int? code;
	String? message;
	FirmCompanyBeanData? data;

	FirmCompanyBeanEntity();

	factory FirmCompanyBeanEntity.fromJson(Map<String, dynamic> json) => $FirmCompanyBeanEntityFromJson(json);

	Map<String, dynamic> toJson() => $FirmCompanyBeanEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class FirmCompanyBeanData {
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

	FirmCompanyBeanData();

	factory FirmCompanyBeanData.fromJson(Map<String, dynamic> json) => $FirmCompanyBeanDataFromJson(json);

	Map<String, dynamic> toJson() => $FirmCompanyBeanDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}