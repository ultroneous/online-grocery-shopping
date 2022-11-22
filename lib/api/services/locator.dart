
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../sharedprefs/shared_prefs_helper.dart';
import '../retrofit/retrofit_client.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  final prefs = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferenceHelper>(
    SharedPreferenceHelper(prefs: prefs),
  );
  getIt.registerSingleton<RetrofitClient>(RetrofitClient.client);
}