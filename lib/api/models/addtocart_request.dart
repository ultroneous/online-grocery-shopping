import 'package:json_annotation/json_annotation.dart';

part 'addtocart_request.g.dart';

@JsonSerializable()
class AddtoCartRequest {
  String? itemId;
  bool? status;
  AddtoCartRequest(
    this.itemId,
    this.status,
  );
  factory AddtoCartRequest.fromJson(Map<String, dynamic> json) =>
      _$AddtoCartRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddtoCartRequestToJson(this);
}
