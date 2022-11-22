// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'placeorder_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceOrderRequest _$PlaceOrderRequestFromJson(Map<String, dynamic> json) =>
    PlaceOrderRequest(
      json['orderedItems'] as List<dynamic>,
      json['userId'] as String,
      json['quantity'] as int,
      json['totalOrderPrice'] as int,
    );

Map<String, dynamic> _$PlaceOrderRequestToJson(PlaceOrderRequest instance) =>
    <String, dynamic>{
      'orderedItems': instance.orderedItems,
      'userId': instance.userId,
      'quantity': instance.quantity,
      'totalOrderPrice': instance.totalOrderPrice,
    };
