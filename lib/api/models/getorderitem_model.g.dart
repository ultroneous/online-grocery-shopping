// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'getorderitem_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderedItem _$OrderedItemFromJson(Map<String, dynamic> json) => OrderedItem(
      json['itemId'] == null
          ? null
          : OrderItemId.fromJson(json['itemId'] as Map<String, dynamic>),
      json['itemQuantity'] as String?,
      json['id'] as String?,
    );

Map<String, dynamic> _$OrderedItemToJson(OrderedItem instance) =>
    <String, dynamic>{
      'itemId': instance.itemId,
      'itemQuantity': instance.itemQuantity,
      'id': instance.id,
    };
