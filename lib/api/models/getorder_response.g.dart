// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'getorder_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetOrderResponse _$GetOrderResponseFromJson(Map<String, dynamic> json) =>
    GetOrderResponse(
      (json['userValues'] as List<dynamic>?)
          ?.map((e) => OrderModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..status = json['status'] as String
      ..message = json['message'] as String
      ..token = json['token'] as String;

Map<String, dynamic> _$GetOrderResponseToJson(GetOrderResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'token': instance.token,
      'userValues': instance.userValues,
    };
