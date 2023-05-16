import 'package:people_living_flutterdemo/generated/json/base/json_field.dart';
import 'package:people_living_flutterdemo/generated/json/firm_recommend_bean_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class FirmRecommendBeanEntity {
	FirmRecommendBeanData? data;

	FirmRecommendBeanEntity();

	factory FirmRecommendBeanEntity.fromJson(Map<String, dynamic> json) => $FirmRecommendBeanEntityFromJson(json);

	Map<String, dynamic> toJson() => $FirmRecommendBeanEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class FirmRecommendBeanData {
	int? total;
	int? pageNum;
	List<FirmRecommendBeanDataList>? list;

	FirmRecommendBeanData();

	factory FirmRecommendBeanData.fromJson(Map<String, dynamic> json) => $FirmRecommendBeanDataFromJson(json);

	Map<String, dynamic> toJson() => $FirmRecommendBeanDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class FirmRecommendBeanDataList {
	int? id;
	String? realName;
	String? avatarUrl;
	String? careerDirectionName;
	String? workYearsName;
	String? educationName;
	String? trainingModeName;
	dynamic recommendReason;
	dynamic interviewStatusName;
	bool? isOperationRecommendation;
	dynamic interviewStatus;
	int? positionId;
	double? expectSalary;
	String? createDate;
	int? tag;
	int? skillMatchNum;
	List<FirmRecommendBeanDataListDeveloperSkillMatchDto>? developerSkillMatchDto;

	FirmRecommendBeanDataList();

	factory FirmRecommendBeanDataList.fromJson(Map<String, dynamic> json) => $FirmRecommendBeanDataListFromJson(json);

	Map<String, dynamic> toJson() => $FirmRecommendBeanDataListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class FirmRecommendBeanDataListDeveloperSkillMatchDto {
	int? skillId;
	String? skillName;
	bool? matchStatus;

	FirmRecommendBeanDataListDeveloperSkillMatchDto();

	factory FirmRecommendBeanDataListDeveloperSkillMatchDto.fromJson(Map<String, dynamic> json) => $FirmRecommendBeanDataListDeveloperSkillMatchDtoFromJson(json);

	Map<String, dynamic> toJson() => $FirmRecommendBeanDataListDeveloperSkillMatchDtoToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}