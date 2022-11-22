// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => LoginModel(
      json['id'] as String?,
      json['name'] as String?,
      json['password'] as String?,
      json['email'] as String?,
      json['image'] as String?,
      json['address'] as String?,
      json['city'] as String?,
      json['state'] as String?,
      json['zipcode'] as String?,
      json['addressType'] as String?,
      json['role'] as String?,
      (json['favourites'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['isActive'] as bool?,
      json['isUserDeleted'] as bool?,
      json['v'] as int?,
    );

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'password': instance.password,
      'email': instance.email,
      'image': instance.image,
      'address': instance.address,
      'city': instance.city,
      'state': instance.state,
      'zipcode': instance.zipcode,
      'addressType': instance.addressType,
      'role': instance.role,
      'favourites': instance.favourites,
      'isActive': instance.isActive,
      'isUserDeleted': instance.isUserDeleted,
      'v': instance.v,
    };
