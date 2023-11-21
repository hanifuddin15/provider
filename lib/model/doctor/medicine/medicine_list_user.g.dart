// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicine_list_user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserMedicineAdapter extends TypeAdapter<UserMedicine> {
  @override
  final int typeId = 7;

  @override
  UserMedicine read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserMedicine()
      .._id = fields[0] as int?
      .._type = fields[1] as String?
      .._medicineName = fields[2] as String?
      .._genericName = fields[3] as String?
      .._measurement = fields[4] as String?
      .._measurementUnit = fields[5] as String?
      .._morning = fields[6] as String?
      .._afternoon = fields[7] as String?
      .._night = fields[8] as String?
      .._isNotified = fields[9] as int?
      .._photo = fields[10] as String?
      .._photourl = fields[11] as String?
      .._barQrCode = fields[12] as String?
      .._howManyDays = fields[13] as String?
      .._howMuch = fields[14] as String?
      .._beforeOrAfterMeal = fields[15] as String?
      .._medicineStatus = fields[16] as String?
      .._howManyMedicineHave = fields[17] as String?;
  }

  @override
  void write(BinaryWriter writer, UserMedicine obj) {
    writer
      ..writeByte(18)
      ..writeByte(0)
      ..write(obj._id)
      ..writeByte(1)
      ..write(obj._type)
      ..writeByte(2)
      ..write(obj._medicineName)
      ..writeByte(3)
      ..write(obj._genericName)
      ..writeByte(4)
      ..write(obj._measurement)
      ..writeByte(5)
      ..write(obj._measurementUnit)
      ..writeByte(6)
      ..write(obj._morning)
      ..writeByte(7)
      ..write(obj._afternoon)
      ..writeByte(8)
      ..write(obj._night)
      ..writeByte(9)
      ..write(obj._isNotified)
      ..writeByte(10)
      ..write(obj._photo)
      ..writeByte(11)
      ..write(obj._photourl)
      ..writeByte(12)
      ..write(obj._barQrCode)
      ..writeByte(13)
      ..write(obj._howManyDays)
      ..writeByte(14)
      ..write(obj._howMuch)
      ..writeByte(15)
      ..write(obj._beforeOrAfterMeal)
      ..writeByte(16)
      ..write(obj._medicineStatus)
      ..writeByte(17)
      ..write(obj._howManyMedicineHave);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserMedicineAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
