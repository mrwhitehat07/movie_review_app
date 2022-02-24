part of 'theme_model.dart';

class ThemeAdapter extends TypeAdapter<ThemeModel> {
  @override
  final typeId = 0;

  @override
  ThemeModel read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ThemeModel(
      isDark: fields[0] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ThemeModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.isDark);
  }
}
