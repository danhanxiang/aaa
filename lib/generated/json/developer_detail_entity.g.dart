import 'package:people_living_flutterdemo/generated/json/base/json_convert_content.dart';
import 'package:people_living_flutterdemo/core/models/FirmHomeModel/developer_detail_entity.dart';

DeveloperDetailEntity $DeveloperDetailEntityFromJson(Map<String, dynamic> json) {
	final DeveloperDetailEntity developerDetailEntity = DeveloperDetailEntity();
	final DeveloperDetailData? data = jsonConvert.convert<DeveloperDetailData>(json['data']);
	if (data != null) {
		developerDetailEntity.data = data;
	}
	return developerDetailEntity;
}

Map<String, dynamic> $DeveloperDetailEntityToJson(DeveloperDetailEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['data'] = entity.data?.toJson();
	return data;
}

DeveloperDetailData $DeveloperDetailDataFromJson(Map<String, dynamic> json) {
	final DeveloperDetailData developerDetailData = DeveloperDetailData();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		developerDetailData.id = id;
	}
	final String? avatarUrl = jsonConvert.convert<String>(json['avatarUrl']);
	if (avatarUrl != null) {
		developerDetailData.avatarUrl = avatarUrl;
	}
	final String? mobile = jsonConvert.convert<String>(json['mobile']);
	if (mobile != null) {
		developerDetailData.mobile = mobile;
	}
	final String? nickName = jsonConvert.convert<String>(json['nickName']);
	if (nickName != null) {
		developerDetailData.nickName = nickName;
	}
	final String? realName = jsonConvert.convert<String>(json['realName']);
	if (realName != null) {
		developerDetailData.realName = realName;
	}
	final int? sex = jsonConvert.convert<int>(json['sex']);
	if (sex != null) {
		developerDetailData.sex = sex;
	}
	final String? birthday = jsonConvert.convert<String>(json['birthday']);
	if (birthday != null) {
		developerDetailData.birthday = birthday;
	}
	final int? provinceId = jsonConvert.convert<int>(json['provinceId']);
	if (provinceId != null) {
		developerDetailData.provinceId = provinceId;
	}
	final String? provinceName = jsonConvert.convert<String>(json['provinceName']);
	if (provinceName != null) {
		developerDetailData.provinceName = provinceName;
	}
	final int? cityId = jsonConvert.convert<int>(json['cityId']);
	if (cityId != null) {
		developerDetailData.cityId = cityId;
	}
	final String? cityName = jsonConvert.convert<String>(json['cityName']);
	if (cityName != null) {
		developerDetailData.cityName = cityName;
	}
	final int? areasId = jsonConvert.convert<int>(json['areasId']);
	if (areasId != null) {
		developerDetailData.areasId = areasId;
	}
	final String? areasName = jsonConvert.convert<String>(json['areasName']);
	if (areasName != null) {
		developerDetailData.areasName = areasName;
	}
	final int? remoteWorkReason = jsonConvert.convert<int>(json['remoteWorkReason']);
	if (remoteWorkReason != null) {
		developerDetailData.remoteWorkReason = remoteWorkReason;
	}
	final String? remoteWorkReasonStr = jsonConvert.convert<String>(json['remoteWorkReasonStr']);
	if (remoteWorkReasonStr != null) {
		developerDetailData.remoteWorkReasonStr = remoteWorkReasonStr;
	}
	final int? status = jsonConvert.convert<int>(json['status']);
	if (status != null) {
		developerDetailData.status = status;
	}
	final int? serviceStatus = jsonConvert.convert<int>(json['serviceStatus']);
	if (serviceStatus != null) {
		developerDetailData.serviceStatus = serviceStatus;
	}
	final dynamic serviceStatusName = jsonConvert.convert<dynamic>(json['serviceStatusName']);
	if (serviceStatusName != null) {
		developerDetailData.serviceStatusName = serviceStatusName;
	}
	final dynamic channel = jsonConvert.convert<dynamic>(json['channel']);
	if (channel != null) {
		developerDetailData.channel = channel;
	}
	final dynamic typeId = jsonConvert.convert<dynamic>(json['typeId']);
	if (typeId != null) {
		developerDetailData.typeId = typeId;
	}
	final int? businessStatus = jsonConvert.convert<int>(json['businessStatus']);
	if (businessStatus != null) {
		developerDetailData.businessStatus = businessStatus;
	}
	final String? createDate = jsonConvert.convert<String>(json['createDate']);
	if (createDate != null) {
		developerDetailData.createDate = createDate;
	}
	final String? lastModifyDate = jsonConvert.convert<String>(json['lastModifyDate']);
	if (lastModifyDate != null) {
		developerDetailData.lastModifyDate = lastModifyDate;
	}
	final dynamic coverUrl = jsonConvert.convert<dynamic>(json['coverUrl']);
	if (coverUrl != null) {
		developerDetailData.coverUrl = coverUrl;
	}
	final dynamic interviewStatus = jsonConvert.convert<dynamic>(json['interviewStatus']);
	if (interviewStatus != null) {
		developerDetailData.interviewStatus = interviewStatus;
	}
	final dynamic interviewStatusName = jsonConvert.convert<dynamic>(json['interviewStatusName']);
	if (interviewStatusName != null) {
		developerDetailData.interviewStatusName = interviewStatusName;
	}
	final dynamic contractStatus = jsonConvert.convert<dynamic>(json['contractStatus']);
	if (contractStatus != null) {
		developerDetailData.contractStatus = contractStatus;
	}
	final int? ssoMemberId = jsonConvert.convert<int>(json['ssoMemberId']);
	if (ssoMemberId != null) {
		developerDetailData.ssoMemberId = ssoMemberId;
	}
	final dynamic recommend = jsonConvert.convert<dynamic>(json['recommend']);
	if (recommend != null) {
		developerDetailData.recommend = recommend;
	}
	final dynamic recommendReason = jsonConvert.convert<dynamic>(json['recommendReason']);
	if (recommendReason != null) {
		developerDetailData.recommendReason = recommendReason;
	}
	final dynamic resumeUrl = jsonConvert.convert<dynamic>(json['resumeUrl']);
	if (resumeUrl != null) {
		developerDetailData.resumeUrl = resumeUrl;
	}
	final DeveloperDetailDataCareerDto? careerDto = jsonConvert.convert<DeveloperDetailDataCareerDto>(json['careerDto']);
	if (careerDto != null) {
		developerDetailData.careerDto = careerDto;
	}
	final List<DeveloperDetailDataWorkModeDtoList>? workModeDtoList = jsonConvert.convertListNotNull<DeveloperDetailDataWorkModeDtoList>(json['workModeDtoList']);
	if (workModeDtoList != null) {
		developerDetailData.workModeDtoList = workModeDtoList;
	}
	final List<DeveloperDetailDataEducationDtoList>? educationDtoList = jsonConvert.convertListNotNull<DeveloperDetailDataEducationDtoList>(json['educationDtoList']);
	if (educationDtoList != null) {
		developerDetailData.educationDtoList = educationDtoList;
	}
	final List<DeveloperDetailDataProjectDtoList>? projectDtoList = jsonConvert.convertListNotNull<DeveloperDetailDataProjectDtoList>(json['projectDtoList']);
	if (projectDtoList != null) {
		developerDetailData.projectDtoList = projectDtoList;
	}
	final List<DeveloperDetailDataWorkExperienceDtoList>? workExperienceDtoList = jsonConvert.convertListNotNull<DeveloperDetailDataWorkExperienceDtoList>(json['workExperienceDtoList']);
	if (workExperienceDtoList != null) {
		developerDetailData.workExperienceDtoList = workExperienceDtoList;
	}
	final List<DeveloperDetailDataDeveloperSkillDtoList>? developerSkillDtoList = jsonConvert.convertListNotNull<DeveloperDetailDataDeveloperSkillDtoList>(json['developerSkillDtoList']);
	if (developerSkillDtoList != null) {
		developerDetailData.developerSkillDtoList = developerSkillDtoList;
	}
	return developerDetailData;
}

