import 'package:ecomm_bloc/api/models/categories_model.dart';
import 'package:ecomm_bloc/api/repository/categories_repository.dart';
import 'package:ecomm_bloc/bloc/categories/categories_state.dart';
import 'package:ecomm_bloc/exception/app_exception.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoriesRepository _categoriesRepository = CategoriesRepository();
  CategoriesCubit() : super(CategoriesLoading());
  void requestCategories() async {
    emit(CategoriesLoading());
    try {
      final List<CategoriesModel> category =
          await _categoriesRepository.requestCategories();
      emit(CategoriesSuccess(category));
    } on AppException catch (e) {
      emit(CategoriesError(e));
    }
  }
}
