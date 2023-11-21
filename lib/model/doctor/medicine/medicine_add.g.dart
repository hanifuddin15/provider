// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicine_add.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MedicineAddedAdapter extends TypeAdapter<MedicineAdded> {
  @override
  final int typeId = 11;

  @override
  MedicineAdded read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MedicineAdded(
      medicineInfo: fields[1] as MedicineInfo?,
      medicineIntakeMeal: fields[7] as int?,
      medicineTakeTime: (fields[2] as List).cast<int>(),
      reason: fields[9] as String?,
      remarks: fields[10] as String?,
      morning: fields[3] as bool,
      night: fields[5] as bool,
      noon: fields[4] as bool,
      days: fields[6] as String,
      amount: fields[8] as String,
      continued: fields[11] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, MedicineAdded obj) {
    writer
      ..writeByte(11)
      ..writeByte(1)
      ..write(obj.medicineInfo)
      ..writeByte(2)
      ..write(obj.medicineTakeTime)
      ..writeByte(3)
      ..write(obj.morning)
      ..writeByte(4)
      ..write(obj.noon)
      ..writeByte(5)
      ..write(obj.night)
      ..writeByte(6)
      ..write(obj.days)
      ..writeByte(7)
      ..write(obj.medicineIntakeMeal)
      ..writeByte(8)
      ..write(obj.amount)
      ..writeByte(9)
      ..write(obj.reason)
      ..writeByte(10)
      ..write(obj.remarks)
      ..writeByte(11)
      ..write(obj.continued);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MedicineAddedAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
