// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartResponse _$CartResponseFromJson(Map<String, dynamic> json) => CartResponse(
      json['userValues'] == null
          ? null
          : UserValues.fromJson(json['userValues'] as Map<String, dynamic>),
    )
      ..status = json['status'] as String
      ..message = json['message'] as String
      ..token = json['token'] as String;

Map<String, dynamic> _$CartResponseToJson(CartResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'token': instance.token,
      'userValues': instance.userValues,
    };
