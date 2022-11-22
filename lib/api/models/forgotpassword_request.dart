import 'package:json_annotation/json_annotation.dart';

part 'forgotpassword_request.g.dart';

@JsonSerializable()
class ForgotPasswordRequest {
  String? email;

  ForgotPasswordRequest(this.email);

  factory ForgotPasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ForgotPasswordRequestToJson(this);
}
