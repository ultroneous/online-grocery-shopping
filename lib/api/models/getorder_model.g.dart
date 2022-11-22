// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'getorder_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      json['id'] as String?,
      (json['orderedItems'] as List<dynamic>?)
          ?.map((e) => OrderedItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['orderedDate'] as String?,
      json['orderDelieveryDate'] as String?,
      json['orderStatus'] as String?,
      json['totalOrderPrice'] as int?,
      json['isOrderActive'] as bool?,
      json['v'] as int?,
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderedItems': instance.orderedItems,
      'orderedDate': instance.orderedDate,
      'orderDelieveryDate': instance.orderDelieveryDate,
      'orderStatus': instance.orderStatus,
      'totalOrderPrice': instance.totalOrderPrice,
      'isOrderActive': instance.isOrderActive,
      'v': instance.v,
    };
