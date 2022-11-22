import 'package:ecomm_bloc/api/models/changepassword_request.dart';
import 'package:ecomm_bloc/api/models/getorder_model.dart';
import 'package:ecomm_bloc/api/models/getorder_response.dart';
import 'package:ecomm_bloc/api/models/placeorder_model.dart';
import 'package:ecomm_bloc/api/models/placeorder_request.dart';
import 'package:ecomm_bloc/api/models/placeorder_response.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../exception/app_exception.dart';

import '../models/addtocart_request.dart';
import '../models/cart_model.dart';
import '../models/cart_response.dart';
import 'package:dio/dio.dart';
import '../models/cartitem_delete_request.dart';
import '../models/login_model.dart';
import '../models/login_response.dart';
import '../retrofit/retrofit_client.dart';
import '../services/app_interceptor.dart';

class CartRepository {
  static final CartRepository _singleton = CartRepository._internal();

  CartRepository._internal();
  final RetrofitClient _retrofitclient =
      RetrofitClient(Dio()..interceptors.add(AppInterceptor()));
  factory CartRepository() {
    return _singleton;
  }

  Future<UserValues> requestCart() async {
    CartResponse response = await _retrofitclient.getCart();
    if (response.status == "success") {
      if (response.userValues != null) {
        return response.userValues!;
      }
    }
    throw AppException("Something went wrong!");
  }

  Future<UserValues> requestAddtocart(String id, bool status) async {
    CartResponse response =
        await _retrofitclient.addtoCart(AddtoCartRequest(id, status));
    if (response.status == "success" && response.userValues != null) {
      Fluttertoast.showToast(
          msg: "successful processed",
          backgroundColor: Colors.white.withOpacity(0.7),
          textColor: Colors.black);
      return response.userValues!;
    } else if (response.status == "error") {
      throw AppException(response.message);
    }
    throw AppException(response.message);
  }

  Future<UserValues> itemremov(String id) async {
    CartResponse response =
        await _retrofitclient.cartitemdelete(CartItemDeleteRequest(id));
    if (response.status == "success") {
      /// return response.userValues!;
    } else if (response.status == "error") {
      throw AppException(response.message);
    }
    throw AppException(response.message);
  }

  Future<PlaceOrderModel> placeorder(List orderedItems, String userId,
      int quantity, int totalOrderPrice) async {
    PlaceorderResponse response = await _retrofitclient.requestPlaceorder(
        PlaceOrderRequest(orderedItems, userId, quantity, totalOrderPrice));
    if (response.status == "success") {
      return response.userValues;
    } else if (response.status == "error") {
      throw AppException(response.message);
    }
    throw AppException(response.message);
  }

  Future<List<OrderModel>> getmyorder() async {
    GetOrderResponse response = await _retrofitclient.getorder();
    if (response.status == "success") {
      return response.userValues!;
    }
    throw AppException("");
  }

  Future<LoginModel> changepassword(
      String oldpassword, String newpassword, String confirmpassword) async {
    LoginResponse response = await _retrofitclient.requestChangePassword(
        ChangepasswordRequest(oldpassword, newpassword, confirmpassword));
    if (response.status == "success") {
      return response.userValues!;
    }
    throw AppException("Something went wrong!");
  }
}
