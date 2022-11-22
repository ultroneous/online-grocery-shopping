import 'cart_id_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart_item_model.g.dart';

@JsonSerializable()
class CartItem {
  ItemId? itemId;
  int? itemQuantity;
  String? id;
  CartItem(
    this.itemId,
    this.itemQuantity,
    this.id,
  );
  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);
  Map<String, dynamic> toJson() => _$CartItemToJson(this);
}
