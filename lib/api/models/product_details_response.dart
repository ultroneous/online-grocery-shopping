import 'package:ecomm_bloc/api/models/base_response.dart';
import 'package:ecomm_bloc/api/models/product_details_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'product_details_response.g.dart';

@JsonSerializable()
class ProductDetailsResponse extends BaseResponseCategories {
  ProductDetailsModel? data;
  ProductDetailsResponse(this.data);
  factory ProductDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ProductDetailsResponseToJson(this);
}
