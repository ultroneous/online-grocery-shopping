import 'package:json_annotation/json_annotation.dart';

part 'resetPassword_request.g.dart';

@JsonSerializable()
class ResetPasswordRequest {
  String? id;
  String? password;
  String? confirmPassword;
  ResetPasswordRequest(this.id, this.password, this.confirmPassword);
  factory ResetPasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ResetPasswordRequestToJson(this);
}