Map<String, dynamic> $DeveloperDetailDataToJson(DeveloperDetailData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['avatarUrl'] = entity.avatarUrl;
	data['mobile'] = entity.mobile;
	data['nickName'] = entity.nickName;
	data['realName'] = entity.realName;
	data['sex'] = entity.sex;
	data['birthday'] = entity.birthday;
	data['provinceId'] = entity.provinceId;
	data['provinceName'] = entity.provinceName;
	data['cityId'] = entity.cityId;
	data['cityName'] = entity.cityName;
	data['areasId'] = entity.areasId;
	data['areasName'] = entity.areasName;
	data['remoteWorkReason'] = entity.remoteWorkReason;
	data['remoteWorkReasonStr'] = entity.remoteWorkReasonStr;
	data['status'] = entity.status;
	data['serviceStatus'] = entity.serviceStatus;
	data['serviceStatusName'] = entity.serviceStatusName;
	data['channel'] = entity.channel;
	data['typeId'] = entity.typeId;
	data['businessStatus'] = entity.businessStatus;
	data['createDate'] = entity.createDate;
	data['lastModifyDate'] = entity.lastModifyDate;
	data['coverUrl'] = entity.coverUrl;
	data['interviewStatus'] = entity.interviewStatus;
	data['interviewStatusName'] = entity.interviewStatusName;
	data['contractStatus'] = entity.contractStatus;
	data['ssoMemberId'] = entity.ssoMemberId;
	data['recommend'] = entity.recommend;
	data['recommendReason'] = entity.recommendReason;
	data['resumeUrl'] = entity.resumeUrl;
	data['careerDto'] = entity.careerDto?.toJson();
	data['workModeDtoList'] =  entity.workModeDtoList?.map((v) => v.toJson()).toList();
	data['educationDtoList'] =  entity.educationDtoList?.map((v) => v.toJson()).toList();
	data['projectDtoList'] =  entity.projectDtoList?.map((v) => v.toJson()).toList();
	data['workExperienceDtoList'] =  entity.workExperienceDtoList?.map((v) => v.toJson()).toList();
	data['developerSkillDtoList'] =  entity.developerSkillDtoList?.map((v) => v.toJson()).toList();
	return data;
}

