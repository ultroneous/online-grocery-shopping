part of 'placeorder_bloc.dart';

@immutable
abstract class PlaceorderState {}

class PlaceorderInitial extends PlaceorderState {}

class OrderPlaceLoading extends PlaceorderState {}

class OrderPlaceSuccess extends PlaceorderState {
  final PlaceOrderModel placeOrderModel;
  OrderPlaceSuccess(this.placeOrderModel);
}

class OrdePlaceError extends PlaceorderState {
  final AppException exception;
  OrdePlaceError(this.exception);
}
