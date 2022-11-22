// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'placeorder_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceorderResponse _$PlaceorderResponseFromJson(Map<String, dynamic> json) =>
    PlaceorderResponse(
      PlaceOrderModel.fromJson(json['userValues'] as Map<String, dynamic>),
    )
      ..status = json['status'] as String
      ..message = json['message'] as String
      ..token = json['token'] as String;

Map<String, dynamic> _$PlaceorderResponseToJson(PlaceorderResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'token': instance.token,
      'userValues': instance.userValues,
    };
