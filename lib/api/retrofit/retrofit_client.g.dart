// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'retrofit_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _RetrofitClient implements RetrofitClient {
  _RetrofitClient(this._dio) {
    baseUrl ??= 'http://192.168.1.9:8001/api/user/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<LoginResponse> requestLogin(loginRequest) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    data.addAll(loginRequest.toJson());
    final result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<LoginResponse>(
            Options(method: 'POST', headers: headers, extra: extra)
                .compose(_dio.options, 'signin',
                    queryParameters: queryParameters, data: data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LoginResponse.fromJson(result.data!);
    return value;
  }

  @override
  Future<LoginResponse> requestSignUp(signupRequest) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    data.addAll(signupRequest.toJson());
    final result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<LoginResponse>(
            Options(method: 'POST', headers: headers, extra: extra)
                .compose(_dio.options, 'signup',
                    queryParameters: queryParameters, data: data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LoginResponse.fromJson(result.data!);
    return value;
  }

  @override
  Future<CategoriesResponse> getCategories() async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    final result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CategoriesResponse>(
            Options(method: 'GET', headers: headers, extra: extra)
                .compose(_dio.options, 'getbothcategories',
                    queryParameters: queryParameters, data: data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CategoriesResponse.fromJson(result.data!);
    return value;
  }

  @override
  Future<SubCategoryResponse> getSubCategories(postId) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    final result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<SubCategoryResponse>(
            Options(method: 'GET', headers: headers, extra: extra)
                .compose(_dio.options, 'getbothcategories?id=${postId}',
                    queryParameters: queryParameters, data: data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SubCategoryResponse.fromJson(result.data!);
    return value;
  }

  @override
  Future<CartResponse> getCart() async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    final result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CartResponse>(
            Options(method: 'GET', headers: headers, extra: extra)
                .compose(_dio.options, 'addtocart',
                    queryParameters: queryParameters, data: data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CartResponse.fromJson(result.data!);
    return value;
  }

  @override
  Future<CartResponse> addtoCart(addtoCartRequest) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    data.addAll(addtoCartRequest.toJson());
    final result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CartResponse>(
            Options(method: 'POST', headers: headers, extra: extra)
                .compose(_dio.options, 'addtocart',
                    queryParameters: queryParameters, data: data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CartResponse.fromJson(result.data!);
    return value;
  }

  @override
  Future<CartResponse> cartitemdelete(cartItemDeleteRequest) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    data.addAll(cartItemDeleteRequest.toJson());
    final result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CartResponse>(
            Options(method: 'POST', headers: headers, extra: extra)
                .compose(_dio.options, 'deletecartitem',
                    queryParameters: queryParameters, data: data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CartResponse.fromJson(result.data!);
    return value;
  }

  @override
  Future<ProductDetailsResponse> getProductdetails(postId) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    final result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ProductDetailsResponse>(
            Options(method: 'GET', headers: headers, extra: extra)
                .compose(_dio.options, 'getsinglesubcategory?id=${postId}',
                    queryParameters: queryParameters, data: data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ProductDetailsResponse.fromJson(result.data!);
    return value;
  }

  @override
  Future<LoginResponse> requestForgotpassword(forgotPasswordRequest) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    data.addAll(forgotPasswordRequest.toJson());
    final result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<LoginResponse>(
            Options(method: 'POST', headers: headers, extra: extra)
                .compose(_dio.options, 'forgotpassword',
                    queryParameters: queryParameters, data: data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LoginResponse.fromJson(result.data!);
    return value;
  }

  @override
  Future<LoginResponse> requestOtpverify(otpVerifyRequest) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    data.addAll(otpVerifyRequest.toJson());
    final result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<LoginResponse>(
            Options(method: 'PATCH', headers: headers, extra: extra)
                .compose(_dio.options, 'verifyotp',
                    queryParameters: queryParameters, data: data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LoginResponse.fromJson(result.data!);
    return value;
  }

  @override
  Future<LoginResponse> requestResetPassword(resetpasswordrequest) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    data.addAll(resetpasswordrequest.toJson());
    final result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<LoginResponse>(
            Options(method: 'PATCH', headers: headers, extra: extra)
                .compose(_dio.options, 'resetPassword',
                    queryParameters: queryParameters, data: data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LoginResponse.fromJson(result.data!);
    return value;
  }

  @override
  Future<PlaceorderResponse> requestPlaceorder(placeOrderRequest) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    data.addAll(placeOrderRequest.toJson());
    final result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PlaceorderResponse>(
            Options(method: 'POST', headers: headers, extra: extra)
                .compose(_dio.options, 'placeOrder',
                    queryParameters: queryParameters, data: data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PlaceorderResponse.fromJson(result.data!);
    return value;
  }

  @override
  Future<GetOrderResponse> getorder() async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    final result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GetOrderResponse>(
            Options(method: 'GET', headers: headers, extra: extra)
                .compose(_dio.options, 'myorders',
                    queryParameters: queryParameters, data: data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetOrderResponse.fromJson(result.data!);
    return value;
  }

  @override
  Future<LoginResponse> requestChangePassword(changepasswordRequest) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    data.addAll(changepasswordRequest.toJson());
    final result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<LoginResponse>(
            Options(method: 'PATCH', headers: headers, extra: extra)
                .compose(_dio.options, 'changepassword',
                    queryParameters: queryParameters, data: data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LoginResponse.fromJson(result.data!);
    return value;
  }

  @override
  Future<LoginResponse> editprofile(editProfileRequest, file) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final headers = <String, dynamic>{};
    final data = FormData();
    data.fields
        .add(MapEntry('editProfileRequest', jsonEncode(editProfileRequest)));
    data.files.add(MapEntry(
        'file',
        MultipartFile.fromFileSync(file!.path,
            filename: file.path.split(Platform.pathSeparator).last)));
    final result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<LoginResponse>(Options(
                method: 'POST',
                headers: headers,
                extra: extra,
                contentType: 'multipart/form-data')
            .compose(_dio.options, 'updateuser',
                queryParameters: queryParameters, data: data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LoginResponse.fromJson(result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
