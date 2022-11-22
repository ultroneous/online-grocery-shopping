// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserValues _$UserValuesFromJson(Map<String, dynamic> json) => UserValues(
      json['id'] as String?,
      json['userId'] as String?,
      (json['cartItems'] as List<dynamic>?)
          ?.map((e) => CartItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['v'] as int?,
    );

Map<String, dynamic> _$UserValuesToJson(UserValues instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'cartItems': instance.cartItems,
      'v': instance.v,
    };
