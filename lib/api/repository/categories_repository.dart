import 'package:ecomm_bloc/api/models/categories_model.dart';
import 'package:ecomm_bloc/api/models/categories_response.dart';
import 'package:ecomm_bloc/api/models/product_details_model.dart';
import 'package:ecomm_bloc/api/models/product_details_response.dart';
import 'package:ecomm_bloc/api/retrofit/retrofit_client.dart';
import 'package:dio/dio.dart';
import 'package:ecomm_bloc/exception/app_exception.dart';

import '../models/subcategory_model.dart';
import '../models/subcategory_response.dart';

class CategoriesRepository {
  static final CategoriesRepository _singleton =
      CategoriesRepository._internal();
  CategoriesRepository._internal();
  final RetrofitClient _retrofitClient = RetrofitClient(Dio());
  factory CategoriesRepository() {
    return _singleton;
  }
  Future<List<CategoriesModel>> requestCategories() async {
    CategoriesResponse response = await _retrofitClient.getCategories();
    if (response.status == "success") {
      return response.data!;
    }
    throw AppException("Something went wrong!");
  }

  Future<List<SubCategoryModel>> requestSubCategories(String id) async {
    SubCategoryResponse response = await _retrofitClient.getSubCategories(id);
    if (response.status == "success" && response.data!.isNotEmpty) {
      return response.data!;
    }
    throw AppException("Something went wrong!");
  }

  Future<ProductDetailsModel> productDetails(String id) async {
    ProductDetailsResponse response =
        await _retrofitClient.getProductdetails(id);
    if (response.status == "success" && response.data != null) {
      return response.data!;
    }
    throw AppException("Something went wrong!");
  }
}
