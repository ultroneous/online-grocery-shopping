import 'package:json_annotation/json_annotation.dart';
import 'base_response.dart';
import 'cart_model.dart';

part 'cart_response.g.dart';

@JsonSerializable()
class CartResponse extends BaseResponse {
  UserValues? userValues;
  CartResponse(this.userValues);

  factory CartResponse.fromJson(Map<String, dynamic> json) =>
      _$CartResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CartResponseToJson(this);
}
