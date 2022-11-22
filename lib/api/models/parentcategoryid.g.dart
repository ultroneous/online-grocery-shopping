// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parentcategoryid.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParentCategoryId _$ParentCategoryIdFromJson(Map<String, dynamic> json) =>
    ParentCategoryId(
      id: json['id'] as String?,
      name: json['name'] as String?,
      image:
          (json['image'] as List<dynamic>?)?.map((e) => e as String).toList(),
      isActive: json['isActive'] as bool?,
      v: json['v'] as int?,
    );

Map<String, dynamic> _$ParentCategoryIdToJson(ParentCategoryId instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'isActive': instance.isActive,
      'v': instance.v,
    };
