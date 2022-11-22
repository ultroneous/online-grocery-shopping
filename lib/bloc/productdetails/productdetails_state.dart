part of 'productdetails_cubit.dart';

@immutable
abstract class ProductdetailsState {}

class ProductdetailsLoading extends ProductdetailsState {}

class ProductdetailsSuccess extends ProductdetailsState {
  final ProductDetailsModel details;
  ProductdetailsSuccess(this.details);
}

class ProductdetailsError extends ProductdetailsState {
  final AppException exception;
  ProductdetailsError(this.exception);
}
