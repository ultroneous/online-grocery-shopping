// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'categories_model.g.dart';

@JsonSerializable()
class CategoriesModel {
  // ignore: unused_field
  String? id;
  String? name;
  List<String>? image;
  bool? isActive;
  int? v;
  CategoriesModel(
    this.id,
    this.name,
    this.image,
    this.isActive,
    this.v,
  );
  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriesModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesModelToJson(this);
}
