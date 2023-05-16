import 'package:people_living_flutterdemo/generated/json/base/json_convert_content.dart';
import 'package:people_living_flutterdemo/core/models/FirmPositionModel/firm_recommend_bean_entity.dart';

FirmRecommendBeanEntity $FirmRecommendBeanEntityFromJson(Map<String, dynamic> json) {
	final FirmRecommendBeanEntity firmRecommendBeanEntity = FirmRecommendBeanEntity();
	final FirmRecommendBeanData? data = jsonConvert.convert<FirmRecommendBeanData>(json['data']);
	if (data != null) {
		firmRecommendBeanEntity.data = data;
	}
	return firmRecommendBeanEntity;
}

Map<String, dynamic> $FirmRecommendBeanEntityToJson(FirmRecommendBeanEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['data'] = entity.data?.toJson();
	return data;
}

FirmRecommendBeanData $FirmRecommendBeanDataFromJson(Map<String, dynamic> json) {
	final FirmRecommendBeanData firmRecommendBeanData = FirmRecommendBeanData();
	final int? total = jsonConvert.convert<int>(json['total']);
	if (total != null) {
		firmRecommendBeanData.total = total;
	}
	final int? pageNum = jsonConvert.convert<int>(json['pageNum']);
	if (pageNum != null) {
		firmRecommendBeanData.pageNum = pageNum;
	}
	final List<FirmRecommendBeanDataList>? list = jsonConvert.convertListNotNull<FirmRecommendBeanDataList>(json['list']);
	if (list != null) {
		firmRecommendBeanData.list = list;
	}
	return firmRecommendBeanData;
}

Map<String, dynamic> $FirmRecommendBeanDataToJson(FirmRecommendBeanData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['total'] = entity.total;
	data['pageNum'] = entity.pageNum;
	data['list'] =  entity.list?.map((v) => v.toJson()).toList();
	return data;
}

FirmRecommendBeanDataList $FirmRecommendBeanDataListFromJson(Map<String, dynamic> json) {
	final FirmRecommendBeanDataList firmRecommendBeanDataList = FirmRecommendBeanDataList();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		firmRecommendBeanDataList.id = id;
	}
	final String? realName = jsonConvert.convert<String>(json['realName']);
	if (realName != null) {
		firmRecommendBeanDataList.realName = realName;
	}
	final String? avatarUrl = jsonConvert.convert<String>(json['avatarUrl']);
	if (avatarUrl != null) {
		firmRecommendBeanDataList.avatarUrl = avatarUrl;
	}
	final String? careerDirectionName = jsonConvert.convert<String>(json['careerDirectionName']);
	if (careerDirectionName != null) {
		firmRecommendBeanDataList.careerDirectionName = careerDirectionName;
	}
	final String? workYearsName = jsonConvert.convert<String>(json['workYearsName']);
	if (workYearsName != null) {
		firmRecommendBeanDataList.workYearsName = workYearsName;
	}
	final String? educationName = jsonConvert.convert<String>(json['educationName']);
	if (educationName != null) {
		firmRecommendBeanDataList.educationName = educationName;
	}
	final String? trainingModeName = jsonConvert.convert<String>(json['trainingModeName']);
	if (trainingModeName != null) {
		firmRecommendBeanDataList.trainingModeName = trainingModeName;
	}
	final dynamic recommendReason = jsonConvert.convert<dynamic>(json['recommendReason']);
	if (recommendReason != null) {
		firmRecommendBeanDataList.recommendReason = recommendReason;
	}
	final dynamic interviewStatusName = jsonConvert.convert<dynamic>(json['interviewStatusName']);
	if (interviewStatusName != null) {
		firmRecommendBeanDataList.interviewStatusName = interviewStatusName;
	}
	final bool? isOperationRecommendation = jsonConvert.convert<bool>(json['isOperationRecommendation']);
	if (isOperationRecommendation != null) {
		firmRecommendBeanDataList.isOperationRecommendation = isOperationRecommendation;
	}
	final dynamic interviewStatus = jsonConvert.convert<dynamic>(json['interviewStatus']);
	if (interviewStatus != null) {
		firmRecommendBeanDataList.interviewStatus = interviewStatus;
	}
	final int? positionId = jsonConvert.convert<int>(json['positionId']);
	if (positionId != null) {
		firmRecommendBeanDataList.positionId = positionId;
	}
	final double? expectSalary = jsonConvert.convert<double>(json['expectSalary']);
	if (expectSalary != null) {
		firmRecommendBeanDataList.expectSalary = expectSalary;
	}
	final String? createDate = jsonConvert.convert<String>(json['createDate']);
	if (createDate != null) {
		firmRecommendBeanDataList.createDate = createDate;
	}
	final int? tag = jsonConvert.convert<int>(json['tag']);
	if (tag != null) {
		firmRecommendBeanDataList.tag = tag;
	}
	final int? skillMatchNum = jsonConvert.convert<int>(json['skillMatchNum']);
	if (skillMatchNum != null) {
		firmRecommendBeanDataList.skillMatchNum = skillMatchNum;
	}
	final List<FirmRecommendBeanDataListDeveloperSkillMatchDto>? developerSkillMatchDto = jsonConvert.convertListNotNull<FirmRecommendBeanDataListDeveloperSkillMatchDto>(json['developerSkillMatchDto']);
	if (developerSkillMatchDto != null) {
		firmRecommendBeanDataList.developerSkillMatchDto = developerSkillMatchDto;
	}
	return firmRecommendBeanDataList;
}

