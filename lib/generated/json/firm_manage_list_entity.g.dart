import 'package:people_living_flutterdemo/generated/json/base/json_convert_content.dart';
import 'package:people_living_flutterdemo/core/models/FirmMineModel/firm_manage_list_entity.dart';

FirmManageListEntity $FirmManageListEntityFromJson(Map<String, dynamic> json) {
	final FirmManageListEntity firmManageListEntity = FirmManageListEntity();
	final FirmManageListData? data = jsonConvert.convert<FirmManageListData>(json['data']);
	if (data != null) {
		firmManageListEntity.data = data;
	}
	return firmManageListEntity;
}

Map<String, dynamic> $FirmManageListEntityToJson(FirmManageListEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['data'] = entity.data?.toJson();
	return data;
}

FirmManageListData $FirmManageListDataFromJson(Map<String, dynamic> json) {
	final FirmManageListData firmManageListData = FirmManageListData();
	final int? total = jsonConvert.convert<int>(json['total']);
	if (total != null) {
		firmManageListData.total = total;
	}
	final int? pageNum = jsonConvert.convert<int>(json['pageNum']);
	if (pageNum != null) {
		firmManageListData.pageNum = pageNum;
	}
	final List<FirmManageListDataList>? list = jsonConvert.convertListNotNull<FirmManageListDataList>(json['list']);
	if (list != null) {
		firmManageListData.list = list;
	}
	return firmManageListData;
}

Map<String, dynamic> $FirmManageListDataToJson(FirmManageListData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['total'] = entity.total;
	data['pageNum'] = entity.pageNum;
	data['list'] =  entity.list?.map((v) => v.toJson()).toList();
	return data;
}

FirmManageListDataList $FirmManageListDataListFromJson(Map<String, dynamic> json) {
	final FirmManageListDataList firmManageListDataList = FirmManageListDataList();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		firmManageListDataList.id = id;
	}
	final dynamic realName = jsonConvert.convert<dynamic>(json['realName']);
	if (realName != null) {
		firmManageListDataList.realName = realName;
	}
	final String? positionName = jsonConvert.convert<String>(json['positionName']);
	if (positionName != null) {
		firmManageListDataList.positionName = positionName;
	}
	final String? mobile = jsonConvert.convert<String>(json['mobile']);
	if (mobile != null) {
		firmManageListDataList.mobile = mobile;
	}
	return firmManageListDataList;
}

Map<String, dynamic> $FirmManageListDataListToJson(FirmManageListDataList entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['realName'] = entity.realName;
	data['positionName'] = entity.positionName;
	data['mobile'] = entity.mobile;
	return data;
}