part of 'subcategory_bloc.dart';

@immutable
abstract class SubcategoryState {}

class SubcategoryInitial extends SubcategoryState {}

class SubcategorySuccess extends SubcategoryState {
  final List<SubCategoryModel> subCategory;
  SubcategorySuccess(this.subCategory);
}

class SubcategoryLoading extends SubcategoryState {}

class SubcategoryError extends SubcategoryState {
  final Exception exception;
  SubcategoryError(this.exception);
}
