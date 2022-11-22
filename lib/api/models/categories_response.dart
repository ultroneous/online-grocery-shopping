// ignore_for_file: depend_on_referenced_packages

import 'package:ecomm_bloc/api/models/base_response.dart';
import 'package:ecomm_bloc/api/models/categories_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'categories_response.g.dart';

@JsonSerializable()
class CategoriesResponse extends BaseResponseCategories {
  List<CategoriesModel>? data;
  CategoriesResponse(this.data);

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoriesResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CategoriesResponseToJson(this);
}
