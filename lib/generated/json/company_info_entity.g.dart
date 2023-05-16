import 'package:people_living_flutterdemo/generated/json/base/json_convert_content.dart';
import 'package:people_living_flutterdemo/core/models/FirmMineModel/company_info_entity.dart';

CompanyInfoEntity $CompanyInfoEntityFromJson(Map<String, dynamic> json) {
	final CompanyInfoEntity companyInfoEntity = CompanyInfoEntity();
	final CompanyInfoData? data = jsonConvert.convert<CompanyInfoData>(json['data']);
	if (data != null) {
		companyInfoEntity.data = data;
	}
	return companyInfoEntity;
}

Map<String, dynamic> $CompanyInfoEntityToJson(CompanyInfoEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['data'] = entity.data?.toJson();
	return data;
}

CompanyInfoData $CompanyInfoDataFromJson(Map<String, dynamic> json) {
	final CompanyInfoData companyInfoData = CompanyInfoData();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		companyInfoData.id = id;
	}
	final String? companyName = jsonConvert.convert<String>(json['companyName']);
	if (companyName != null) {
		companyInfoData.companyName = companyName;
	}
	final String? shortName = jsonConvert.convert<String>(json['shortName']);
	if (shortName != null) {
		companyInfoData.shortName = shortName;
	}
	final String? industry = jsonConvert.convert<String>(json['industry']);
	if (industry != null) {
		companyInfoData.industry = industry;
	}
	final String? taxInvoice = jsonConvert.convert<String>(json['taxInvoice']);
	if (taxInvoice != null) {
		companyInfoData.taxInvoice = taxInvoice;
	}
	final String? personSize = jsonConvert.convert<String>(json['personSize']);
	if (personSize != null) {
		companyInfoData.personSize = personSize;
	}
	final int? personSizeId = jsonConvert.convert<int>(json['personSizeId']);
	if (personSizeId != null) {
		companyInfoData.personSizeId = personSizeId;
	}
	final String? emailSuffix = jsonConvert.convert<String>(json['emailSuffix']);
	if (emailSuffix != null) {
		companyInfoData.emailSuffix = emailSuffix;
	}
	final String? officialWebsite = jsonConvert.convert<String>(json['officialWebsite']);
	if (officialWebsite != null) {
		companyInfoData.officialWebsite = officialWebsite;
	}
	final String? address = jsonConvert.convert<String>(json['address']);
	if (address != null) {
		companyInfoData.address = address;
	}
	final dynamic foundDate = jsonConvert.convert<dynamic>(json['foundDate']);
	if (foundDate != null) {
		companyInfoData.foundDate = foundDate;
	}
	final String? registeredFund = jsonConvert.convert<String>(json['registeredFund']);
	if (registeredFund != null) {
		companyInfoData.registeredFund = registeredFund;
	}
	final String? profile = jsonConvert.convert<String>(json['profile']);
	if (profile != null) {
		companyInfoData.profile = profile;
	}
	final String? businessLicense = jsonConvert.convert<String>(json['businessLicense']);
	if (businessLicense != null) {
		companyInfoData.businessLicense = businessLicense;
	}
	final int? industryId = jsonConvert.convert<int>(json['industryId']);
	if (industryId != null) {
		companyInfoData.industryId = industryId;
	}
	final int? parentIndustryId = jsonConvert.convert<int>(json['parentIndustryId']);
	if (parentIndustryId != null) {
		companyInfoData.parentIndustryId = parentIndustryId;
	}
	return companyInfoData;
}

Map<String, dynamic> $CompanyInfoDataToJson(CompanyInfoData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['companyName'] = entity.companyName;
	data['shortName'] = entity.shortName;
	data['industry'] = entity.industry;
	data['taxInvoice'] = entity.taxInvoice;
	data['personSize'] = entity.personSize;
	data['personSizeId'] = entity.personSizeId;
	data['emailSuffix'] = entity.emailSuffix;
	data['officialWebsite'] = entity.officialWebsite;
	data['address'] = entity.address;
	data['foundDate'] = entity.foundDate;
	data['registeredFund'] = entity.registeredFund;
	data['profile'] = entity.profile;
	data['businessLicense'] = entity.businessLicense;
	data['industryId'] = entity.industryId;
	data['parentIndustryId'] = entity.parentIndustryId;
	return data;
}