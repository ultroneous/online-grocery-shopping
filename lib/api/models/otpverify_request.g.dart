// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otpverify_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtpVerifyRequest _$OtpVerifyRequestFromJson(Map<String, dynamic> json) =>
    OtpVerifyRequest(
      json['id'] as String?,
      json['otp'] as int?,
    );

Map<String, dynamic> _$OtpVerifyRequestToJson(OtpVerifyRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'otp': instance.otp,
    };
