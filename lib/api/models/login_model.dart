// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel {
  String? id;
  String? name;
  String? password;
  String? email;
  String? image;
  String? address;
  String? city;
  String? state;
  String? zipcode;
  String? addressType;
  String? role;
  List<String>? favourites;
  bool? isActive;
  bool? isUserDeleted;
  int? v;

  LoginModel(
    this.id,
    this.name,
    this.password,
    this.email,
    this.image,
    this.address,
    this.city,
    this.state,
    this.zipcode,
    this.addressType,
    this.role,
    this.favourites,
    this.isActive,
    this.isUserDeleted,
    this.v,
  );

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}
