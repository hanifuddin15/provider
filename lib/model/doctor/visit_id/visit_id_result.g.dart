// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visit_id_result.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VisitIdAdapter extends TypeAdapter<VisitId> {
  @override
  final int typeId = 6;

  @override
  VisitId read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VisitId().._visitId = fields[0] as int?;
  }

  @override
  void write(BinaryWriter writer, VisitId obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj._visitId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VisitIdAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
