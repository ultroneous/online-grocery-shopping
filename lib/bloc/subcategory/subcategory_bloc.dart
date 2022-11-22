import 'package:bloc/bloc.dart';
import 'package:ecomm_bloc/api/models/subcategory_model.dart';
import 'package:ecomm_bloc/api/repository/categories_repository.dart';
import 'package:ecomm_bloc/exception/app_exception.dart';
import 'package:meta/meta.dart';

part 'subcategory_event.dart';
part 'subcategory_state.dart';

class SubcategoryBloc extends Bloc<SubcategoryEvent, SubcategoryState> {
  final CategoriesRepository _categoriesRepository = CategoriesRepository();
  SubcategoryBloc() : super(SubcategoryInitial()) {
    on<PassidEvent>((event, emit) async {
      emit(SubcategoryLoading());
      try {
        final subCategoryModel = await _categoriesRepository
            .requestSubCategories(event.id.toString());
        if (subCategoryModel.isNotEmpty) {
          emit(SubcategorySuccess(subCategoryModel));
        } else {
          emit(SubcategoryInitial());
        }
      } on AppException catch (e) {
        emit(SubcategoryError(e));
      }
    });
  }
}
