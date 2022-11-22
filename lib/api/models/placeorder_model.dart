import 'orderitem_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'placeorder_model.g.dart';

@JsonSerializable()
class PlaceOrderModel {
  List<OrderedItemModel>? orderedItems;
  String? userId;
  DateTime? orderedDate;
  DateTime? orderDelieveryDate;
  String? orderStatus;
  int? totalOrderPrice;
  bool? isOrderActive;
  String? id;
  int? v;
  PlaceOrderModel(
    this.orderedItems,
    this.userId,
    this.orderedDate,
    this.orderDelieveryDate,
    this.orderStatus,
    this.totalOrderPrice,
    this.isOrderActive,
    this.id,
    this.v,
  );
  factory PlaceOrderModel.fromJson(Map<String, dynamic> json) =>
      _$PlaceOrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceOrderModelToJson(this);
}
