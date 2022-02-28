// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SearchModelAdapter extends TypeAdapter<SearchModel> {
  @override
  final int typeId = 2;

  @override
  SearchModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SearchModel(
      query: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SearchModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.query);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
