import 'package:people_living_flutterdemo/generated/json/base/json_field.dart';
import 'package:people_living_flutterdemo/generated/json/dev_info_item_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class DevInfoItemEntity {
	DevInfoItemData? data;

	DevInfoItemEntity();

	factory DevInfoItemEntity.fromJson(Map<String, dynamic> json) => $DevInfoItemEntityFromJson(json);

	Map<String, dynamic> toJson() => $DevInfoItemEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class DevInfoItemData {
	int? total;
	int? pageNum;
	List<DevInfoItemDataList>? list;

	DevInfoItemData();

	factory DevInfoItemData.fromJson(Map<String, dynamic> json) => $DevInfoItemDataFromJson(json);

	Map<String, dynamic> toJson() => $DevInfoItemDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class DevInfoItemDataList {
	int? id;
	String? realName;
	String? mobile;
	String? avatarUrl;
	int? careerDirectionId;
	String? careerDirectionName;
	String? cityName;
	double? curSalary;
	int? workYearsId;
	String? workYearsName;
	String? skillName;
	double? expectSalary;
	int? workDayMode;
	String? workDayModeName;
	int? educationId;
	String? educationName;

	DevInfoItemDataList();

	factory DevInfoItemDataList.fromJson(Map<String, dynamic> json) => $DevInfoItemDataListFromJson(json);

	Map<String, dynamic> toJson() => $DevInfoItemDataListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}

  /// 标签字符串 转换为 string类型数组
  List<String> skillNameToList() {
    if (skillName != null && skillName!.isNotEmpty) {
      return skillName!.split(',');
    }else {
      return [];
    }
  }

}