// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_id_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemId _$ItemIdFromJson(Map<String, dynamic> json) => ItemId(
      json['id'] as String?,
      json['name'] as String?,
      (json['image'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['price'] as int?,
      json['measurements'] as String?,
    );

Map<String, dynamic> _$ItemIdToJson(ItemId instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'price': instance.price,
      'measurements': instance.measurements,
    };
