import 'package:people_living_flutterdemo/generated/json/base/json_field.dart';
import 'package:people_living_flutterdemo/generated/json/firm_collect_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class FirmCollectEntity {
	FirmCollectData? data;

	FirmCollectEntity();

	factory FirmCollectEntity.fromJson(Map<String, dynamic> json) => $FirmCollectEntityFromJson(json);

	Map<String, dynamic> toJson() => $FirmCollectEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class FirmCollectData {
	List<FirmCollectDataList>? list;
	int? pageNum;
	int? total;

	FirmCollectData();

	factory FirmCollectData.fromJson(Map<String, dynamic> json) => $FirmCollectDataFromJson(json);

	Map<String, dynamic> toJson() => $FirmCollectDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class FirmCollectDataList {
	String? avatarUrl;
	String? careerDirectionName;
	int? developerId;
	String? education;
	double? expectSalary;
	String? realName;
	List<String>? skillNameList;
	int? status;
	String? workMode;
	String? workYears;

	FirmCollectDataList();

	factory FirmCollectDataList.fromJson(Map<String, dynamic> json) => $FirmCollectDataListFromJson(json);

	Map<String, dynamic> toJson() => $FirmCollectDataListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}

  /// 只获取4个标签
  List<String> addSkillNameList() {
    List<String> list = [];
    if (skillNameList!= null && skillNameList!.length > 4) {
      list.addAll(skillNameList!.getRange(0, 4));
    }else {
      list.addAll(skillNameList!);
    }
    return list;
  }
}