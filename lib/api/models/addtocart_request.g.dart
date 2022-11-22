// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addtocart_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddtoCartRequest _$AddtoCartRequestFromJson(Map<String, dynamic> json) =>
    AddtoCartRequest(
      json['itemId'] as String?,
      json['status'] as bool?,
    );

Map<String, dynamic> _$AddtoCartRequestToJson(AddtoCartRequest instance) =>
    <String, dynamic>{
      'itemId': instance.itemId,
      'status': instance.status,
    };
