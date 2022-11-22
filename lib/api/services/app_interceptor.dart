import '../../sharedprefs/shared_prefs_helper.dart';
import 'package:dio/dio.dart';
import 'locator.dart';

class AppInterceptor extends Interceptor {
  final _prefs = getIt.get<SharedPreferenceHelper>();
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers["Content-Type"] = "application/json";
    options.headers["Authorization"] = "Bearer ${_prefs.getValues("token")}";
    super.onRequest(options, handler);
  }
}
