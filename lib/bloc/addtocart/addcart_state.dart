part of 'addcart_bloc.dart';

@immutable
abstract class AddcartState {}

class AddcartInitial extends AddcartState {}

class AddCartLoading extends AddcartState {}

class AddCartSuccess extends AddcartState {
  final UserValues userValues;
  AddCartSuccess(this.userValues);
}

class AddCartError extends AddcartState {
  final AppException exception;
  AddCartError(this.exception);
}
