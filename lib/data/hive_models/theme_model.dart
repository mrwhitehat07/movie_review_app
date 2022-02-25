import 'package:hive/hive.dart';
part 'theme_model.g.dart';

@HiveType(typeId: 0)
class ThemeModel extends HiveObject {
  @HiveField(0)
  final bool isDark;
  ThemeModel({
    required this.isDark,
  });
}
 