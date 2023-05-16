import 'package:people_living_flutterdemo/generated/json/base/json_convert_content.dart';
import 'package:people_living_flutterdemo/core/models/FirmMineModel/firm_company_bean_entity.dart';

FirmCompanyBeanEntity $FirmCompanyBeanEntityFromJson(Map<String, dynamic> json) {
	final FirmCompanyBeanEntity firmCompanyBeanEntity = FirmCompanyBeanEntity();
	final int? code = jsonConvert.convert<int>(json['code']);
	if (code != null) {
		firmCompanyBeanEntity.code = code;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		firmCompanyBeanEntity.message = message;
	}
	final FirmCompanyBeanData? data = jsonConvert.convert<FirmCompanyBeanData>(json['data']);
	if (data != null) {
		firmCompanyBeanEntity.data = data;
	}
	return firmCompanyBeanEntity;
}

Map<String, dynamic> $FirmCompanyBeanEntityToJson(FirmCompanyBeanEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['code'] = entity.code;
	data['message'] = entity.message;
	data['data'] = entity.data?.toJson();
	return data;
}

FirmCompanyBeanData $FirmCompanyBeanDataFromJson(Map<String, dynamic> json) {
	final FirmCompanyBeanData firmCompanyBeanData = FirmCompanyBeanData();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		firmCompanyBeanData.id = id;
	}
	final String? companyName = jsonConvert.convert<String>(json['companyName']);
	if (companyName != null) {
		firmCompanyBeanData.companyName = companyName;
	}
	final String? shortName = jsonConvert.convert<String>(json['shortName']);
	if (shortName != null) {
		firmCompanyBeanData.shortName = shortName;
	}
	final String? industry = jsonConvert.convert<String>(json['industry']);
	if (industry != null) {
		firmCompanyBeanData.industry = industry;
	}
	final String? taxInvoice = jsonConvert.convert<String>(json['taxInvoice']);
	if (taxInvoice != null) {
		firmCompanyBeanData.taxInvoice = taxInvoice;
	}
	final String? personSize = jsonConvert.convert<String>(json['personSize']);
	if (personSize != null) {
		firmCompanyBeanData.personSize = personSize;
	}
	final int? personSizeId = jsonConvert.convert<int>(json['personSizeId']);
	if (personSizeId != null) {
		firmCompanyBeanData.personSizeId = personSizeId;
	}
	final String? emailSuffix = jsonConvert.convert<String>(json['emailSuffix']);
	if (emailSuffix != null) {
		firmCompanyBeanData.emailSuffix = emailSuffix;
	}
	final String? officialWebsite = jsonConvert.convert<String>(json['officialWebsite']);
	if (officialWebsite != null) {
		firmCompanyBeanData.officialWebsite = officialWebsite;
	}
	final String? address = jsonConvert.convert<String>(json['address']);
	if (address != null) {
		firmCompanyBeanData.address = address;
	}
	final dynamic foundDate = jsonConvert.convert<dynamic>(json['foundDate']);
	if (foundDate != null) {
		firmCompanyBeanData.foundDate = foundDate;
	}
	final String? registeredFund = jsonConvert.convert<String>(json['registeredFund']);
	if (registeredFund != null) {
		firmCompanyBeanData.registeredFund = registeredFund;
	}
	final String? profile = jsonConvert.convert<String>(json['profile']);
	if (profile != null) {
		firmCompanyBeanData.profile = profile;
	}
	final String? businessLicense = jsonConvert.convert<String>(json['businessLicense']);
	if (businessLicense != null) {
		firmCompanyBeanData.businessLicense = businessLicense;
	}
	final int? industryId = jsonConvert.convert<int>(json['industryId']);
	if (industryId != null) {
		firmCompanyBeanData.industryId = industryId;
	}
	final int? parentIndustryId = jsonConvert.convert<int>(json['parentIndustryId']);
	if (parentIndustryId != null) {
		firmCompanyBeanData.parentIndustryId = parentIndustryId;
	}
	return firmCompanyBeanData;
}

Map<String, dynamic> $FirmCompanyBeanDataToJson(FirmCompanyBeanData entity) {
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