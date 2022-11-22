// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'placeorder_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceOrderModel _$PlaceOrderModelFromJson(Map<String, dynamic> json) =>
    PlaceOrderModel(
      (json['orderedItems'] as List<dynamic>?)
          ?.map((e) => OrderedItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['userId'] as String?,
      json['orderedDate'] == null
          ? null
          : DateTime.parse(json['orderedDate'] as String),
      json['orderDelieveryDate'] == null
          ? null
          : DateTime.parse(json['orderDelieveryDate'] as String),
      json['orderStatus'] as String?,
      json['totalOrderPrice'] as int?,
      json['isOrderActive'] as bool?,
      json['id'] as String?,
      json['v'] as int?,
    );

Map<String, dynamic> _$PlaceOrderModelToJson(PlaceOrderModel instance) =>
    <String, dynamic>{
      'orderedItems': instance.orderedItems,
      'userId': instance.userId,
      'orderedDate': instance.orderedDate?.toIso8601String(),
      'orderDelieveryDate': instance.orderDelieveryDate?.toIso8601String(),
      'orderStatus': instance.orderStatus,
      'totalOrderPrice': instance.totalOrderPrice,
      'isOrderActive': instance.isOrderActive,
      'id': instance.id,
      'v': instance.v,
    };
