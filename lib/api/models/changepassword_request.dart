import 'package:json_annotation/json_annotation.dart';

part 'changepassword_request.g.dart';

@JsonSerializable()
class ChangepasswordRequest {
  String? oldPassword;
  String? password;
  String? confirmPassword;
  ChangepasswordRequest(
    this.oldPassword,
    this.password,
    this.confirmPassword,
  );
  factory ChangepasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ChangepasswordRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ChangepasswordRequestToJson(this);
}