DeveloperDetailDataCareerDto $DeveloperDetailDataCareerDtoFromJson(Map<String, dynamic> json) {
	final DeveloperDetailDataCareerDto developerDetailDataCareerDto = DeveloperDetailDataCareerDto();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		developerDetailDataCareerDto.id = id;
	}
	final int? workYearsId = jsonConvert.convert<int>(json['workYearsId']);
	if (workYearsId != null) {
		developerDetailDataCareerDto.workYearsId = workYearsId;
	}
	final double? curSalary = jsonConvert.convert<double>(json['curSalary']);
	if (curSalary != null) {
		developerDetailDataCareerDto.curSalary = curSalary;
	}
	final int? developerId = jsonConvert.convert<int>(json['developerId']);
	if (developerId != null) {
		developerDetailDataCareerDto.developerId = developerId;
	}
	final int? careerDirectionId = jsonConvert.convert<int>(json['careerDirectionId']);
	if (careerDirectionId != null) {
		developerDetailDataCareerDto.careerDirectionId = careerDirectionId;
	}
	final String? careerDirectionName = jsonConvert.convert<String>(json['careerDirectionName']);
	if (careerDirectionName != null) {
		developerDetailDataCareerDto.careerDirectionName = careerDirectionName;
	}
	final String? workYearsName = jsonConvert.convert<String>(json['workYearsName']);
	if (workYearsName != null) {
		developerDetailDataCareerDto.workYearsName = workYearsName;
	}
	return developerDetailDataCareerDto;
}

Map<String, dynamic> $DeveloperDetailDataCareerDtoToJson(DeveloperDetailDataCareerDto entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['workYearsId'] = entity.workYearsId;
	data['curSalary'] = entity.curSalary;
	data['developerId'] = entity.developerId;
	data['careerDirectionId'] = entity.careerDirectionId;
	data['careerDirectionName'] = entity.careerDirectionName;
	data['workYearsName'] = entity.workYearsName;
	return data;
}

