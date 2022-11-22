// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resetPassword_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetPasswordRequest _$ResetPasswordRequestFromJson(
        Map<String, dynamic> json) =>
    ResetPasswordRequest(
      json['id'] as String?,
      json['password'] as String?,
      json['confirmPassword'] as String?,
    );

Map<String, dynamic> _$ResetPasswordRequestToJson(
        ResetPasswordRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'password': instance.password,
      'confirmPassword': instance.confirmPassword,
    };
