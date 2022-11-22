part of 'getcart_cubit.dart';

@immutable
abstract class GetcartState {}

class GetcartLoading extends GetcartState {}

class GetcartSuccess extends GetcartState {
  final UserValues values;
  GetcartSuccess(this.values);
}

class GetcartError extends GetcartState {
  final Exception exception;

  GetcartError(this.exception);
}
