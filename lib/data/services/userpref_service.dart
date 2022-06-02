import 'package:shared_preferences/shared_preferences.dart';

class UserPrefService {
  UserPrefService._();
  static final UserPrefService instance = UserPrefService._();

  Future<bool> isDataInserted() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    if (sp.containsKey('inserted')) {
      return sp.getBool('inserted')!;
    }
    return false;
  }

  Future<void> setDataInserted(bool val) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.setBool('inserted', val);
  }
}
