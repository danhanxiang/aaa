import 'package:people_living_flutterdemo/generated/json/base/json_convert_content.dart';
import 'package:people_living_flutterdemo/core/models/FirmMineModel/search_company_info_entity.dart';

SearchCompanyInfoEntity $SearchCompanyInfoEntityFromJson(Map<String, dynamic> json) {
	final SearchCompanyInfoEntity searchCompanyInfoEntity = SearchCompanyInfoEntity();
	final List<SearchCompanyInfoData>? data = jsonConvert.convertListNotNull<SearchCompanyInfoData>(json['data']);
	if (data != null) {
		searchCompanyInfoEntity.data = data;
	}
	return searchCompanyInfoEntity;
}

Map<String, dynamic> $SearchCompanyInfoEntityToJson(SearchCompanyInfoEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['data'] =  entity.data?.map((v) => v.toJson()).toList();
	return data;
}

SearchCompanyInfoData $SearchCompanyInfoDataFromJson(Map<String, dynamic> json) {
	final SearchCompanyInfoData searchCompanyInfoData = SearchCompanyInfoData();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		searchCompanyInfoData.id = id;
	}
	final String? companyName = jsonConvert.convert<String>(json['companyName']);
	if (companyName != null) {
		searchCompanyInfoData.companyName = companyName;
	}
	final String? shortName = jsonConvert.convert<String>(json['shortName']);
	if (shortName != null) {
		searchCompanyInfoData.shortName = shortName;
	}
	final int? industryId = jsonConvert.convert<int>(json['industryId']);
	if (industryId != null) {
		searchCompanyInfoData.industryId = industryId;
	}
	final String? taxInvoice = jsonConvert.convert<String>(json['taxInvoice']);
	if (taxInvoice != null) {
		searchCompanyInfoData.taxInvoice = taxInvoice;
	}
	final int? personSizeId = jsonConvert.convert<int>(json['personSizeId']);
	if (personSizeId != null) {
		searchCompanyInfoData.personSizeId = personSizeId;
	}
	final int? teamToolsDescId = jsonConvert.convert<int>(json['teamToolsDescId']);
	if (teamToolsDescId != null) {
		searchCompanyInfoData.teamToolsDescId = teamToolsDescId;
	}
	final String? createDate = jsonConvert.convert<String>(json['createDate']);
	if (createDate != null) {
		searchCompanyInfoData.createDate = createDate;
	}
	final int? status = jsonConvert.convert<int>(json['status']);
	if (status != null) {
		searchCompanyInfoData.status = status;
	}
	final String? lastModifyDate = jsonConvert.convert<String>(json['lastModifyDate']);
	if (lastModifyDate != null) {
		searchCompanyInfoData.lastModifyDate = lastModifyDate;
	}
	final String? createUser = jsonConvert.convert<String>(json['createUser']);
	if (createUser != null) {
		searchCompanyInfoData.createUser = createUser;
	}
	final String? lastModifyUser = jsonConvert.convert<String>(json['lastModifyUser']);
	if (lastModifyUser != null) {
		searchCompanyInfoData.lastModifyUser = lastModifyUser;
	}
	final String? businessLicense = jsonConvert.convert<String>(json['businessLicense']);
	if (businessLicense != null) {
		searchCompanyInfoData.businessLicense = businessLicense;
	}
	final String? emailSuffix = jsonConvert.convert<String>(json['emailSuffix']);
	if (emailSuffix != null) {
		searchCompanyInfoData.emailSuffix = emailSuffix;
	}
	final String? officialWebsite = jsonConvert.convert<String>(json['officialWebsite']);
	if (officialWebsite != null) {
		searchCompanyInfoData.officialWebsite = officialWebsite;
	}
	final String? address = jsonConvert.convert<String>(json['address']);
	if (address != null) {
		searchCompanyInfoData.address = address;
	}
	final String? registeredFund = jsonConvert.convert<String>(json['registeredFund']);
	if (registeredFund != null) {
		searchCompanyInfoData.registeredFund = registeredFund;
	}
	final String? foundDate = jsonConvert.convert<String>(json['foundDate']);
	if (foundDate != null) {
		searchCompanyInfoData.foundDate = foundDate;
	}
	final String? profile = jsonConvert.convert<String>(json['profile']);
	if (profile != null) {
		searchCompanyInfoData.profile = profile;
	}
	return searchCompanyInfoData;
}

Map<String, dynamic> $SearchCompanyInfoDataToJson(SearchCompanyInfoData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['companyName'] = entity.companyName;
	data['shortName'] = entity.shortName;
	data['industryId'] = entity.industryId;
	data['taxInvoice'] = entity.taxInvoice;
	data['personSizeId'] = entity.personSizeId;
	data['teamToolsDescId'] = entity.teamToolsDescId;
	data['createDate'] = entity.createDate;
	data['status'] = entity.status;
	data['lastModifyDate'] = entity.lastModifyDate;
	data['createUser'] = entity.createUser;
	data['lastModifyUser'] = entity.lastModifyUser;
	data['businessLicense'] = entity.businessLicense;
	data['emailSuffix'] = entity.emailSuffix;
	data['officialWebsite'] = entity.officialWebsite;
	data['address'] = entity.address;
	data['registeredFund'] = entity.registeredFund;
	data['foundDate'] = entity.foundDate;
	data['profile'] = entity.profile;
	return data;
}