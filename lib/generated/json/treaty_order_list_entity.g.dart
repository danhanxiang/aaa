import 'package:people_living_flutterdemo/generated/json/base/json_convert_content.dart';
import 'package:people_living_flutterdemo/core/models/FirmMineModel/treaty_order_list_entity.dart';

TreatyOrderListEntity $TreatyOrderListEntityFromJson(Map<String, dynamic> json) {
	final TreatyOrderListEntity treatyOrderListEntity = TreatyOrderListEntity();
	final TreatyOrderListData? data = jsonConvert.convert<TreatyOrderListData>(json['data']);
	if (data != null) {
		treatyOrderListEntity.data = data;
	}
	return treatyOrderListEntity;
}

Map<String, dynamic> $TreatyOrderListEntityToJson(TreatyOrderListEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['data'] = entity.data?.toJson();
	return data;
}

TreatyOrderListData $TreatyOrderListDataFromJson(Map<String, dynamic> json) {
	final TreatyOrderListData treatyOrderListData = TreatyOrderListData();
	final int? total = jsonConvert.convert<int>(json['total']);
	if (total != null) {
		treatyOrderListData.total = total;
	}
	final int? pageNum = jsonConvert.convert<int>(json['pageNum']);
	if (pageNum != null) {
		treatyOrderListData.pageNum = pageNum;
	}
	final List<TreatyOrderListDataList>? list = jsonConvert.convertListNotNull<TreatyOrderListDataList>(json['list']);
	if (list != null) {
		treatyOrderListData.list = list;
	}
	return treatyOrderListData;
}

Map<String, dynamic> $TreatyOrderListDataToJson(TreatyOrderListData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['total'] = entity.total;
	data['pageNum'] = entity.pageNum;
	data['list'] =  entity.list?.map((v) => v.toJson()).toList();
	return data;
}

TreatyOrderListDataList $TreatyOrderListDataListFromJson(Map<String, dynamic> json) {
	final TreatyOrderListDataList treatyOrderListDataList = TreatyOrderListDataList();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		treatyOrderListDataList.id = id;
	}
	final String? orderNo = jsonConvert.convert<String>(json['orderNo']);
	if (orderNo != null) {
		treatyOrderListDataList.orderNo = orderNo;
	}
	final int? orderStatus = jsonConvert.convert<int>(json['orderStatus']);
	if (orderStatus != null) {
		treatyOrderListDataList.orderStatus = orderStatus;
	}
	final String? orderStatusName = jsonConvert.convert<String>(json['orderStatusName']);
	if (orderStatusName != null) {
		treatyOrderListDataList.orderStatusName = orderStatusName;
	}
	final String? workStartDate = jsonConvert.convert<String>(json['workStartDate']);
	if (workStartDate != null) {
		treatyOrderListDataList.workStartDate = workStartDate;
	}
	final String? realName = jsonConvert.convert<String>(json['realName']);
	if (realName != null) {
		treatyOrderListDataList.realName = realName;
	}
	final String? workDaysModeName = jsonConvert.convert<String>(json['workDaysModeName']);
	if (workDaysModeName != null) {
		treatyOrderListDataList.workDaysModeName = workDaysModeName;
	}
	final String? careerDirectionName = jsonConvert.convert<String>(json['careerDirectionName']);
	if (careerDirectionName != null) {
		treatyOrderListDataList.careerDirectionName = careerDirectionName;
	}
	return treatyOrderListDataList;
}

Map<String, dynamic> $TreatyOrderListDataListToJson(TreatyOrderListDataList entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['orderNo'] = entity.orderNo;
	data['orderStatus'] = entity.orderStatus;
	data['orderStatusName'] = entity.orderStatusName;
	data['workStartDate'] = entity.workStartDate;
	data['realName'] = entity.realName;
	data['workDaysModeName'] = entity.workDaysModeName;
	data['careerDirectionName'] = entity.careerDirectionName;
	return data;
}