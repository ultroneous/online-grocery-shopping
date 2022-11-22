import 'package:json_annotation/json_annotation.dart';

part 'cartitem_delete_request.g.dart';

@JsonSerializable()
class CartItemDeleteRequest {
  String? id;
  CartItemDeleteRequest(
    this.id,
  );
  factory CartItemDeleteRequest.fromJson(Map<String, dynamic> json) =>
      _$CartItemDeleteRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemDeleteRequestToJson(this);
}
