import 'package:people_living_flutterdemo/generated/json/base/json_convert_content.dart';
import 'package:people_living_flutterdemo/core/models/FirmCollectModel/collect_status_entity.dart';

CollectStatusEntity $CollectStatusEntityFromJson(Map<String, dynamic> json) {
	final CollectStatusEntity collectStatusEntity = CollectStatusEntity();
	final bool? data = jsonConvert.convert<bool>(json['data']);
	if (data != null) {
		collectStatusEntity.data = data;
	}
	return collectStatusEntity;
}

Map<String, dynamic> $CollectStatusEntityToJson(CollectStatusEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['data'] = entity.data;
	return data;
}