// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      json['userValues'] == null
          ? null
          : LoginModel.fromJson(json['userValues'] as Map<String, dynamic>),
    )
      ..status = json['status'] as String
      ..message = json['message'] as String
      ..token = json['token'] as String;

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'token': instance.token,
      'userValues': instance.userValues,
    };
