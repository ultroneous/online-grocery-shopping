import 'package:ecomm_bloc/api/models/categories_model.dart';

class CategoriesState {}

class CategoriesLoading extends CategoriesState {}

class CategoriesSuccess extends CategoriesState {
  final List<CategoriesModel> category;
  CategoriesSuccess(this.category);
}

class CategoriesError extends CategoriesState {
  final Exception exception;
  CategoriesError(this.exception);
}
