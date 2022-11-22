// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orderitem_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderedItemModel _$OrderedItemModelFromJson(Map<String, dynamic> json) =>
    OrderedItemModel(
      json['itemId'] as String?,
      json['itemQuantity'] as String?,
      json['id'] as String?,
    );

Map<String, dynamic> _$OrderedItemModelToJson(OrderedItemModel instance) =>
    <String, dynamic>{
      'itemId': instance.itemId,
      'itemQuantity': instance.itemQuantity,
      'id': instance.id,
    };
