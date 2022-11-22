// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itemid.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderItemId _$OrderItemIdFromJson(Map<String, dynamic> json) => OrderItemId(
      json['id'] as String?,
      json['name'] as String?,
      json['price'] as int?,
      (json['image'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$OrderItemIdToJson(OrderItemId instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'image': instance.image,
    };
