import 'package:ecomm_bloc/api/models/subcategory_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'base_response.dart';
part 'subcategory_response.g.dart';

@JsonSerializable()
class SubCategoryResponse extends BaseResponseCategories {
  List<SubCategoryModel>? data;
  SubCategoryResponse(this.data);

  factory SubCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SubCategoryResponseToJson(this);
}
