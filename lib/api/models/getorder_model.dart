import 'package:json_annotation/json_annotation.dart';

import 'getorderitem_model.dart';

part 'getorder_model.g.dart';

@JsonSerializable()
class OrderModel {
  String? id;
  List<OrderedItem>? orderedItems;
  String? orderedDate;
  String? orderDelieveryDate;
  String? orderStatus;
  int? totalOrderPrice;
  bool? isOrderActive;
  int? v;
  OrderModel(
    this.id,
    this.orderedItems,
    this.orderedDate,
    this.orderDelieveryDate,
    this.orderStatus,
    this.totalOrderPrice,
    this.isOrderActive,
    this.v,
  );
  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}
