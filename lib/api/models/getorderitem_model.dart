import 'itemid.dart';
import 'package:json_annotation/json_annotation.dart';


part 'getorderitem_model.g.dart';

@JsonSerializable()
class OrderedItem {
  OrderItemId? itemId;
  String? itemQuantity;
  String? id;
  OrderedItem(
    this.itemId,
    this.itemQuantity,
    this.id,
  );
  factory OrderedItem.fromJson(Map<String, dynamic> json) =>
      _$OrderedItemFromJson(json);

  Map<String, dynamic> toJson() => _$OrderedItemToJson(this);
}
