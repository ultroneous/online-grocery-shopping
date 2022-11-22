part of 'addcart_bloc.dart';

@immutable
abstract class AddcartEvent {}

class AddtoCartEvent extends AddcartEvent {
  final String id;
  final bool status;
  AddtoCartEvent(this.id, this.status);
}

class ItemRemove extends AddcartEvent {
  final String id;
  ItemRemove(this.id);
}
