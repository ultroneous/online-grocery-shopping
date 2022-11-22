import 'package:json_annotation/json_annotation.dart';

part 'cart_id_model.g.dart';

@JsonSerializable()
class ItemId {
  String? id;
  String? name;
  List<String>? image;
  int? price;
  String? measurements;
  ItemId(
    
    this.id,
    this.name,
    this.image,
    this.price,
    this.measurements,
  );
  factory ItemId.fromJson(Map<String, dynamic> json) => _$ItemIdFromJson(json);
  Map<String, dynamic> toJson() => _$ItemIdToJson(this);
}
