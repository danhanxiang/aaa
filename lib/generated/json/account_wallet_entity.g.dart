import 'package:people_living_flutterdemo/generated/json/base/json_convert_content.dart';
import 'package:people_living_flutterdemo/core/models/FirmMineModel/account_wallet_entity.dart';

AccountWalletEntity $AccountWalletEntityFromJson(Map<String, dynamic> json) {
	final AccountWalletEntity accountWalletEntity = AccountWalletEntity();
	final AccountWalletData? data = jsonConvert.convert<AccountWalletData>(json['data']);
	if (data != null) {
		accountWalletEntity.data = data;
	}
	return accountWalletEntity;
}

Map<String, dynamic> $AccountWalletEntityToJson(AccountWalletEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['data'] = entity.data.toJson();
	return data;
}

AccountWalletData $AccountWalletDataFromJson(Map<String, dynamic> json) {
	final AccountWalletData accountWalletData = AccountWalletData();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		accountWalletData.id = id;
	}
	final double? balance = jsonConvert.convert<double>(json['balance']);
	if (balance != null) {
		accountWalletData.balance = balance;
	}
	final double? availableMoney = jsonConvert.convert<double>(json['availableMoney']);
	if (availableMoney != null) {
		accountWalletData.availableMoney = availableMoney;
	}
	final double? freezeMoney = jsonConvert.convert<double>(json['freezeMoney']);
	if (freezeMoney != null) {
		accountWalletData.freezeMoney = freezeMoney;
	}
	final String? rechargeDate = jsonConvert.convert<String>(json['rechargeDate']);
	if (rechargeDate != null) {
		accountWalletData.rechargeDate = rechargeDate;
	}
	final dynamic walletStatus = jsonConvert.convert<dynamic>(json['walletStatus']);
	if (walletStatus != null) {
		accountWalletData.walletStatus = walletStatus;
	}
	return accountWalletData;
}

Map<String, dynamic> $AccountWalletDataToJson(AccountWalletData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['balance'] = entity.balance;
	data['availableMoney'] = entity.availableMoney;
	data['freezeMoney'] = entity.freezeMoney;
	data['rechargeDate'] = entity.rechargeDate;
	data['walletStatus'] = entity.walletStatus;
	return data;
}