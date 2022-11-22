import 'package:json_annotation/json_annotation.dart';

part 'orderitem_model.g.dart';

@JsonSerializable()
class OrderedItemModel {
  String? itemId;
  String? itemQuantity;
  String? id;
  OrderedItemModel(
    this.itemId,
    this.itemQuantity,
    this.id,
  );
  factory OrderedItemModel.fromJson(Map<String, dynamic> json) =>
      _$OrderedItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderedItemModelToJson(this);
}
