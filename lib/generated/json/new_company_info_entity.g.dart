import 'package:people_living_flutterdemo/generated/json/base/json_convert_content.dart';
import 'package:people_living_flutterdemo/core/models/FirmMineModel/new_company_info_entity.dart';

NewCompanyInfoEntity $NewCompanyInfoEntityFromJson(Map<String, dynamic> json) {
	final NewCompanyInfoEntity newCompanyInfoEntity = NewCompanyInfoEntity();
	final NewCompanyInfoData? data = jsonConvert.convert<NewCompanyInfoData>(json['data']);
	if (data != null) {
		newCompanyInfoEntity.data = data;
	}
	return newCompanyInfoEntity;
}

Map<String, dynamic> $NewCompanyInfoEntityToJson(NewCompanyInfoEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['data'] = entity.data?.toJson();
	return data;
}

NewCompanyInfoData $NewCompanyInfoDataFromJson(Map<String, dynamic> json) {
	final NewCompanyInfoData newCompanyInfoData = NewCompanyInfoData();
	final String? companyName = jsonConvert.convert<String>(json['companyName']);
	if (companyName != null) {
		newCompanyInfoData.companyName = companyName;
	}
	final String? taxInvoice = jsonConvert.convert<String>(json['taxInvoice']);
	if (taxInvoice != null) {
		newCompanyInfoData.taxInvoice = taxInvoice;
	}
	final String? businessLicense = jsonConvert.convert<String>(json['businessLicense']);
	if (businessLicense != null) {
		newCompanyInfoData.businessLicense = businessLicense;
	}
	final String? address = jsonConvert.convert<String>(json['address']);
	if (address != null) {
		newCompanyInfoData.address = address;
	}
	return newCompanyInfoData;
}

Map<String, dynamic> $NewCompanyInfoDataToJson(NewCompanyInfoData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['companyName'] = entity.companyName;
	data['taxInvoice'] = entity.taxInvoice;
	data['businessLicense'] = entity.businessLicense;
	data['address'] = entity.address;
	return data;
}