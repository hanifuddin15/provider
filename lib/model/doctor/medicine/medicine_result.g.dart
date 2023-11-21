// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicine_result.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MedicineInfoAdapter extends TypeAdapter<MedicineInfo> {
  @override
  final int typeId = 0;

  @override
  MedicineInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MedicineInfo()
      .._id = fields[0] as int?
      .._nameOfManufacturer = fields[1] as String?
      .._brandName = fields[2] as String?
      .._genericName = fields[3] as String?
      .._strength = fields[4] as String?
      .._dosageDescription = fields[5] as String?
      .._price = fields[6] as String?
      .._category = fields[7] as String?
      .._useFor = fields[8] as String?
      .._indication = fields[9] as String?
      .._contraindication = fields[10] as String?
      .._sideEffects = fields[11] as String?
      .._status = fields[12] as int?
      .._dar = fields[13] as String?
      .._createdAt = fields[14] as String?
      .._updatedAt = fields[15] as String?;
  }

  @override
  void write(BinaryWriter writer, MedicineInfo obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj._id)
      ..writeByte(1)
      ..write(obj._nameOfManufacturer)
      ..writeByte(2)
      ..write(obj._brandName)
      ..writeByte(3)
      ..write(obj._genericName)
      ..writeByte(4)
      ..write(obj._strength)
      ..writeByte(5)
      ..write(obj._dosageDescription)
      ..writeByte(6)
      ..write(obj._price)
      ..writeByte(7)
      ..write(obj._category)
      ..writeByte(8)
      ..write(obj._useFor)
      ..writeByte(9)
      ..write(obj._indication)
      ..writeByte(10)
      ..write(obj._contraindication)
      ..writeByte(11)
      ..write(obj._sideEffects)
      ..writeByte(12)
      ..write(obj._status)
      ..writeByte(13)
      ..write(obj._dar)
      ..writeByte(14)
      ..write(obj._createdAt)
      ..writeByte(15)
      ..write(obj._updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MedicineInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
