import 'package:people_living_flutterdemo/generated/json/base/json_field.dart';
import 'package:people_living_flutterdemo/generated/json/developer_detail_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class DeveloperDetailEntity {
	DeveloperDetailData? data;

	DeveloperDetailEntity();

	factory DeveloperDetailEntity.fromJson(Map<String, dynamic> json) => $DeveloperDetailEntityFromJson(json);

	Map<String, dynamic> toJson() => $DeveloperDetailEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class DeveloperDetailData {
	int? id;
	String? avatarUrl;
	String? mobile;
	String? nickName;
	String? realName;
	int? sex;
	String? birthday;
	int? provinceId;
	String? provinceName;
	int? cityId;
	String? cityName;
	int? areasId;
	String? areasName;
	int? remoteWorkReason;
	String? remoteWorkReasonStr;
	int? status;
	int? serviceStatus;
	dynamic serviceStatusName;
	dynamic channel;
	dynamic typeId;
	int? businessStatus;
	String? createDate;
	String? lastModifyDate;
	dynamic coverUrl;
	dynamic interviewStatus;
	dynamic interviewStatusName;
	dynamic contractStatus;
	int? ssoMemberId;
	dynamic recommend;
	dynamic recommendReason;
	dynamic resumeUrl;
	DeveloperDetailDataCareerDto? careerDto;
	List<DeveloperDetailDataWorkModeDtoList>? workModeDtoList;
	List<DeveloperDetailDataEducationDtoList>? educationDtoList;
	List<DeveloperDetailDataProjectDtoList>? projectDtoList;
	List<DeveloperDetailDataWorkExperienceDtoList>? workExperienceDtoList;
	List<DeveloperDetailDataDeveloperSkillDtoList>? developerSkillDtoList;

	DeveloperDetailData();

	factory DeveloperDetailData.fromJson(Map<String, dynamic> json) => $DeveloperDetailDataFromJson(json);

	Map<String, dynamic> toJson() => $DeveloperDetailDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}

  List<String> getTagTitle(){
    List<String> childArray = [];
    var list = developerSkillDtoList ?? [];
    if (list.isNotEmpty) {
      for (int i = 0; i < list.length; i++) {
        childArray.add(list[i].skillName?? '');
      }
    }
    return childArray;
  } 
}

@JsonSerializable()
class DeveloperDetailDataCareerDto {
	int? id;
	int? workYearsId;
	double? curSalary;
	int? developerId;
	int? careerDirectionId;
	String? careerDirectionName;
	String? workYearsName;

	DeveloperDetailDataCareerDto();

	factory DeveloperDetailDataCareerDto.fromJson(Map<String, dynamic> json) => $DeveloperDetailDataCareerDtoFromJson(json);

	Map<String, dynamic> toJson() => $DeveloperDetailDataCareerDtoToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class DeveloperDetailDataWorkModeDtoList {
	int? id;
	int? workDayMode;
	int? developerId;
	double? expectSalary;
	double? lowestSalary;
	double? highestSalary;
	dynamic hourlyPay;
	String? workDayModeName;
	String? workDayModeDesc;

	DeveloperDetailDataWorkModeDtoList();

	factory DeveloperDetailDataWorkModeDtoList.fromJson(Map<String, dynamic> json) => $DeveloperDetailDataWorkModeDtoListFromJson(json);

	Map<String, dynamic> toJson() => $DeveloperDetailDataWorkModeDtoListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class DeveloperDetailDataEducationDtoList {
	int? id;
	int? developerId;
	int? educationId;
	String? collegeName;
	String? major;
	String? inSchoolStartTime;
	String? inSchoolEndTime;
	int? trainingMode;
	String? educationName;
	String? trainingModeName;

	DeveloperDetailDataEducationDtoList();

	factory DeveloperDetailDataEducationDtoList.fromJson(Map<String, dynamic> json) => $DeveloperDetailDataEducationDtoListFromJson(json);

	Map<String, dynamic> toJson() => $DeveloperDetailDataEducationDtoListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class DeveloperDetailDataProjectDtoList {
	int? id;
	int? developerId;
	String? projectName;
	String? projectStartDate;
	String? projectEndDate;
	String? position;
	int? industryId;
	dynamic workMode;
	String? description;
	String? companyName;
	dynamic workModeName;
	List<DeveloperDetailDataProjectDtoListProjectSkillList>? projectSkillList;
	String? industryName;

	DeveloperDetailDataProjectDtoList();

	factory DeveloperDetailDataProjectDtoList.fromJson(Map<String, dynamic> json) => $DeveloperDetailDataProjectDtoListFromJson(json);

	Map<String, dynamic> toJson() => $DeveloperDetailDataProjectDtoListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}

  List<String> getTagTitle(){
    List<String> childArray = [];
    var list = projectSkillList ?? [];
    if (list.isNotEmpty) {
      for (int i = 0; i < list.length; i++) {
        childArray.add(list[i].skillName?? '');
      }
    }
    return childArray;
  }
}

@JsonSerializable()
class DeveloperDetailDataProjectDtoListProjectSkillList {
	int? id;
	int? projectId;
	int? skillId;
	String? skillName;

	DeveloperDetailDataProjectDtoListProjectSkillList();

	factory DeveloperDetailDataProjectDtoListProjectSkillList.fromJson(Map<String, dynamic> json) => $DeveloperDetailDataProjectDtoListProjectSkillListFromJson(json);

	Map<String, dynamic> toJson() => $DeveloperDetailDataProjectDtoListProjectSkillListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class DeveloperDetailDataWorkExperienceDtoList {
	int? id;
	int? developerId;
	String? companyName;
	int? industryId;
	String? positionName;
	String? workStartTime;
	String? workEndTime;
	String? industryName;

	DeveloperDetailDataWorkExperienceDtoList();

	factory DeveloperDetailDataWorkExperienceDtoList.fromJson(Map<String, dynamic> json) => $DeveloperDetailDataWorkExperienceDtoListFromJson(json);

	Map<String, dynamic> toJson() => $DeveloperDetailDataWorkExperienceDtoListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class DeveloperDetailDataDeveloperSkillDtoList {
	int? id;
	int? developerId;
	int? skillId;
	String? skillName;

	DeveloperDetailDataDeveloperSkillDtoList();

	factory DeveloperDetailDataDeveloperSkillDtoList.fromJson(Map<String, dynamic> json) => $DeveloperDetailDataDeveloperSkillDtoListFromJson(json);

	Map<String, dynamic> toJson() => $DeveloperDetailDataDeveloperSkillDtoListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}