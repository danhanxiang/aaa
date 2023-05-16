// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'position_item_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Position_item_list _$Position_item_listFromJson(Map<String, dynamic> json) =>
    Position_item_list()
      ..total = json['total'] as num
      ..pageNum = json['pageNum'] as num
      ..list = (json['list'] as List<dynamic>?)
          ?.map((e) => Position_item.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$Position_item_listToJson(Position_item_list instance) =>
    <String, dynamic>{
      'total': instance.total,
      'pageNum': instance.pageNum,
      'list': instance.list,
    };
