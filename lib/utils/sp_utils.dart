import 'package:shared_preferences/shared_preferences.dart';

class SPUtil{
  static final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  get(String key) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.get(key);
  }

  setString(String key,String data)async{
    final SharedPreferences prefs = await _prefs;
    return prefs.setString(key,data);
  }

  static reMove(String key) async{
    final SharedPreferences prefs = await _prefs;
    return prefs.remove(key);
  }
}