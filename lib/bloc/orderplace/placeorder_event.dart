part of 'placeorder_bloc.dart';

@immutable
abstract class PlaceorderEvent {}

class OrderplaceEvent extends PlaceorderEvent {
  final List orderedItems;
  final String userId;
  final int quantity;
  final int totalOrderPrice;
  OrderplaceEvent(
      this.orderedItems, this.userId, this.quantity, this.totalOrderPrice);
}
