import 'package:people_living_flutterdemo/generated/json/base/json_field.dart';
import 'package:people_living_flutterdemo/generated/json/account_wallet_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class AccountWalletEntity {
	late AccountWalletData data;

	AccountWalletEntity();

	factory AccountWalletEntity.fromJson(Map<String, dynamic> json) => $AccountWalletEntityFromJson(json);

	Map<String, dynamic> toJson() => $AccountWalletEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AccountWalletData {
	late int id;
	late double balance;
	late double availableMoney;
	late double freezeMoney;
	late String rechargeDate;
	dynamic walletStatus;

	AccountWalletData();

	factory AccountWalletData.fromJson(Map<String, dynamic> json) => $AccountWalletDataFromJson(json);

	Map<String, dynamic> toJson() => $AccountWalletDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}