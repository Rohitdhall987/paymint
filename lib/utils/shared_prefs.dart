import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static Future<void> saveUser({
    required String email,
    required String username,
    required String phone,
    required String password,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
    await prefs.setString('username', username);
    await prefs.setString('phone', phone);
    await prefs.setString('password', password); // Only for dummy/demo apps
  }

  static Future<void> saveLoginSession({required bool isLoggedIn}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('loggedIn', isLoggedIn);
  }

  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('loggedIn') ?? false;
  }

  static Future<void> clearSession() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  static Future<Map<String, String?>> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'email': prefs.getString('email'),
      'username': prefs.getString('username'),
      'phone': prefs.getString('phone'),
      'password': prefs.getString('password'),
    };
  }
}
