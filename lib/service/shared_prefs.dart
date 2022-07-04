import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  late final SharedPreferences _preferences;

  static const userId = 'userid';
  static const loginStatus = 'loginstatus';

  Future<void> initShared() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // save current user id
  Future savedUserId(int id) async {
    return await _preferences.setInt(userId, id);
  }

  // load current user id
  int? loadUserId() {
    return _preferences.getInt(userId);
  }

  // Clear 
  Future<bool> clear() {
    return _preferences.clear();
  }

  // save current user id
  Future saveLogin(bool value) async {
    return await _preferences.setBool(loginStatus, value);
  }

  // load current user id
  bool? loadLogin() {
    return _preferences.getBool(loginStatus);
  }
}
