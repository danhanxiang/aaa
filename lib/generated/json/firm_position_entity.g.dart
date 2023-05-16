import 'package:people_living_flutterdemo/generated/json/base/json_convert_content.dart';
import 'package:people_living_flutterdemo/core/models/FirmPositionModel/firm_position_entity.dart';

FirmPositionEntity $FirmPositionEntityFromJson(Map<String, dynamic> json) {
	final FirmPositionEntity firmPositionEntity = FirmPositionEntity();
	final FirmPositionData? data = jsonConvert.convert<FirmPositionData>(json['data']);
	if (data != null) {
		firmPositionEntity.data = data;
	}
	return firmPositionEntity;
}

Map<String, dynamic> $FirmPositionEntityToJson(FirmPositionEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['data'] = entity.data?.toJson();
	return data;
}

FirmPositionData $FirmPositionDataFromJson(Map<String, dynamic> json) {
	final FirmPositionData firmPositionData = FirmPositionData();
	final int? total = jsonConvert.convert<int>(json['total']);
	if (total != null) {
		firmPositionData.total = total;
	}
	final int? pageNum = jsonConvert.convert<int>(json['pageNum']);
	if (pageNum != null) {
		firmPositionData.pageNum = pageNum;
	}
	final List<FirmPositionDataList>? list = jsonConvert.convertListNotNull<FirmPositionDataList>(json['list']);
	if (list != null) {
		firmPositionData.list = list;
	}
	return firmPositionData;
}

Map<String, dynamic> $FirmPositionDataToJson(FirmPositionData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['total'] = entity.total;
	data['pageNum'] = entity.pageNum;
	data['list'] =  entity.list?.map((v) => v.toJson()).toList();
	return data;
}

FirmPositionDataList $FirmPositionDataListFromJson(Map<String, dynamic> json) {
	final FirmPositionDataList firmPositionDataList = FirmPositionDataList();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		firmPositionDataList.id = id;
	}
	final int? companyId = jsonConvert.convert<int>(json['companyId']);
	if (companyId != null) {
		firmPositionDataList.companyId = companyId;
	}
	final int? recruiterId = jsonConvert.convert<int>(json['recruiterId']);
	if (recruiterId != null) {
		firmPositionDataList.recruiterId = recruiterId;
	}
	final String? careerDirection = jsonConvert.convert<String>(json['careerDirection']);
	if (careerDirection != null) {
		firmPositionDataList.careerDirection = careerDirection;
	}
	final String? title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		firmPositionDataList.title = title;
	}
	final String? description = jsonConvert.convert<String>(json['description']);
	if (description != null) {
		firmPositionDataList.description = description;
	}
	final int? recruitCount = jsonConvert.convert<int>(json['recruitCount']);
	if (recruitCount != null) {
		firmPositionDataList.recruitCount = recruitCount;
	}
	final String? workOper = jsonConvert.convert<String>(json['workOper']);
	if (workOper != null) {
		firmPositionDataList.workOper = workOper;
	}
	final String? education = jsonConvert.convert<String>(json['education']);
	if (education != null) {
		firmPositionDataList.education = education;
	}
	final String? trainingMode = jsonConvert.convert<String>(json['trainingMode']);
	if (trainingMode != null) {
		firmPositionDataList.trainingMode = trainingMode;
	}
	final String? workYears = jsonConvert.convert<String>(json['workYears']);
	if (workYears != null) {
		firmPositionDataList.workYears = workYears;
	}
	final String? createDate = jsonConvert.convert<String>(json['createDate']);
	if (createDate != null) {
		firmPositionDataList.createDate = createDate;
	}
	final int? status = jsonConvert.convert<int>(json['status']);
	if (status != null) {
		firmPositionDataList.status = status;
	}
	final String? workDaysMode = jsonConvert.convert<String>(json['workDaysMode']);
	if (workDaysMode != null) {
		firmPositionDataList.workDaysMode = workDaysMode;
	}
	final double? startPay = jsonConvert.convert<double>(json['startPay']);
	if (startPay != null) {
		firmPositionDataList.startPay = startPay;
	}
	final double? endPay = jsonConvert.convert<double>(json['endPay']);
	if (endPay != null) {
		firmPositionDataList.endPay = endPay;
	}
	final bool? industryMandatory = jsonConvert.convert<bool>(json['industryMandatory']);
	if (industryMandatory != null) {
		firmPositionDataList.industryMandatory = industryMandatory;
	}
	final List<String>? skills = jsonConvert.convertListNotNull<String>(json['skills']);
	if (skills != null) {
		firmPositionDataList.skills = skills;
	}
	final int? auditStatus = jsonConvert.convert<int>(json['auditStatus']);
	if (auditStatus != null) {
		firmPositionDataList.auditStatus = auditStatus;
	}
	final String? companyName = jsonConvert.convert<String>(json['companyName']);
	if (companyName != null) {
		firmPositionDataList.companyName = companyName;
	}
	final String? industryName = jsonConvert.convert<String>(json['industryName']);
	if (industryName != null) {
		firmPositionDataList.industryName = industryName;
	}
	final String? auditFailReason = jsonConvert.convert<String>(json['auditFailReason']);
	if (auditFailReason != null) {
		firmPositionDataList.auditFailReason = auditFailReason;
	}
	final int? countRecommends = jsonConvert.convert<int>(json['countRecommends']);
	if (countRecommends != null) {
		firmPositionDataList.countRecommends = countRecommends;
	}
	final int? countSelfRecommends = jsonConvert.convert<int>(json['countSelfRecommends']);
	if (countSelfRecommends != null) {
		firmPositionDataList.countSelfRecommends = countSelfRecommends;
	}
	return firmPositionDataList;
}

Map<String, dynamic> $FirmPositionDataListToJson(FirmPositionDataList entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['companyId'] = entity.companyId;
	data['recruiterId'] = entity.recruiterId;
	data['careerDirection'] = entity.careerDirection;
	data['title'] = entity.title;
	data['description'] = entity.description;
	data['recruitCount'] = entity.recruitCount;
	data['workOper'] = entity.workOper;
	data['education'] = entity.education;
	data['trainingMode'] = entity.trainingMode;
	data['workYears'] = entity.workYears;
	data['createDate'] = entity.createDate;
	data['status'] = entity.status;
	data['workDaysMode'] = entity.workDaysMode;
	data['startPay'] = entity.startPay;
	data['endPay'] = entity.endPay;
	data['industryMandatory'] = entity.industryMandatory;
	data['skills'] =  entity.skills;
	data['auditStatus'] = entity.auditStatus;
	data['companyName'] = entity.companyName;
	data['industryName'] = entity.industryName;
	data['auditFailReason'] = entity.auditFailReason;
	data['countRecommends'] = entity.countRecommends;
	data['countSelfRecommends'] = entity.countSelfRecommends;
	return data;
}