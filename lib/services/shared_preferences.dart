import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  static const String _hasShownIntro = 'hasShownIntro';

  static Future<bool> hasShownIntro() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_hasShownIntro) ?? false;
  }

  static Future<void> setHasShownIntro(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_hasShownIntro, value);
  }
}