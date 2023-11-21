// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lab_test_names.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LabTestAdapter extends TypeAdapter<LabTest> {
  @override
  final int typeId = 1;

  @override
  LabTest read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LabTest()
      .._id = fields[0] as int?
      .._testname = fields[1] as String?;
  }

  @override
  void write(BinaryWriter writer, LabTest obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj._id)
      ..writeByte(1)
      ..write(obj._testname);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LabTestAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
