import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ecomm_bloc/api/models/addtocart_request.dart';
import 'package:ecomm_bloc/api/models/cartitem_delete_request.dart';
import 'package:ecomm_bloc/api/models/categories_response.dart';
import 'package:ecomm_bloc/api/models/changepassword_request.dart';
import 'package:ecomm_bloc/api/models/editprofile_request.dart';
import 'package:ecomm_bloc/api/models/otpverify_request.dart';
import 'package:ecomm_bloc/api/models/placeorder_request.dart';
import 'package:ecomm_bloc/api/models/placeorder_response.dart';
import 'package:ecomm_bloc/api/models/product_details_response.dart';
import 'package:retrofit/http.dart';
import '../models/cart_response.dart';
import '../models/forgotpassword_request.dart';
import '../models/getorder_response.dart';
import '../models/login_request.dart';
import '../models/login_response.dart';
import '../models/resetPassword_request.dart';
import '../models/signup_request.dart';
import '../models/subcategory_response.dart';
part 'retrofit_client.g.dart';

@RestApi(baseUrl: "http://192.168.1.9:8001/api/user/")
abstract class RetrofitClient {
  static final RetrofitClient client = RetrofitClient(Dio());

  factory RetrofitClient(Dio dio) = _RetrofitClient;

  @POST("signin")
  Future<LoginResponse> requestLogin(@Body() LoginRequest loginRequest);

  @POST("signup")
  Future<LoginResponse> requestSignUp(@Body() SignupRequest signupRequest);

  @GET("getbothcategories")
  Future<CategoriesResponse> getCategories();

  @GET("getbothcategories?id={id}")
  Future<SubCategoryResponse> getSubCategories(@Path("id") String postId);

  @GET("addtocart")
  Future<CartResponse> getCart();

  @POST("addtocart")
  Future<CartResponse> addtoCart(@Body() AddtoCartRequest addtoCartRequest);
  @POST("deletecartitem")
  Future<CartResponse> cartitemdelete(
      @Body() CartItemDeleteRequest cartItemDeleteRequest);

  @GET("getsinglesubcategory?id={id}")
  Future<ProductDetailsResponse> getProductdetails(@Path("id") String postId);

  @POST("forgotpassword")
  Future<LoginResponse> requestForgotpassword(
      @Body() ForgotPasswordRequest forgotPasswordRequest);

  @PATCH("verifyotp")
  Future<LoginResponse> requestOtpverify(
      @Body() OtpVerifyRequest otpVerifyRequest);

  @PATCH("resetPassword")
  Future<LoginResponse> requestResetPassword(
      @Body() ResetPasswordRequest resetpasswordrequest);

  @POST("placeOrder")
  Future<PlaceorderResponse> requestPlaceorder(
      @Body() PlaceOrderRequest placeOrderRequest);

  @GET("myorders")
  Future<GetOrderResponse> getorder();

  @PATCH("changepassword")
  Future<LoginResponse> requestChangePassword(
      @Body() ChangepasswordRequest changepasswordRequest);

  @POST('updateuser')
  @MultiPart()
  Future<LoginResponse> editprofile(
    @Part() EditProfileRequest editProfileRequest,
    @Part() File? file,
  );
}