DeveloperDetailDataWorkModeDtoList $DeveloperDetailDataWorkModeDtoListFromJson(Map<String, dynamic> json) {
	final DeveloperDetailDataWorkModeDtoList developerDetailDataWorkModeDtoList = DeveloperDetailDataWorkModeDtoList();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		developerDetailDataWorkModeDtoList.id = id;
	}
	final int? workDayMode = jsonConvert.convert<int>(json['workDayMode']);
	if (workDayMode != null) {
		developerDetailDataWorkModeDtoList.workDayMode = workDayMode;
	}
	final int? developerId = jsonConvert.convert<int>(json['developerId']);
	if (developerId != null) {
		developerDetailDataWorkModeDtoList.developerId = developerId;
	}
	final double? expectSalary = jsonConvert.convert<double>(json['expectSalary']);
	if (expectSalary != null) {
		developerDetailDataWorkModeDtoList.expectSalary = expectSalary;
	}
	final double? lowestSalary = jsonConvert.convert<double>(json['lowestSalary']);
	if (lowestSalary != null) {
		developerDetailDataWorkModeDtoList.lowestSalary = lowestSalary;
	}
	final double? highestSalary = jsonConvert.convert<double>(json['highestSalary']);
	if (highestSalary != null) {
		developerDetailDataWorkModeDtoList.highestSalary = highestSalary;
	}
	final dynamic hourlyPay = jsonConvert.convert<dynamic>(json['hourlyPay']);
	if (hourlyPay != null) {
		developerDetailDataWorkModeDtoList.hourlyPay = hourlyPay;
	}
	final String? workDayModeName = jsonConvert.convert<String>(json['workDayModeName']);
	if (workDayModeName != null) {
		developerDetailDataWorkModeDtoList.workDayModeName = workDayModeName;
	}
	final String? workDayModeDesc = jsonConvert.convert<String>(json['workDayModeDesc']);
	if (workDayModeDesc != null) {
		developerDetailDataWorkModeDtoList.workDayModeDesc = workDayModeDesc;
	}
	return developerDetailDataWorkModeDtoList;
}

Map<String, dynamic> $DeveloperDetailDataWorkModeDtoListToJson(DeveloperDetailDataWorkModeDtoList entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['workDayMode'] = entity.workDayMode;
	data['developerId'] = entity.developerId;
	data['expectSalary'] = entity.expectSalary;
	data['lowestSalary'] = entity.lowestSalary;
	data['highestSalary'] = entity.highestSalary;
	data['hourlyPay'] = entity.hourlyPay;
	data['workDayModeName'] = entity.workDayModeName;
	data['workDayModeDesc'] = entity.workDayModeDesc;
	return data;
}

DeveloperDetailDataEducationDtoList $DeveloperDetailDataEducationDtoListFromJson(Map<String, dynamic> json) {
	final DeveloperDetailDataEducationDtoList developerDetailDataEducationDtoList = DeveloperDetailDataEducationDtoList();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		developerDetailDataEducationDtoList.id = id;
	}
	final int? developerId = jsonConvert.convert<int>(json['developerId']);
	if (developerId != null) {
		developerDetailDataEducationDtoList.developerId = developerId;
	}
	final int? educationId = jsonConvert.convert<int>(json['educationId']);
	if (educationId != null) {
		developerDetailDataEducationDtoList.educationId = educationId;
	}
	final String? collegeName = jsonConvert.convert<String>(json['collegeName']);
	if (collegeName != null) {
		developerDetailDataEducationDtoList.collegeName = collegeName;
	}
	final String? major = jsonConvert.convert<String>(json['major']);
	if (major != null) {
		developerDetailDataEducationDtoList.major = major;
	}
	final String? inSchoolStartTime = jsonConvert.convert<String>(json['inSchoolStartTime']);
	if (inSchoolStartTime != null) {
		developerDetailDataEducationDtoList.inSchoolStartTime = inSchoolStartTime;
	}
	final String? inSchoolEndTime = jsonConvert.convert<String>(json['inSchoolEndTime']);
	if (inSchoolEndTime != null) {
		developerDetailDataEducationDtoList.inSchoolEndTime = inSchoolEndTime;
	}
	final int? trainingMode = jsonConvert.convert<int>(json['trainingMode']);
	if (trainingMode != null) {
		developerDetailDataEducationDtoList.trainingMode = trainingMode;
	}
	final String? educationName = jsonConvert.convert<String>(json['educationName']);
	if (educationName != null) {
		developerDetailDataEducationDtoList.educationName = educationName;
	}
	final String? trainingModeName = jsonConvert.convert<String>(json['trainingModeName']);
	if (trainingModeName != null) {
		developerDetailDataEducationDtoList.trainingModeName = trainingModeName;
	}
	return developerDetailDataEducationDtoList;
}

