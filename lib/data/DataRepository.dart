// lib/data/DataRepository.dart
import 'package:shared_preferences/shared_preferences.dart';

class DataRepository {
  static const String widget2Key = 'widget2';
  static const String widget3Key = 'widget3';
  static const String widget4Key = 'widget4';

  Future<int> getWidget2Value() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(widget2Key) ?? 0;
  }

  Future<void> setWidget2Value(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(widget2Key, value);
  }

// Similarly implement methods for widget3 and widget4
}
