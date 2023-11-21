// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_prescription_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalPrescriptionDataAdapter extends TypeAdapter<LocalPrescriptionData> {
  @override
  final int typeId = 8;

  @override
  LocalPrescriptionData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalPrescriptionData(
      giveAdvicetoPateint: fields[3] as String?,
      chiefComplaints: fields[1] as String?,
      dentalHealth: fields[2] as String?,
      patientComplaints: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, LocalPrescriptionData obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.patientComplaints)
      ..writeByte(1)
      ..write(obj.chiefComplaints)
      ..writeByte(2)
      ..write(obj.dentalHealth)
      ..writeByte(3)
      ..write(obj.giveAdvicetoPateint);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalPrescriptionDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