Map<String, dynamic> $DeveloperDetailDataEducationDtoListToJson(DeveloperDetailDataEducationDtoList entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['developerId'] = entity.developerId;
	data['educationId'] = entity.educationId;
	data['collegeName'] = entity.collegeName;
	data['major'] = entity.major;
	data['inSchoolStartTime'] = entity.inSchoolStartTime;
	data['inSchoolEndTime'] = entity.inSchoolEndTime;
	data['trainingMode'] = entity.trainingMode;
	data['educationName'] = entity.educationName;
	data['trainingModeName'] = entity.trainingModeName;
	return data;
}

DeveloperDetailDataProjectDtoList $DeveloperDetailDataProjectDtoListFromJson(Map<String, dynamic> json) {
	final DeveloperDetailDataProjectDtoList developerDetailDataProjectDtoList = DeveloperDetailDataProjectDtoList();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		developerDetailDataProjectDtoList.id = id;
	}
	final int? developerId = jsonConvert.convert<int>(json['developerId']);
	if (developerId != null) {
		developerDetailDataProjectDtoList.developerId = developerId;
	}
	final String? projectName = jsonConvert.convert<String>(json['projectName']);
	if (projectName != null) {
		developerDetailDataProjectDtoList.projectName = projectName;
	}
	final String? projectStartDate = jsonConvert.convert<String>(json['projectStartDate']);
	if (projectStartDate != null) {
		developerDetailDataProjectDtoList.projectStartDate = projectStartDate;
	}
	final String? projectEndDate = jsonConvert.convert<String>(json['projectEndDate']);
	if (projectEndDate != null) {
		developerDetailDataProjectDtoList.projectEndDate = projectEndDate;
	}
	final String? position = jsonConvert.convert<String>(json['position']);
	if (position != null) {
		developerDetailDataProjectDtoList.position = position;
	}
	final int? industryId = jsonConvert.convert<int>(json['industryId']);
	if (industryId != null) {
		developerDetailDataProjectDtoList.industryId = industryId;
	}
	final dynamic workMode = jsonConvert.convert<dynamic>(json['workMode']);
	if (workMode != null) {
		developerDetailDataProjectDtoList.workMode = workMode;
	}
	final String? description = jsonConvert.convert<String>(json['description']);
	if (description != null) {
		developerDetailDataProjectDtoList.description = description;
	}
	final String? companyName = jsonConvert.convert<String>(json['companyName']);
	if (companyName != null) {
		developerDetailDataProjectDtoList.companyName = companyName;
	}
	final dynamic workModeName = jsonConvert.convert<dynamic>(json['workModeName']);
	if (workModeName != null) {
		developerDetailDataProjectDtoList.workModeName = workModeName;
	}
	final List<DeveloperDetailDataProjectDtoListProjectSkillList>? projectSkillList = jsonConvert.convertListNotNull<DeveloperDetailDataProjectDtoListProjectSkillList>(json['projectSkillList']);
	if (projectSkillList != null) {
		developerDetailDataProjectDtoList.projectSkillList = projectSkillList;
	}
	final String? industryName = jsonConvert.convert<String>(json['industryName']);
	if (industryName != null) {
		developerDetailDataProjectDtoList.industryName = industryName;
	}
	return developerDetailDataProjectDtoList;
}

Map<String, dynamic> $DeveloperDetailDataProjectDtoListToJson(DeveloperDetailDataProjectDtoList entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['developerId'] = entity.developerId;
	data['projectName'] = entity.projectName;
	data['projectStartDate'] = entity.projectStartDate;
	data['projectEndDate'] = entity.projectEndDate;
	data['position'] = entity.position;
	data['industryId'] = entity.industryId;
	data['workMode'] = entity.workMode;
	data['description'] = entity.description;
	data['companyName'] = entity.companyName;
	data['workModeName'] = entity.workModeName;
	data['projectSkillList'] =  entity.projectSkillList?.map((v) => v.toJson()).toList();
	data['industryName'] = entity.industryName;
	return data;
}

DeveloperDetailDataProjectDtoListProjectSkillList $DeveloperDetailDataProjectDtoListProjectSkillListFromJson(Map<String, dynamic> json) {
	final DeveloperDetailDataProjectDtoListProjectSkillList developerDetailDataProjectDtoListProjectSkillList = DeveloperDetailDataProjectDtoListProjectSkillList();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		developerDetailDataProjectDtoListProjectSkillList.id = id;
	}
	final int? projectId = jsonConvert.convert<int>(json['projectId']);
	if (projectId != null) {
		developerDetailDataProjectDtoListProjectSkillList.projectId = projectId;
	}
	final int? skillId = jsonConvert.convert<int>(json['skillId']);
	if (skillId != null) {
		developerDetailDataProjectDtoListProjectSkillList.skillId = skillId;
	}
	final String? skillName = jsonConvert.convert<String>(json['skillName']);
	if (skillName != null) {
		developerDetailDataProjectDtoListProjectSkillList.skillName = skillName;
	}
	return developerDetailDataProjectDtoListProjectSkillList;
}

