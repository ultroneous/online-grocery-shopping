// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'changepassword_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangepasswordRequest _$ChangepasswordRequestFromJson(
        Map<String, dynamic> json) =>
    ChangepasswordRequest(
      json['oldPassword'] as String?,
      json['password'] as String?,
      json['confirmPassword'] as String?,
    );

Map<String, dynamic> _$ChangepasswordRequestToJson(
        ChangepasswordRequest instance) =>
    <String, dynamic>{
      'oldPassword': instance.oldPassword,
      'password': instance.password,
      'confirmPassword': instance.confirmPassword,
    };
