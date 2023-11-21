// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_prescription_info.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PatientsInfoAdapter extends TypeAdapter<PatientsInfo> {
  @override
  final int typeId = 3;

  @override
  PatientsInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PatientsInfo()
      .._scheduleId = fields[0] as int?
      .._doctorId = fields[1] as int?
      .._patientId = fields[2] as int?
      .._doctorName = fields[3] as String?
      .._doctorBmdc = fields[4] as String?
      .._patientName = fields[5] as String?
      .._userMobile = fields[6] as String?
      .._mrn = fields[7] as int?
      .._userAge = fields[8] as int?
      .._height = fields[9] as double?
      .._weight = fields[10] as int?
      .._bmi = fields[11] as double?
      .._userGender = fields[12] as String?
      .._userPhoto = fields[13] as String?
      .._address = fields[14] as String?
      .._patientBirthDate = fields[15] as String?
      .._status = fields[16] as String?
      .._meetingUrl = fields[17] as String?
      .._doctorType = fields[18] as String?
      .._reason = fields[19] as String?
      .._scheduleTime = fields[20] as String?
      .._visitId = fields[21] as int?
      .._sheduleDate = fields[22] as String?
      .._createdAt = fields[23] as String?;
  }

  @override
  void write(BinaryWriter writer, PatientsInfo obj) {
    writer
      ..writeByte(24)
      ..writeByte(0)
      ..write(obj._scheduleId)
      ..writeByte(1)
      ..write(obj._doctorId)
      ..writeByte(2)
      ..write(obj._patientId)
      ..writeByte(3)
      ..write(obj._doctorName)
      ..writeByte(4)
      ..write(obj._doctorBmdc)
      ..writeByte(5)
      ..write(obj._patientName)
      ..writeByte(6)
      ..write(obj._userMobile)
      ..writeByte(7)
      ..write(obj._mrn)
      ..writeByte(8)
      ..write(obj._userAge)
      ..writeByte(9)
      ..write(obj._height)
      ..writeByte(10)
      ..write(obj._weight)
      ..writeByte(11)
      ..write(obj._bmi)
      ..writeByte(12)
      ..write(obj._userGender)
      ..writeByte(13)
      ..write(obj._userPhoto)
      ..writeByte(14)
      ..write(obj._address)
      ..writeByte(15)
      ..write(obj._patientBirthDate)
      ..writeByte(16)
      ..write(obj._status)
      ..writeByte(17)
      ..write(obj._meetingUrl)
      ..writeByte(18)
      ..write(obj._doctorType)
      ..writeByte(19)
      ..write(obj._reason)
      ..writeByte(20)
      ..write(obj._scheduleTime)
      ..writeByte(21)
      ..write(obj._visitId)
      ..writeByte(22)
      ..write(obj._sheduleDate)
      ..writeByte(23)
      ..write(obj._createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PatientsInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class VitalInfoAdapter extends TypeAdapter<VitalInfo> {
  @override
  final int typeId = 5;

  @override
  VitalInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VitalInfo()
      .._id = fields[0] as int?
      .._userId = fields[1] as int?
      .._pulse = fields[2] as String?
      .._temperatureReading = fields[3] as String?
      .._temperatureUnit = fields[4] as String?
      .._systolic = fields[5] as String?
      .._diastolic = fields[6] as String?
      .._height = fields[7] as String?
      .._weightReading = fields[8] as String?
      .._weightUnit = fields[9] as String?
      .._sugarReading = fields[10] as String?
      .._sugarUnit = fields[11] as String?
      .._note = fields[12] as String?
      .._heartRate = fields[13] as String?
      .._sleeps = fields[14] as int?
      .._status = fields[15] as String?
      .._sheduleDate = fields[16] as String?;
  }

  @override
  void write(BinaryWriter writer, VitalInfo obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj._id)
      ..writeByte(1)
      ..write(obj._userId)
      ..writeByte(2)
      ..write(obj._pulse)
      ..writeByte(3)
      ..write(obj._temperatureReading)
      ..writeByte(4)
      ..write(obj._temperatureUnit)
      ..writeByte(5)
      ..write(obj._systolic)
      ..writeByte(6)
      ..write(obj._diastolic)
      ..writeByte(7)
      ..write(obj._height)
      ..writeByte(8)
      ..write(obj._weightReading)
      ..writeByte(9)
      ..write(obj._weightUnit)
      ..writeByte(10)
      ..write(obj._sugarReading)
      ..writeByte(11)
      ..write(obj._sugarUnit)
      ..writeByte(12)
      ..write(obj._note)
      ..writeByte(13)
      ..write(obj._heartRate)
      ..writeByte(14)
      ..write(obj._sleeps)
      ..writeByte(15)
      ..write(obj._status)
      ..writeByte(16)
      ..write(obj._sheduleDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VitalInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class VisitSummaryAdapter extends TypeAdapter<VisitSummary> {
  @override
  final int typeId = 4;

  @override
  VisitSummary read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VisitSummary()
      .._id = fields[0] as int?
      .._dname = fields[1] as String?
      .._chiefComplain = fields[2] as String?
      .._advice = fields[3] as String?
      .._type = fields[4] as String?
      .._tds = fields[5] as String?
      .._viewUrl = fields[6] as String?;
  }

  @override
  void write(BinaryWriter writer, VisitSummary obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj._id)
      ..writeByte(1)
      ..write(obj._dname)
      ..writeByte(2)
      ..write(obj._chiefComplain)
      ..writeByte(3)
      ..write(obj._advice)
      ..writeByte(4)
      ..write(obj._type)
      ..writeByte(5)
      ..write(obj._tds)
      ..writeByte(6)
      ..write(obj._viewUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VisitSummaryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
