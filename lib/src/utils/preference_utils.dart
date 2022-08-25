import 'package:shared_preferences/shared_preferences.dart';

class PreferencesUtil {
  static Future<SharedPreferences> get instance async =>
      _prefsInstance ??= await SharedPreferences.getInstance();
  static SharedPreferences? _prefsInstance;

  static Future<SharedPreferences?> init() async {
    _prefsInstance = await instance;
    return _prefsInstance;
  }
}