import 'package:people_living_flutterdemo/generated/json/base/json_convert_content.dart';
import 'package:people_living_flutterdemo/core/models/FirmMineModel/account_wallet_list_entity.dart';

AccountWalletListEntity $AccountWalletListEntityFromJson(Map<String, dynamic> json) {
	final AccountWalletListEntity accountWalletListEntity = AccountWalletListEntity();
	final AccountWalletListData? data = jsonConvert.convert<AccountWalletListData>(json['data']);
	if (data != null) {
		accountWalletListEntity.data = data;
	}
	return accountWalletListEntity;
}

Map<String, dynamic> $AccountWalletListEntityToJson(AccountWalletListEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['data'] = entity.data?.toJson();
	return data;
}

AccountWalletListData $AccountWalletListDataFromJson(Map<String, dynamic> json) {
	final AccountWalletListData accountWalletListData = AccountWalletListData();
	final int? total = jsonConvert.convert<int>(json['total']);
	if (total != null) {
		accountWalletListData.total = total;
	}
	final int? pageNum = jsonConvert.convert<int>(json['pageNum']);
	if (pageNum != null) {
		accountWalletListData.pageNum = pageNum;
	}
	final List<AccountWalletListDataList>? list = jsonConvert.convertListNotNull<AccountWalletListDataList>(json['list']);
	if (list != null) {
		accountWalletListData.list = list;
	}
	return accountWalletListData;
}

Map<String, dynamic> $AccountWalletListDataToJson(AccountWalletListData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['total'] = entity.total;
	data['pageNum'] = entity.pageNum;
	data['list'] =  entity.list?.map((v) => v.toJson()).toList();
	return data;
}

AccountWalletListDataList $AccountWalletListDataListFromJson(Map<String, dynamic> json) {
	final AccountWalletListDataList accountWalletListDataList = AccountWalletListDataList();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		accountWalletListDataList.id = id;
	}
	final int? companyId = jsonConvert.convert<int>(json['companyId']);
	if (companyId != null) {
		accountWalletListDataList.companyId = companyId;
	}
	final double? money = jsonConvert.convert<double>(json['money']);
	if (money != null) {
		accountWalletListDataList.money = money;
	}
	final double? afterBalance = jsonConvert.convert<double>(json['afterBalance']);
	if (afterBalance != null) {
		accountWalletListDataList.afterBalance = afterBalance;
	}
	final String? createDate = jsonConvert.convert<String>(json['createDate']);
	if (createDate != null) {
		accountWalletListDataList.createDate = createDate;
	}
	final int? changeType = jsonConvert.convert<int>(json['changeType']);
	if (changeType != null) {
		accountWalletListDataList.changeType = changeType;
	}
	final int? orderId = jsonConvert.convert<int>(json['orderId']);
	if (orderId != null) {
		accountWalletListDataList.orderId = orderId;
	}
	final String? remark = jsonConvert.convert<String>(json['remark']);
	if (remark != null) {
		accountWalletListDataList.remark = remark;
	}
	final String? orderNo = jsonConvert.convert<String>(json['orderNo']);
	if (orderNo != null) {
		accountWalletListDataList.orderNo = orderNo;
	}
	return accountWalletListDataList;
}

Map<String, dynamic> $AccountWalletListDataListToJson(AccountWalletListDataList entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['companyId'] = entity.companyId;
	data['money'] = entity.money;
	data['afterBalance'] = entity.afterBalance;
	data['createDate'] = entity.createDate;
	data['changeType'] = entity.changeType;
	data['orderId'] = entity.orderId;
	data['remark'] = entity.remark;
	data['orderNo'] = entity.orderNo;
	return data;
}