import 'cart_item_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart_model.g.dart';

@JsonSerializable()
class UserValues {
  String? id;
  String? userId;
  List<CartItem>? cartItems;
  int? v;
  UserValues(
    this.id,
    this.userId,
    this.cartItems,
    this.v,
  );
  factory UserValues.fromJson(Map<String, dynamic> json) =>
      _$UserValuesFromJson(json);
  Map<String, dynamic> toJson() => _$UserValuesToJson(this);
}
