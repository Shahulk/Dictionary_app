// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DictonaryModelAdapter extends TypeAdapter<DictonaryModel> {
  @override
  final int typeId = 1;

  @override
  DictonaryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DictonaryModel(
      Word: fields[0] as String,
      Part_of_speech: fields[1] as String,
      Meaning: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DictonaryModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.Word)
      ..writeByte(1)
      ..write(obj.Part_of_speech)
      ..writeByte(2)
      ..write(obj.Meaning);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DictonaryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
