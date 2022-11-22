import 'package:json_annotation/json_annotation.dart';

import 'base_response.dart';
import 'login_model.dart';
part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse extends BaseResponse {
  LoginModel? userValues;
  LoginResponse(this.userValues);

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
