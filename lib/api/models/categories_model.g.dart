// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoriesModel _$CategoriesModelFromJson(Map<String, dynamic> json) =>
    CategoriesModel(
      json['id'] as String?,
      json['name'] as String?,
      (json['image'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['isActive'] as bool?,
      json['v'] as int?,
    );

Map<String, dynamic> _$CategoriesModelToJson(CategoriesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'isActive': instance.isActive,
      'v': instance.v,
    };
