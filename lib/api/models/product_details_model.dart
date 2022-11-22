import 'package:json_annotation/json_annotation.dart';
part 'product_details_model.g.dart';

@JsonSerializable()
class ProductDetailsModel {
  String? id;
  String? parentCategoryId;
  String? name;
  String? description;
  List<String>? image;
  int? price;
  String? measurements;
  int? stock;
  int? minStock;
  int? localDelieveryCharge;
  int? nationalDelieveryCharge;
  bool? isActive;
  int? v;
  int? maxOrderQuantity;
  ProductDetailsModel(
    this.id,
    this.parentCategoryId,
    this.name,
    this.description,
    this.image,
    this.price,
    this.measurements,
    this.stock,
    this.minStock,
    this.localDelieveryCharge,
    this.nationalDelieveryCharge,
    this.isActive,
    this.v,
    this.maxOrderQuantity,
  );
  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductDetailsModelToJson(this);
}
