
import 'package:ecomm_bloc/api/models/parentcategoryid.dart';
import 'package:json_annotation/json_annotation.dart';
part 'subcategory_model.g.dart';

@JsonSerializable()
class SubCategoryModel{
  String? id;
  ParentCategoryId? parentCategoryId;
  String? name;
  String? description;
  int? price;
  String? measurements;
  int? stock;
  int? minStock;
  int? localDelieveryCharge;
  int? nationalDelieveryCharge;
  bool? isActive;
  int? v;
  int? maxOrderQuantity;
  List<String>? image;

  SubCategoryModel({
    this.id,
    this.parentCategoryId,
    this.name,
    this.description,
    this.price,
    this.measurements,
    this.stock,
    this.minStock,
    this.localDelieveryCharge,
    this.nationalDelieveryCharge,
    this.isActive,
    this.v,
    this.maxOrderQuantity,
    this.image,
  });

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) => _$SubCategoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$SubCategoryModelToJson(this);

}