Map<String, dynamic> $DeveloperDetailDataProjectDtoListProjectSkillListToJson(DeveloperDetailDataProjectDtoListProjectSkillList entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['projectId'] = entity.projectId;
	data['skillId'] = entity.skillId;
	data['skillName'] = entity.skillName;
	return data;
}

DeveloperDetailDataWorkExperienceDtoList $DeveloperDetailDataWorkExperienceDtoListFromJson(Map<String, dynamic> json) {
	final DeveloperDetailDataWorkExperienceDtoList developerDetailDataWorkExperienceDtoList = DeveloperDetailDataWorkExperienceDtoList();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		developerDetailDataWorkExperienceDtoList.id = id;
	}
	final int? developerId = jsonConvert.convert<int>(json['developerId']);
	if (developerId != null) {
		developerDetailDataWorkExperienceDtoList.developerId = developerId;
	}
	final String? companyName = jsonConvert.convert<String>(json['companyName']);
	if (companyName != null) {
		developerDetailDataWorkExperienceDtoList.companyName = companyName;
	}
	final int? industryId = jsonConvert.convert<int>(json['industryId']);
	if (industryId != null) {
		developerDetailDataWorkExperienceDtoList.industryId = industryId;
	}
	final String? positionName = jsonConvert.convert<String>(json['positionName']);
	if (positionName != null) {
		developerDetailDataWorkExperienceDtoList.positionName = positionName;
	}
	final String? workStartTime = jsonConvert.convert<String>(json['workStartTime']);
	if (workStartTime != null) {
		developerDetailDataWorkExperienceDtoList.workStartTime = workStartTime;
	}
	final String? workEndTime = jsonConvert.convert<String>(json['workEndTime']);
	if (workEndTime != null) {
		developerDetailDataWorkExperienceDtoList.workEndTime = workEndTime;
	}
	final String? industryName = jsonConvert.convert<String>(json['industryName']);
	if (industryName != null) {
		developerDetailDataWorkExperienceDtoList.industryName = industryName;
	}
	return developerDetailDataWorkExperienceDtoList;
}

Map<String, dynamic> $DeveloperDetailDataWorkExperienceDtoListToJson(DeveloperDetailDataWorkExperienceDtoList entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['developerId'] = entity.developerId;
	data['companyName'] = entity.companyName;
	data['industryId'] = entity.industryId;
	data['positionName'] = entity.positionName;
	data['workStartTime'] = entity.workStartTime;
	data['workEndTime'] = entity.workEndTime;
	data['industryName'] = entity.industryName;
	return data;
}

DeveloperDetailDataDeveloperSkillDtoList $DeveloperDetailDataDeveloperSkillDtoListFromJson(Map<String, dynamic> json) {
	final DeveloperDetailDataDeveloperSkillDtoList developerDetailDataDeveloperSkillDtoList = DeveloperDetailDataDeveloperSkillDtoList();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		developerDetailDataDeveloperSkillDtoList.id = id;
	}
	final int? developerId = jsonConvert.convert<int>(json['developerId']);
	if (developerId != null) {
		developerDetailDataDeveloperSkillDtoList.developerId = developerId;
	}
	final int? skillId = jsonConvert.convert<int>(json['skillId']);
	if (skillId != null) {
		developerDetailDataDeveloperSkillDtoList.skillId = skillId;
	}
	final String? skillName = jsonConvert.convert<String>(json['skillName']);
	if (skillName != null) {
		developerDetailDataDeveloperSkillDtoList.skillName = skillName;
	}
	return developerDetailDataDeveloperSkillDtoList;
}

Map<String, dynamic> $DeveloperDetailDataDeveloperSkillDtoListToJson(DeveloperDetailDataDeveloperSkillDtoList entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['developerId'] = entity.developerId;
	data['skillId'] = entity.skillId;
	data['skillName'] = entity.skillName;
	return data;
}