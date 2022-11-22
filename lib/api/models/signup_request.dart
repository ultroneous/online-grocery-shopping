import 'package:json_annotation/json_annotation.dart';

part 'signup_request.g.dart';

@JsonSerializable()
class SignupRequest {
  String? name;
  String? email;
  String? password;
  String? confirmPassword;
  SignupRequest(
    this.name,
    this.email,
    this.password,
    this.confirmPassword,
  );
  factory SignupRequest.fromJson(Map<String, dynamic> json) =>
      _$SignupRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SignupRequestToJson(this);
}
