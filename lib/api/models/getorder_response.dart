import 'package:ecomm_bloc/api/models/base_response.dart';
import 'package:ecomm_bloc/api/models/getorder_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'getorder_response.g.dart';

@JsonSerializable()
class GetOrderResponse extends BaseResponse {
  List<OrderModel>? userValues;
  GetOrderResponse(this.userValues);

  factory GetOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$GetOrderResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetOrderResponseToJson(this);
}
