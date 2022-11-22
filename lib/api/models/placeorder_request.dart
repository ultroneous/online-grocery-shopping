import 'package:json_annotation/json_annotation.dart';

part 'placeorder_request.g.dart';

@JsonSerializable()
class PlaceOrderRequest {
  List orderedItems;
  String userId;
  int quantity;
  int totalOrderPrice;
  PlaceOrderRequest(
    this.orderedItems,
    this.userId,
    this.quantity,
    this.totalOrderPrice,
  );
  factory PlaceOrderRequest.fromJson(Map<String, dynamic> json) =>
      _$PlaceOrderRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceOrderRequestToJson(this);
}
