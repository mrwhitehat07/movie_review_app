import 'package:hive/hive.dart';

class ThemeRepo {
  Future<bool> getTheme() async {
    try {
      var box = await Hive.openBox('theme');
      bool isDark = box.get('theme');
      return isDark;
    } catch (e) {
      return false;
    }
  }

  Future updateTheme(bool theme) async {
    var box = await Hive.openBox('theme');
    box.put("theme", theme);
  }
}
