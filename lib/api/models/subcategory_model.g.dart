// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subcategory_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubCategoryModel _$SubCategoryModelFromJson(Map<String, dynamic> json) =>
    SubCategoryModel(
      id: json['id'] as String?,
      parentCategoryId: json['parentCategoryId'] == null
          ? null
          : ParentCategoryId.fromJson(
              json['parentCategoryId'] as Map<String, dynamic>),
      name: json['name'] as String?,
      description: json['description'] as String?,
      price: json['price'] as int?,
      measurements: json['measurements'] as String?,
      stock: json['stock'] as int?,
      minStock: json['minStock'] as int?,
      localDelieveryCharge: json['localDelieveryCharge'] as int?,
      nationalDelieveryCharge: json['nationalDelieveryCharge'] as int?,
      isActive: json['isActive'] as bool?,
      v: json['v'] as int?,
      maxOrderQuantity: json['maxOrderQuantity'] as int?,
      image:
          (json['image'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$SubCategoryModelToJson(SubCategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'parentCategoryId': instance.parentCategoryId,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'measurements': instance.measurements,
      'stock': instance.stock,
      'minStock': instance.minStock,
      'localDelieveryCharge': instance.localDelieveryCharge,
      'nationalDelieveryCharge': instance.nationalDelieveryCharge,
      'isActive': instance.isActive,
      'v': instance.v,
      'maxOrderQuantity': instance.maxOrderQuantity,
      'image': instance.image,
    };
