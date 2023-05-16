import 'package:people_living_flutterdemo/generated/json/base/json_convert_content.dart';
import 'package:people_living_flutterdemo/core/models/FirmMineModel/audition_item_list_entity.dart';

AuditionItemListEntity $AuditionItemListEntityFromJson(Map<String, dynamic> json) {
	final AuditionItemListEntity auditionItemListEntity = AuditionItemListEntity();
	final int? code = jsonConvert.convert<int>(json['code']);
	if (code != null) {
		auditionItemListEntity.code = code;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		auditionItemListEntity.message = message;
	}
	final AuditionItemListData? data = jsonConvert.convert<AuditionItemListData>(json['data']);
	if (data != null) {
		auditionItemListEntity.data = data;
	}
	return auditionItemListEntity;
}

Map<String, dynamic> $AuditionItemListEntityToJson(AuditionItemListEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['code'] = entity.code;
	data['message'] = entity.message;
	data['data'] = entity.data?.toJson();
	return data;
}

AuditionItemListData $AuditionItemListDataFromJson(Map<String, dynamic> json) {
	final AuditionItemListData auditionItemListData = AuditionItemListData();
	final int? total = jsonConvert.convert<int>(json['total']);
	if (total != null) {
		auditionItemListData.total = total;
	}
	final int? pageNum = jsonConvert.convert<int>(json['pageNum']);
	if (pageNum != null) {
		auditionItemListData.pageNum = pageNum;
	}
	final List<AuditionItemListDataList>? list = jsonConvert.convertListNotNull<AuditionItemListDataList>(json['list']);
	if (list != null) {
		auditionItemListData.list = list;
	}
	return auditionItemListData;
}

Map<String, dynamic> $AuditionItemListDataToJson(AuditionItemListData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['total'] = entity.total;
	data['pageNum'] = entity.pageNum;
	data['list'] =  entity.list?.map((v) => v.toJson()).toList();
	return data;
}

AuditionItemListDataList $AuditionItemListDataListFromJson(Map<String, dynamic> json) {
	final AuditionItemListDataList auditionItemListDataList = AuditionItemListDataList();
	final int? developerId = jsonConvert.convert<int>(json['developerId']);
	if (developerId != null) {
		auditionItemListDataList.developerId = developerId;
	}
	final int? positionId = jsonConvert.convert<int>(json['positionId']);
	if (positionId != null) {
		auditionItemListDataList.positionId = positionId;
	}
	final int? interviewId = jsonConvert.convert<int>(json['interviewId']);
	if (interviewId != null) {
		auditionItemListDataList.interviewId = interviewId;
	}
	final String? interviewStartDate = jsonConvert.convert<String>(json['interviewStartDate']);
	if (interviewStartDate != null) {
		auditionItemListDataList.interviewStartDate = interviewStartDate;
	}
	final String? interviewEndDate = jsonConvert.convert<String>(json['interviewEndDate']);
	if (interviewEndDate != null) {
		auditionItemListDataList.interviewEndDate = interviewEndDate;
	}
	final String? realName = jsonConvert.convert<String>(json['realName']);
	if (realName != null) {
		auditionItemListDataList.realName = realName;
	}
	final String? title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		auditionItemListDataList.title = title;
	}
	final int? meetingCode = jsonConvert.convert<int>(json['meetingCode']);
	if (meetingCode != null) {
		auditionItemListDataList.meetingCode = meetingCode;
	}
	final String? meetingUrl = jsonConvert.convert<String>(json['meetingUrl']);
	if (meetingUrl != null) {
		auditionItemListDataList.meetingUrl = meetingUrl;
	}
	final String? dayType = jsonConvert.convert<String>(json['dayType']);
	if (dayType != null) {
		auditionItemListDataList.dayType = dayType;
	}
	final String? developerName = jsonConvert.convert<String>(json['developerName']);
	if (developerName != null) {
		auditionItemListDataList.developerName = developerName;
	}
	final String? positionName = jsonConvert.convert<String>(json['positionName']);
	if (positionName != null) {
		auditionItemListDataList.positionName = positionName;
	}
	return auditionItemListDataList;
}

Map<String, dynamic> $AuditionItemListDataListToJson(AuditionItemListDataList entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['developerId'] = entity.developerId;
	data['positionId'] = entity.positionId;
	data['interviewId'] = entity.interviewId;
	data['interviewStartDate'] = entity.interviewStartDate;
	data['interviewEndDate'] = entity.interviewEndDate;
	data['realName'] = entity.realName;
	data['title'] = entity.title;
	data['meetingCode'] = entity.meetingCode;
	data['meetingUrl'] = entity.meetingUrl;
	data['dayType'] = entity.dayType;
	data['developerName'] = entity.developerName;
	data['positionName'] = entity.positionName;
	return data;
}