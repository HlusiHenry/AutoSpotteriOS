import 'package:shared_preferences/shared_preferences.dart';

class SpotService {
  static const _key = 'spotted_cars';

  static Future<List<String>> getSpottedIds() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_key) ?? [];
  }

  static Future<void> markAsSpotted(String carId) async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_key) ?? [];
    if (!list.contains(carId)) {
      list.add(carId);
      await prefs.setStringList(_key, list);
    }
  }

  static Future<void> removeSpot(String carId) async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_key) ?? [];
    list.remove(carId);
    await prefs.setStringList(_key, list);
  }
}