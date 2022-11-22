// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetailsModel _$ProductDetailsModelFromJson(Map<String, dynamic> json) =>
    ProductDetailsModel(
      json['id'] as String?,
      json['parentCategoryId'] as String?,
      json['name'] as String?,
      json['description'] as String?,
      (json['image'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['price'] as int?,
      json['measurements'] as String?,
      json['stock'] as int?,
      json['minStock'] as int?,
      json['localDelieveryCharge'] as int?,
      json['nationalDelieveryCharge'] as int?,
      json['isActive'] as bool?,
      json['v'] as int?,
      json['maxOrderQuantity'] as int?,
    );

Map<String, dynamic> _$ProductDetailsModelToJson(
        ProductDetailsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'parentCategoryId': instance.parentCategoryId,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'price': instance.price,
      'measurements': instance.measurements,
      'stock': instance.stock,
      'minStock': instance.minStock,
      'localDelieveryCharge': instance.localDelieveryCharge,
      'nationalDelieveryCharge': instance.nationalDelieveryCharge,
      'isActive': instance.isActive,
      'v': instance.v,
      'maxOrderQuantity': instance.maxOrderQuantity,
    };
