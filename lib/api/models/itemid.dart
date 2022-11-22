import 'package:json_annotation/json_annotation.dart';


part 'itemid.g.dart';

@JsonSerializable()
class OrderItemId {
  String? id;
  String? name;
  int? price;

  List<String>? image;
  OrderItemId(
    this.id,
    this.name,
    this.price,
    this.image,
  );
  factory OrderItemId.fromJson(Map<String, dynamic> json) =>
      _$OrderItemIdFromJson(json);

  Map<String, dynamic> toJson() => _$OrderItemIdToJson(this);
}
