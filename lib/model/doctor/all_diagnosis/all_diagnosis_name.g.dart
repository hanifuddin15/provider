// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_diagnosis_name.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AllDiagnosisNameAdapter extends TypeAdapter<AllDiagnosisName> {
  @override
  final int typeId = 2;

  @override
  AllDiagnosisName read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AllDiagnosisName()
      .._error = fields[0] as bool?
      .._msg = fields[1] as String?
      .._data = (fields[2] as List?)?.cast<String>();
  }

  @override
  void write(BinaryWriter writer, AllDiagnosisName obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj._error)
      ..writeByte(1)
      ..write(obj._msg)
      ..writeByte(2)
      ..write(obj._data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AllDiagnosisNameAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
