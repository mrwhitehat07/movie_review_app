// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'celeb_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CelebsModelAdapter extends TypeAdapter<CelebsModel> {
  @override
  final int typeId = 2;

  @override
  CelebsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CelebsModel(
      id: fields[0] as int,
      fname: fields[1] as String,
      lname: fields[2] as String,
      image: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CelebsModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.fname)
      ..writeByte(2)
      ..write(obj.lname)
      ..writeByte(3)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CelebsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
