import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  late final SharedPreferences _preferences;

  static const userId = 'userid';

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
}
