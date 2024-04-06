import 'package:shared_preferences/shared_preferences.dart';

MainComponent get C => MainComponent._internal();

class MainComponent {
  static final MainComponent _instance = MainComponent._internal();
  factory MainComponent() => _instance;
  MainComponent._internal();

  Future<bool> setBool(String key, bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(key, value);
  }

  Future<bool> getBool(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? false;
  }
}
