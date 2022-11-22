import 'package:json_annotation/json_annotation.dart';

part 'editprofile_request.g.dart';

@JsonSerializable()
class EditProfileRequest {
  String? updateIn;
  String? name;
  String? email;

  EditProfileRequest(this.updateIn, this.name, this.email);

  factory EditProfileRequest.fromJson(Map<String, dynamic> json) =>
      _$EditProfileRequestFromJson(json);

  Map<String, dynamic> toJson() => _$EditProfileRequestToJson(this);
}
