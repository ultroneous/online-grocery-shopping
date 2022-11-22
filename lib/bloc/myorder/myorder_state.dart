part of 'myorder_cubit.dart';

@immutable
abstract class MyorderState {}

class MyorderInitial extends MyorderState {}

class MyorderSuccess extends MyorderState {
  final List<OrderModel> values;
  MyorderSuccess(this.values);
}

class MyorderError extends MyorderState {
  final Exception exception;
  MyorderError(this.exception);
}
