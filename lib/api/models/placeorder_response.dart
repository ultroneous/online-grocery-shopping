import 'package:json_annotation/json_annotation.dart';
import 'package:ecomm_bloc/api/models/base_response.dart';
import 'package:ecomm_bloc/api/models/placeorder_model.dart';
part 'placeorder_response.g.dart';

@JsonSerializable()
class PlaceorderResponse extends BaseResponse {
  PlaceOrderModel userValues;
  PlaceorderResponse(this.userValues);
  factory PlaceorderResponse.fromJson(Map<String, dynamic> json) =>
      _$PlaceorderResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PlaceorderResponseToJson(this);
}
