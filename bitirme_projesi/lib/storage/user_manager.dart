import 'package:shared_preferences/shared_preferences.dart';

class UserManager {
  static final UserManager _instance = UserManager._internal();

  factory UserManager() => _instance;

  UserManager._internal();

  Future<void> saveUserCredentials(String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
    await prefs.setString('password', password);
  }

  Future<bool> checkUserCredentials(String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedEmail = prefs.getString('email');
    String? savedPassword = prefs.getString('password');
    return savedEmail == email && savedPassword == password;
  }
}