Map<String, dynamic> $FirmRecommendBeanDataListToJson(FirmRecommendBeanDataList entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['realName'] = entity.realName;
	data['avatarUrl'] = entity.avatarUrl;
	data['careerDirectionName'] = entity.careerDirectionName;
	data['workYearsName'] = entity.workYearsName;
	data['educationName'] = entity.educationName;
	data['trainingModeName'] = entity.trainingModeName;
	data['recommendReason'] = entity.recommendReason;
	data['interviewStatusName'] = entity.interviewStatusName;
	data['isOperationRecommendation'] = entity.isOperationRecommendation;
	data['interviewStatus'] = entity.interviewStatus;
	data['positionId'] = entity.positionId;
	data['expectSalary'] = entity.expectSalary;
	data['createDate'] = entity.createDate;
	data['tag'] = entity.tag;
	data['skillMatchNum'] = entity.skillMatchNum;
	data['developerSkillMatchDto'] =  entity.developerSkillMatchDto?.map((v) => v.toJson()).toList();
	return data;
}

FirmRecommendBeanDataListDeveloperSkillMatchDto $FirmRecommendBeanDataListDeveloperSkillMatchDtoFromJson(Map<String, dynamic> json) {
	final FirmRecommendBeanDataListDeveloperSkillMatchDto firmRecommendBeanDataListDeveloperSkillMatchDto = FirmRecommendBeanDataListDeveloperSkillMatchDto();
	final int? skillId = jsonConvert.convert<int>(json['skillId']);
	if (skillId != null) {
		firmRecommendBeanDataListDeveloperSkillMatchDto.skillId = skillId;
	}
	final String? skillName = jsonConvert.convert<String>(json['skillName']);
	if (skillName != null) {
		firmRecommendBeanDataListDeveloperSkillMatchDto.skillName = skillName;
	}
	final bool? matchStatus = jsonConvert.convert<bool>(json['matchStatus']);
	if (matchStatus != null) {
		firmRecommendBeanDataListDeveloperSkillMatchDto.matchStatus = matchStatus;
	}
	return firmRecommendBeanDataListDeveloperSkillMatchDto;
}

Map<String, dynamic> $FirmRecommendBeanDataListDeveloperSkillMatchDtoToJson(FirmRecommendBeanDataListDeveloperSkillMatchDto entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['skillId'] = entity.skillId;
	data['skillName'] = entity.skillName;
	data['matchStatus'] = entity.matchStatus;
	return data;
}