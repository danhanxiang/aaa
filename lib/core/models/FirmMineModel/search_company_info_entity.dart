import 'package:people_living_flutterdemo/generated/json/base/json_field.dart';
import 'package:people_living_flutterdemo/generated/json/search_company_info_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class SearchCompanyInfoEntity {
	List<SearchCompanyInfoData>? data;

	SearchCompanyInfoEntity();

	factory SearchCompanyInfoEntity.fromJson(Map<String, dynamic> json) => $SearchCompanyInfoEntityFromJson(json);

	Map<String, dynamic> toJson() => $SearchCompanyInfoEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class SearchCompanyInfoData {
	int? id;
	String? companyName;
	String? shortName;
	int? industryId;
	String? taxInvoice;
	int? personSizeId;
	int? teamToolsDescId;
	String? createDate;
	int? status;
	String? lastModifyDate;
	String? createUser;
	String? lastModifyUser;
	String? businessLicense;
	String? emailSuffix;
	String? officialWebsite;
	String? address;
	String? registeredFund;
	String? foundDate;
	String? profile;

	SearchCompanyInfoData();

	factory SearchCompanyInfoData.fromJson(Map<String, dynamic> json) => $SearchCompanyInfoDataFromJson(json);

	Map<String, dynamic> toJson() => $SearchCompanyInfoDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}