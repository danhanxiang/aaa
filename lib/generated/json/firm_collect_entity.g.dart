import 'package:people_living_flutterdemo/generated/json/base/json_convert_content.dart';
import 'package:people_living_flutterdemo/core/models/FirmCollectModel/firm_collect_entity.dart';

FirmCollectEntity $FirmCollectEntityFromJson(Map<String, dynamic> json) {
	final FirmCollectEntity firmCollectEntity = FirmCollectEntity();
	final FirmCollectData? data = jsonConvert.convert<FirmCollectData>(json['data']);
	if (data != null) {
		firmCollectEntity.data = data;
	}
	return firmCollectEntity;
}

Map<String, dynamic> $FirmCollectEntityToJson(FirmCollectEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['data'] = entity.data?.toJson();
	return data;
}

FirmCollectData $FirmCollectDataFromJson(Map<String, dynamic> json) {
	final FirmCollectData firmCollectData = FirmCollectData();
	final List<FirmCollectDataList>? list = jsonConvert.convertListNotNull<FirmCollectDataList>(json['list']);
	if (list != null) {
		firmCollectData.list = list;
	}
	final int? pageNum = jsonConvert.convert<int>(json['pageNum']);
	if (pageNum != null) {
		firmCollectData.pageNum = pageNum;
	}
	final int? total = jsonConvert.convert<int>(json['total']);
	if (total != null) {
		firmCollectData.total = total;
	}
	return firmCollectData;
}

Map<String, dynamic> $FirmCollectDataToJson(FirmCollectData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['list'] =  entity.list?.map((v) => v.toJson()).toList();
	data['pageNum'] = entity.pageNum;
	data['total'] = entity.total;
	return data;
}

FirmCollectDataList $FirmCollectDataListFromJson(Map<String, dynamic> json) {
	final FirmCollectDataList firmCollectDataList = FirmCollectDataList();
	final String? avatarUrl = jsonConvert.convert<String>(json['avatarUrl']);
	if (avatarUrl != null) {
		firmCollectDataList.avatarUrl = avatarUrl;
	}
	final String? careerDirectionName = jsonConvert.convert<String>(json['careerDirectionName']);
	if (careerDirectionName != null) {
		firmCollectDataList.careerDirectionName = careerDirectionName;
	}
	final int? developerId = jsonConvert.convert<int>(json['developerId']);
	if (developerId != null) {
		firmCollectDataList.developerId = developerId;
	}
	final String? education = jsonConvert.convert<String>(json['education']);
	if (education != null) {
		firmCollectDataList.education = education;
	}
	final double? expectSalary = jsonConvert.convert<double>(json['expectSalary']);
	if (expectSalary != null) {
		firmCollectDataList.expectSalary = expectSalary;
	}
	final String? realName = jsonConvert.convert<String>(json['realName']);
	if (realName != null) {
		firmCollectDataList.realName = realName;
	}
	final List<String>? skillNameList = jsonConvert.convertListNotNull<String>(json['skillNameList']);
	if (skillNameList != null) {
		firmCollectDataList.skillNameList = skillNameList;
	}
	final int? status = jsonConvert.convert<int>(json['status']);
	if (status != null) {
		firmCollectDataList.status = status;
	}
	final String? workMode = jsonConvert.convert<String>(json['workMode']);
	if (workMode != null) {
		firmCollectDataList.workMode = workMode;
	}
	final String? workYears = jsonConvert.convert<String>(json['workYears']);
	if (workYears != null) {
		firmCollectDataList.workYears = workYears;
	}
	return firmCollectDataList;
}

Map<String, dynamic> $FirmCollectDataListToJson(FirmCollectDataList entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['avatarUrl'] = entity.avatarUrl;
	data['careerDirectionName'] = entity.careerDirectionName;
	data['developerId'] = entity.developerId;
	data['education'] = entity.education;
	data['expectSalary'] = entity.expectSalary;
	data['realName'] = entity.realName;
	data['skillNameList'] =  entity.skillNameList;
	data['status'] = entity.status;
	data['workMode'] = entity.workMode;
	data['workYears'] = entity.workYears;
	return data;
}