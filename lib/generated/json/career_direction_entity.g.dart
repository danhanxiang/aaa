import 'package:people_living_flutterdemo/generated/json/base/json_convert_content.dart';
import 'package:people_living_flutterdemo/core/models/FirmHomeModel/career_direction_entity.dart';

CareerDirectionEntity $CareerDirectionEntityFromJson(Map<String, dynamic> json) {
	final CareerDirectionEntity careerDirectionEntity = CareerDirectionEntity();
	final List<CareerDirectionData>? data = jsonConvert.convertListNotNull<CareerDirectionData>(json['data']);
	if (data != null) {
		careerDirectionEntity.data = data;
	}
	return careerDirectionEntity;
}

Map<String, dynamic> $CareerDirectionEntityToJson(CareerDirectionEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['data'] =  entity.data?.map((v) => v.toJson()).toList();
	return data;
}

CareerDirectionData $CareerDirectionDataFromJson(Map<String, dynamic> json) {
	final CareerDirectionData careerDirectionData = CareerDirectionData();
	final List<CareerDirectionDataChildren>? children = jsonConvert.convertListNotNull<CareerDirectionDataChildren>(json['children']);
	if (children != null) {
		careerDirectionData.children = children;
	}
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		careerDirectionData.id = id;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		careerDirectionData.name = name;
	}
	final int? parentId = jsonConvert.convert<int>(json['parentId']);
	if (parentId != null) {
		careerDirectionData.parentId = parentId;
	}
	final String? value = jsonConvert.convert<String>(json['value']);
	if (value != null) {
		careerDirectionData.value = value;
	}
	final String? text = jsonConvert.convert<String>(json['text']);
	if (text != null) {
		careerDirectionData.text = text;
	}
	return careerDirectionData;
}

Map<String, dynamic> $CareerDirectionDataToJson(CareerDirectionData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['children'] =  entity.children?.map((v) => v.toJson()).toList();
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['parentId'] = entity.parentId;
	data['value'] = entity.value;
	data['text'] = entity.text;
	return data;
}

CareerDirectionDataChildren $CareerDirectionDataChildrenFromJson(Map<String, dynamic> json) {
	final CareerDirectionDataChildren careerDirectionDataChildren = CareerDirectionDataChildren();
	final List<CareerDirectionDataChildrenChildren>? children = jsonConvert.convertListNotNull<CareerDirectionDataChildrenChildren>(json['children']);
	if (children != null) {
		careerDirectionDataChildren.children = children;
	}
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		careerDirectionDataChildren.id = id;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		careerDirectionDataChildren.name = name;
	}
	final int? parentId = jsonConvert.convert<int>(json['parentId']);
	if (parentId != null) {
		careerDirectionDataChildren.parentId = parentId;
	}
	return careerDirectionDataChildren;
}

Map<String, dynamic> $CareerDirectionDataChildrenToJson(CareerDirectionDataChildren entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['children'] =  entity.children?.map((v) => v.toJson()).toList();
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['parentId'] = entity.parentId;
	return data;
}

CareerDirectionDataChildrenChildren $CareerDirectionDataChildrenChildrenFromJson(Map<String, dynamic> json) {
	final CareerDirectionDataChildrenChildren careerDirectionDataChildrenChildren = CareerDirectionDataChildrenChildren();
	final dynamic children = jsonConvert.convert<dynamic>(json['children']);
	if (children != null) {
		careerDirectionDataChildrenChildren.children = children;
	}
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		careerDirectionDataChildrenChildren.id = id;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		careerDirectionDataChildrenChildren.name = name;
	}
	final int? parentId = jsonConvert.convert<int>(json['parentId']);
	if (parentId != null) {
		careerDirectionDataChildrenChildren.parentId = parentId;
	}
	return careerDirectionDataChildrenChildren;
}

Map<String, dynamic> $CareerDirectionDataChildrenChildrenToJson(CareerDirectionDataChildrenChildren entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['children'] = entity.children;
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['parentId'] = entity.parentId;
	return data;
}