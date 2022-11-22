// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'editprofile_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditProfileRequest _$EditProfileRequestFromJson(Map<String, dynamic> json) =>
    EditProfileRequest(
      json['updateIn'] as String?,
      json['name'] as String?,
      json['email'] as String?,
    );

Map<String, dynamic> _$EditProfileRequestToJson(EditProfileRequest instance) =>
    <String, dynamic>{
      'updateIn': instance.updateIn,
      'name': instance.name,
      'email': instance.email,
    };
