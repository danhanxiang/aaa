import 'package:people_living_flutterdemo/generated/json/base/json_convert_content.dart';
import 'package:people_living_flutterdemo/core/models/FirmPositionModel/firm_info_id_bean_entity.dart';

FirmInfoIdBeanEntity $FirmInfoIdBeanEntityFromJson(Map<String, dynamic> json) {
	final FirmInfoIdBeanEntity firmInfoIdBeanEntity = FirmInfoIdBeanEntity();
	final FirmInfoIdBeanData? data = jsonConvert.convert<FirmInfoIdBeanData>(json['data']);
	if (data != null) {
		firmInfoIdBeanEntity.data = data;
	}
	return firmInfoIdBeanEntity;
}

Map<String, dynamic> $FirmInfoIdBeanEntityToJson(FirmInfoIdBeanEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['data'] = entity.data?.toJson();
	return data;
}

FirmInfoIdBeanData $FirmInfoIdBeanDataFromJson(Map<String, dynamic> json) {
	final FirmInfoIdBeanData firmInfoIdBeanData = FirmInfoIdBeanData();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		firmInfoIdBeanData.id = id;
	}
	final List<int>? careerDirectionId = jsonConvert.convertListNotNull<int>(json['careerDirectionId']);
	if (careerDirectionId != null) {
		firmInfoIdBeanData.careerDirectionId = careerDirectionId;
	}
	final String? title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		firmInfoIdBeanData.title = title;
	}
	final String? description = jsonConvert.convert<String>(json['description']);
	if (description != null) {
		firmInfoIdBeanData.description = description;
	}
	final int? recruitCount = jsonConvert.convert<int>(json['recruitCount']);
	if (recruitCount != null) {
		firmInfoIdBeanData.recruitCount = recruitCount;
	}
	final int? workOperId = jsonConvert.convert<int>(json['workOperId']);
	if (workOperId != null) {
		firmInfoIdBeanData.workOperId = workOperId;
	}
	final int? workYearsId = jsonConvert.convert<int>(json['workYearsId']);
	if (workYearsId != null) {
		firmInfoIdBeanData.workYearsId = workYearsId;
	}
	final int? educationId = jsonConvert.convert<int>(json['educationId']);
	if (educationId != null) {
		firmInfoIdBeanData.educationId = educationId;
	}
	final int? trainingModeId = jsonConvert.convert<int>(json['trainingModeId']);
	if (trainingModeId != null) {
		firmInfoIdBeanData.trainingModeId = trainingModeId;
	}
	final int? workDaysMode = jsonConvert.convert<int>(json['workDaysMode']);
	if (workDaysMode != null) {
		firmInfoIdBeanData.workDaysMode = workDaysMode;
	}
	final double? startPay = jsonConvert.convert<double>(json['startPay']);
	if (startPay != null) {
		firmInfoIdBeanData.startPay = startPay;
	}
	final double? endPay = jsonConvert.convert<double>(json['endPay']);
	if (endPay != null) {
		firmInfoIdBeanData.endPay = endPay;
	}
	final int? industryMandatory = jsonConvert.convert<int>(json['industryMandatory']);
	if (industryMandatory != null) {
		firmInfoIdBeanData.industryMandatory = industryMandatory;
	}
	final List<int>? skillIds = jsonConvert.convertListNotNull<int>(json['skillIds']);
	if (skillIds != null) {
		firmInfoIdBeanData.skillIds = skillIds;
	}
	return firmInfoIdBeanData;
}

Map<String, dynamic> $FirmInfoIdBeanDataToJson(FirmInfoIdBeanData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['careerDirectionId'] =  entity.careerDirectionId;
	data['title'] = entity.title;
	data['description'] = entity.description;
	data['recruitCount'] = entity.recruitCount;
	data['workOperId'] = entity.workOperId;
	data['workYearsId'] = entity.workYearsId;
	data['educationId'] = entity.educationId;
	data['trainingModeId'] = entity.trainingModeId;
	data['workDaysMode'] = entity.workDaysMode;
	data['startPay'] = entity.startPay;
	data['endPay'] = entity.endPay;
	data['industryMandatory'] = entity.industryMandatory;
	data['skillIds'] =  entity.skillIds;
	return data;
}