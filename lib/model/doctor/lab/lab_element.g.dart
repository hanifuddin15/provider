// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lab_element.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddLabTestAdapter extends TypeAdapter<AddLabTest> {
  @override
  final int typeId = 9;

  @override
  AddLabTest read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AddLabTest(
      test_name: fields[2] as String,
      reason: fields[3] as String?,
      user_id: fields[0] as String,
      specelist_id: fields[1] as String,
      visit_id: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AddLabTest obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.user_id)
      ..writeByte(1)
      ..write(obj.specelist_id)
      ..writeByte(2)
      ..write(obj.test_name)
      ..writeByte(3)
      ..write(obj.reason)
      ..writeByte(4)
      ..write(obj.visit_id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddLabTestAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DiagnosisAdapter extends TypeAdapter<Diagnosis> {
  @override
  final int typeId = 10;

  @override
  Diagnosis read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Diagnosis(
      doctor_id: fields[0] as String?,
      patient_id: fields[1] as String?,
      provisinal_note: fields[2] as String?,
      provisinal_diagnosis: fields[3] as String?,
      visit_id: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Diagnosis obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.doctor_id)
      ..writeByte(1)
      ..write(obj.patient_id)
      ..writeByte(2)
      ..write(obj.provisinal_note)
      ..writeByte(3)
      ..write(obj.provisinal_diagnosis)
      ..writeByte(4)
      ..write(obj.visit_id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DiagnosisAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
