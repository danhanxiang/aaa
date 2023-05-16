import 'package:people_living_flutterdemo/generated/json/base/json_field.dart';
import 'package:people_living_flutterdemo/generated/json/account_wallet_list_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class AccountWalletListEntity {
	AccountWalletListData? data;

	AccountWalletListEntity();

	factory AccountWalletListEntity.fromJson(Map<String, dynamic> json) => $AccountWalletListEntityFromJson(json);

	Map<String, dynamic> toJson() => $AccountWalletListEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AccountWalletListData {
	int? total;
	int? pageNum;
	List<AccountWalletListDataList>? list;

	AccountWalletListData();

	factory AccountWalletListData.fromJson(Map<String, dynamic> json) => $AccountWalletListDataFromJson(json);

	Map<String, dynamic> toJson() => $AccountWalletListDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AccountWalletListDataList {
	int? id;
	int? companyId;
	double? money;
	double? afterBalance;
	String? createDate;
	int? changeType;
	int? orderId;
	String? remark;
	String? orderNo;

	AccountWalletListDataList();

	factory AccountWalletListDataList.fromJson(Map<String, dynamic> json) => $AccountWalletListDataListFromJson(json);

	Map<String, dynamic> toJson() => $AccountWalletListDataListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}