import 'package:people_living_flutterdemo/generated/json/base/json_convert_content.dart';
import 'package:people_living_flutterdemo/core/models/FirmHomeModel/dev_info_item_entity.dart';

DevInfoItemEntity $DevInfoItemEntityFromJson(Map<String, dynamic> json) {
	final DevInfoItemEntity devInfoItemEntity = DevInfoItemEntity();
	final DevInfoItemData? data = jsonConvert.convert<DevInfoItemData>(json['data']);
	if (data != null) {
		devInfoItemEntity.data = data;
	}
	return devInfoItemEntity;
}

Map<String, dynamic> $DevInfoItemEntityToJson(DevInfoItemEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['data'] = entity.data?.toJson();
	return data;
}

DevInfoItemData $DevInfoItemDataFromJson(Map<String, dynamic> json) {
	final DevInfoItemData devInfoItemData = DevInfoItemData();
	final int? total = jsonConvert.convert<int>(json['total']);
	if (total != null) {
		devInfoItemData.total = total;
	}
	final int? pageNum = jsonConvert.convert<int>(json['pageNum']);
	if (pageNum != null) {
		devInfoItemData.pageNum = pageNum;
	}
	final List<DevInfoItemDataList>? list = jsonConvert.convertListNotNull<DevInfoItemDataList>(json['list']);
	if (list != null) {
		devInfoItemData.list = list;
	}
	return devInfoItemData;
}

Map<String, dynamic> $DevInfoItemDataToJson(DevInfoItemData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['total'] = entity.total;
	data['pageNum'] = entity.pageNum;
	data['list'] =  entity.list?.map((v) => v.toJson()).toList();
	return data;
}

DevInfoItemDataList $DevInfoItemDataListFromJson(Map<String, dynamic> json) {
	final DevInfoItemDataList devInfoItemDataList = DevInfoItemDataList();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		devInfoItemDataList.id = id;
	}
	final String? realName = jsonConvert.convert<String>(json['realName']);
	if (realName != null) {
		devInfoItemDataList.realName = realName;
	}
	final String? mobile = jsonConvert.convert<String>(json['mobile']);
	if (mobile != null) {
		devInfoItemDataList.mobile = mobile;
	}
	final String? avatarUrl = jsonConvert.convert<String>(json['avatarUrl']);
	if (avatarUrl != null) {
		devInfoItemDataList.avatarUrl = avatarUrl;
	}
	final int? careerDirectionId = jsonConvert.convert<int>(json['careerDirectionId']);
	if (careerDirectionId != null) {
		devInfoItemDataList.careerDirectionId = careerDirectionId;
	}
	final String? careerDirectionName = jsonConvert.convert<String>(json['careerDirectionName']);
	if (careerDirectionName != null) {
		devInfoItemDataList.careerDirectionName = careerDirectionName;
	}
	final String? cityName = jsonConvert.convert<String>(json['cityName']);
	if (cityName != null) {
		devInfoItemDataList.cityName = cityName;
	}
	final double? curSalary = jsonConvert.convert<double>(json['curSalary']);
	if (curSalary != null) {
		devInfoItemDataList.curSalary = curSalary;
	}
	final int? workYearsId = jsonConvert.convert<int>(json['workYearsId']);
	if (workYearsId != null) {
		devInfoItemDataList.workYearsId = workYearsId;
	}
	final String? workYearsName = jsonConvert.convert<String>(json['workYearsName']);
	if (workYearsName != null) {
		devInfoItemDataList.workYearsName = workYearsName;
	}
	final String? skillName = jsonConvert.convert<String>(json['skillName']);
	if (skillName != null) {
		devInfoItemDataList.skillName = skillName;
	}
	final double? expectSalary = jsonConvert.convert<double>(json['expectSalary']);
	if (expectSalary != null) {
		devInfoItemDataList.expectSalary = expectSalary;
	}
	final int? workDayMode = jsonConvert.convert<int>(json['workDayMode']);
	if (workDayMode != null) {
		devInfoItemDataList.workDayMode = workDayMode;
	}
	final String? workDayModeName = jsonConvert.convert<String>(json['workDayModeName']);
	if (workDayModeName != null) {
		devInfoItemDataList.workDayModeName = workDayModeName;
	}
	final int? educationId = jsonConvert.convert<int>(json['educationId']);
	if (educationId != null) {
		devInfoItemDataList.educationId = educationId;
	}
	final String? educationName = jsonConvert.convert<String>(json['educationName']);
	if (educationName != null) {
		devInfoItemDataList.educationName = educationName;
	}
	return devInfoItemDataList;
}

Map<String, dynamic> $DevInfoItemDataListToJson(DevInfoItemDataList entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['realName'] = entity.realName;
	data['mobile'] = entity.mobile;
	data['avatarUrl'] = entity.avatarUrl;
	data['careerDirectionId'] = entity.careerDirectionId;
	data['careerDirectionName'] = entity.careerDirectionName;
	data['cityName'] = entity.cityName;
	data['curSalary'] = entity.curSalary;
	data['workYearsId'] = entity.workYearsId;
	data['workYearsName'] = entity.workYearsName;
	data['skillName'] = entity.skillName;
	data['expectSalary'] = entity.expectSalary;
	data['workDayMode'] = entity.workDayMode;
	data['workDayModeName'] = entity.workDayModeName;
	data['educationId'] = entity.educationId;
	data['educationName'] = entity.educationName;
	return data;
}