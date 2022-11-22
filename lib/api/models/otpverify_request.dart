import 'package:json_annotation/json_annotation.dart';

part 'otpverify_request.g.dart';

@JsonSerializable()
class OtpVerifyRequest {
  String? id;
  int? otp;
  OtpVerifyRequest(
    this.id,
    this.otp,
  );
  factory OtpVerifyRequest.fromJson(Map<String, dynamic> json) =>
      _$OtpVerifyRequestFromJson(json);

  Map<String, dynamic> toJson() => _$OtpVerifyRequestToJson(this);
}
