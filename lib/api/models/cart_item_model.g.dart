// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartItem _$CartItemFromJson(Map<String, dynamic> json) => CartItem(
      json['itemId'] == null
          ? null
          : ItemId.fromJson(json['itemId'] as Map<String, dynamic>),
      json['itemQuantity'] as int?,
      json['id'] as String?,
    );

Map<String, dynamic> _$CartItemToJson(CartItem instance) => <String, dynamic>{
      'itemId': instance.itemId,
      'itemQuantity': instance.itemQuantity,
      'id': instance.id,
    };
