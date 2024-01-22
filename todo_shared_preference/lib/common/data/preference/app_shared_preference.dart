import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreference {

  AppSharedPreference._();

  static AppSharedPreference instance = AppSharedPreference._();

  late SharedPreferences _preferences;

  static init() async {
    instance._preferences = await SharedPreferences.getInstance();
  }

  void setCount(int count) {
    _preferences.setInt('count', count);
  }

  /// null일 경우엔 default값 0
  int getCount() {
    return _preferences.getInt('count') ?? 0;
  }



  // main() {
  //   final preference = AppSharedPreference();
  //   preference.setCount(0);
  // }

}