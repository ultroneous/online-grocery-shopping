import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  final SharedPreferences prefs;

  SharedPreferenceHelper({required this.prefs});

  Future<void> setValues({required String key, required String value}) async {
    await prefs.setString(key, value);
  }

  String? getValues(String key) {
    final getvalue = prefs.getString(key);
    return getvalue;
  }

  Future<void> deleteValues({required String key}) async {
    await prefs.remove(key);
  }
}
