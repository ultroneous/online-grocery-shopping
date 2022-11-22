import 'package:bloc/bloc.dart';
import 'package:ecomm_bloc/api/models/product_details_model.dart';
import 'package:ecomm_bloc/api/repository/categories_repository.dart';
import 'package:ecomm_bloc/exception/app_exception.dart';
import 'package:meta/meta.dart';

part 'productdetails_state.dart';

class ProductdetailsCubit extends Cubit<ProductdetailsState> {
  final CategoriesRepository _categoriesRepository = CategoriesRepository();
  ProductdetailsCubit() : super(ProductdetailsLoading());
  Future<void> getdetails(String id) async {
    emit(ProductdetailsLoading());
    try {
      final ProductDetailsModel detailsModel =
          await _categoriesRepository.productDetails(id);
      emit(ProductdetailsSuccess(detailsModel));
    } on AppException catch (e) {
      emit(ProductdetailsError(e));
    }
  }
}
