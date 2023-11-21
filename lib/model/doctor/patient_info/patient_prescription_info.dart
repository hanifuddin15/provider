import 'package:hive/hive.dart';
part 'patient_prescription_info.g.dart';

class PatientPrescriptionProfileResult {
  bool? _error;
  String? _msg;
  PatientPrescriptionProfile? _data;

  PatientPrescriptionProfileResult({bool? error, String? msg, PatientPrescriptionProfile? data}) {
    if (error != null) {
      this._error = error;
    }
    if (msg != null) {
      this._msg = msg;
    }
    if (data != null) {
      this._data = data;
    }
  }

  bool? get error => _error;
  set error(bool? error) => _error = error;
  String? get msg => _msg;
  set msg(String? msg) => _msg = msg;
  PatientPrescriptionProfile? get data => _data;
  set data(PatientPrescriptionProfile? data) => _data = data;

  PatientPrescriptionProfileResult.fromJson(Map<String, dynamic> json) {
    _error = json['error'];
    _msg = json['msg'];
    _data = json['data'] != null ? new PatientPrescriptionProfile.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this._error;
    data['msg'] = this._msg;
    if (this._data != null) {
      data['data'] = this._data!.toJson();
    }
    return data;
  }
}

class PatientPrescriptionProfile {
  PatientsInfo? _patientsInfo;
  VitalInfo? _vitalInfo;
  List<VisitSummary>? _visitSummery;

  PatientPrescriptionProfile({PatientsInfo? patientsInfo, VitalInfo? vitalInfo, List<VisitSummary>? visitSummery}) {
    if (patientsInfo != null) {
      this._patientsInfo = patientsInfo;
    }
    if (vitalInfo != null) {
      this._vitalInfo = vitalInfo;
    }
    if (visitSummery != null) {
      this._visitSummery = visitSummery;
    }
  }

  PatientsInfo? get patientsInfo => _patientsInfo;
  set patientsInfo(PatientsInfo? patientsInfo) => _patientsInfo = patientsInfo;
  VitalInfo? get vitalInfo => _vitalInfo;
  set vitalInfo(VitalInfo? vitalInfo) => _vitalInfo = vitalInfo;

  List<VisitSummary>? get visitSummery => _visitSummery;
  set visitSummery(List<VisitSummary>? visitSummery) =>
      _visitSummery = visitSummery;
  PatientPrescriptionProfile.fromJson(Map<String, dynamic> json) {
    _patientsInfo = json['patients_info'] != null
        ? new PatientsInfo.fromJson(json['patients_info'])
        : null;
    _vitalInfo = json['vital_info'] != null
        ? new VitalInfo.fromJson(json['vital_info'])
        : null;
    if (json['visit_summery'] != null) {
      _visitSummery = <VisitSummary>[];
      json['visit_summery'].forEach((v) {
        _visitSummery!.add(new VisitSummary.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._patientsInfo != null) {
      data['patients_info'] = this._patientsInfo!.toJson();
    }
    if (this._vitalInfo != null) {
      data['vital_info'] = this._vitalInfo!.toJson();
    }
    if (this._visitSummery != null) {
      data['visit_summery'] =
          this._visitSummery!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

@HiveType(typeId: 3)
class PatientsInfo extends HiveObject {
  @HiveField(0)
  int? _scheduleId;
  @HiveField(1)
  int? _doctorId;
  @HiveField(2)
  int? _patientId;
  @HiveField(3)
  String? _doctorName;
  @HiveField(4)
  String? _doctorBmdc;
  @HiveField(5)
  String? _patientName;
  @HiveField(6)
  String? _userMobile;
  @HiveField(7)
  int? _mrn;
  @HiveField(8)
  int? _userAge;
  @HiveField(9)
  double? _height;
  @HiveField(10)
  int? _weight;
  @HiveField(11)
  double? _bmi;
  @HiveField(12)
  String? _userGender;
  @HiveField(13)
  String? _userPhoto;
  @HiveField(14)
  String? _address;
  @HiveField(15)
  String? _patientBirthDate;
  @HiveField(16)
  String? _status;
  @HiveField(17)
  String? _meetingUrl;
  @HiveField(18)
  String? _doctorType;
  @HiveField(19)
  String? _reason;
  @HiveField(20)
  String? _scheduleTime;
  @HiveField(21)
  int? _visitId;
  @HiveField(22)
  String? _sheduleDate;
  @HiveField(23)
  String? _createdAt;


  PatientsInfo(
      {int? scheduleId,
        int? doctorId,
        int? patientId,
        String? doctorName,
        String? doctorBmdc,
        String? patientName,
        String? userMobile,
        int? mrn,
        int? userAge,
        double? height,
        int? weight,
        double? bmi,
        String? userGender,
        String? userPhoto,
        String? address,
        String? patientBirthDate,
        String? status,
        String? meetingUrl,
        String? doctorType,
        String? reason,
        String? scheduleTime,
        int? visitId,
        String? sheduleDate,
        String? createdAt}) {
    if (scheduleId != null) {
      this._scheduleId = scheduleId;
    }
    if (doctorId != null) {
      this._doctorId = doctorId;
    }
    if (patientId != null) {
      this._patientId = patientId;
    }
    if (doctorName != null) {
      this._doctorName = doctorName;
    }
    if (doctorBmdc != null) {
      this._doctorBmdc = doctorBmdc;
    }
    if (patientName != null) {
      this._patientName = patientName;
    }
    if (userMobile != null) {
      this._userMobile = userMobile;
    }
    if (mrn != null) {
      this._mrn = mrn;
    }
    if (userAge != null) {
      this._userAge = userAge;
    }
    if (height != null) {
      this._height = height;
    }
    if (weight != null) {
      this._weight = weight;
    }
    if (bmi != null) {
      this._bmi = bmi;
    }
    if (userGender != null) {
      this._userGender = userGender;
    }
    if (userPhoto != null) {
      this._userPhoto = userPhoto;
    }
    if (address != null) {
      this._address = address;
    }
    if (patientBirthDate != null) {
      this._patientBirthDate = patientBirthDate;
    }
    if (status != null) {
      this._status = status;
    }
    if (meetingUrl != null) {
      this._meetingUrl = meetingUrl;
    }
    if (doctorType != null) {
      this._doctorType = doctorType;
    }
    if (reason != null) {
      this._reason = reason;
    }
    if (scheduleTime != null) {
      this._scheduleTime = scheduleTime;
    }
    if (visitId != null) {
      this._visitId = visitId;
    }
    if (sheduleDate != null) {
      this._sheduleDate = sheduleDate;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
  }

  int? get scheduleId => _scheduleId;
  set scheduleId(int? scheduleId) => _scheduleId = scheduleId;
  int? get doctorId => _doctorId;
  set doctorId(int? doctorId) => _doctorId = doctorId;
  int? get patientId => _patientId;
  set patientId(int? patientId) => _patientId = patientId;
  String? get doctorName => _doctorName;
  set doctorName(String? doctorName) => _doctorName = doctorName;
  String? get doctorBmdc => _doctorBmdc;
  set doctorBmdc(String? doctorBmdc) => _doctorBmdc = doctorBmdc;
  String? get patientName => _patientName;
  set patientName(String? patientName) => _patientName = patientName;
  String? get userMobile => _userMobile;
  set userMobile(String? userMobile) => _userMobile = userMobile;
  int? get mrn => _mrn;
  set mrn(int? mrn) => _mrn = mrn;
  int? get userAge => _userAge;
  set userAge(int? userAge) => _userAge = userAge;
  double? get height => _height;
  set height(double? height) => _height = height;
  int? get weight => _weight;
  set weight(int? weight) => _weight = weight;
  double? get bmi => _bmi;
  set bmi(double? bmi) => _bmi = bmi;
  String? get userGender => _userGender;
  set userGender(String? userGender) => _userGender = userGender;
  String? get userPhoto => _userPhoto;
  set userPhoto(String? userPhoto) => _userPhoto = userPhoto;
  String? get address => _address;
  set address(String? address) => _address = address;
  String? get patientBirthDate => _patientBirthDate;
  set patientBirthDate(String? patientBirthDate) =>
      _patientBirthDate = patientBirthDate;
  String? get status => _status;
  set status(String? status) => _status = status;
  String? get meetingUrl => _meetingUrl;
  set meetingUrl(String? meetingUrl) => _meetingUrl = meetingUrl;
  String? get doctorType => _doctorType;
  set doctorType(String? doctorType) => _doctorType = doctorType;
  String? get reason => _reason;
  set reason(String? reason) => _reason = reason;
  String? get scheduleTime => _scheduleTime;
  set scheduleTime(String? scheduleTime) => _scheduleTime = scheduleTime;
  int? get visitId => _visitId;
  set visitId(int? visitId) => _visitId = visitId;
  String? get sheduleDate => _sheduleDate;
  set sheduleDate(String? sheduleDate) => _sheduleDate = sheduleDate;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;

  PatientsInfo.fromJson(Map<String, dynamic> json) {
    _scheduleId = json['schedule_id'];
    _doctorId = json['doctor_id'];
    _patientId = json['patient_id'];
    _doctorName = json['doctor_name'];
    _doctorBmdc = json['doctor_bmdc'];
    _patientName = json['patient_name'];
    _userMobile = json['user_mobile'];
    _mrn = json['mrn'];
    _userAge = json['user_age'];
    _height = json['height']==null?null:double.parse(json['height'].toString());
    _weight = json['weight'];
    _bmi = double.parse(json['bmi'].toString());
    _userGender = json['user_gender'];
    _userPhoto = json['user_photo'];
    _address = json['address'];
    _patientBirthDate = json['patient_birth_date'];
    _status = json['status'];
    _meetingUrl = json['meeting_url'];
    _doctorType = json['doctor_type'];
    _reason = json['reason'];
    _scheduleTime = json['schedule_time'];
    _visitId = json['visit_id'];
    _sheduleDate = json['shedule_date'];
    _createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['schedule_id'] = this._scheduleId;
    data['doctor_id'] = this._doctorId;
    data['patient_id'] = this._patientId;
    data['doctor_name'] = this._doctorName;
    data['doctor_bmdc'] = this._doctorBmdc;
    data['patient_name'] = this._patientName;
    data['user_mobile'] = this._userMobile;
    data['mrn'] = this._mrn;
    data['user_age'] = this._userAge;
    data['height'] = this._height;
    data['weight'] = this._weight;
    data['bmi'] = this._bmi;
    data['user_gender'] = this._userGender;
    data['user_photo'] = this._userPhoto;
    data['address'] = this._address;
    data['patient_birth_date'] = this._patientBirthDate;
    data['status'] = this._status;
    data['meeting_url'] = this._meetingUrl;
    data['doctor_type'] = this._doctorType;
    data['reason'] = this._reason;
    data['schedule_time'] = this._scheduleTime;
    data['visit_id'] = this._visitId;
    data['shedule_date'] = this._sheduleDate;
    data['created_at'] = this._createdAt;
    return data;
  }
}

@HiveType(typeId: 5)
class VitalInfo extends HiveObject {
  @HiveField(0)
  int? _id;
  @HiveField(1)
  int? _userId;
  @HiveField(2)
  String? _pulse;
  @HiveField(3)
  String? _temperatureReading;
  @HiveField(4)
  String? _temperatureUnit;
  @HiveField(5)
  String? _systolic;
  @HiveField(6)
  String? _diastolic;
  @HiveField(7)
  String? _height;
  @HiveField(8)
  String? _weightReading;
  @HiveField(9)
  String? _weightUnit;
  @HiveField(10)
  String? _sugarReading;
  @HiveField(11)
  String? _sugarUnit;
  @HiveField(12)
  String? _note;
  @HiveField(13)
  String? _heartRate;
  @HiveField(14)
  int? _sleeps;
  @HiveField(15)
  String? _status;
  @HiveField(16)
  String? _sheduleDate;

  VitalInfo(
      {int? id,
        int? userId,
        String? pulse,
        String? temperatureReading,
        String? temperatureUnit,
        String? systolic,
        String? diastolic,
        String? height,
        String? weightReading,
        String? weightUnit,
        String? sugarReading,
        String? sugarUnit,
        String? note,
        String? heartRate,
        int? sleeps,
        String? status,
        String? sheduleDate}) {
    if (id != null) {
      this._id = id;
    }
    if (userId != null) {
      this._userId = userId;
    }
    if (pulse != null) {
      this._pulse = pulse;
    }
    if (temperatureReading != null) {
      this._temperatureReading = temperatureReading;
    }
    if (temperatureUnit != null) {
      this._temperatureUnit = temperatureUnit;
    }
    if (systolic != null) {
      this._systolic = systolic;
    }
    if (diastolic != null) {
      this._diastolic = diastolic;
    }
    if (height != null) {
      this._height = height;
    }
    if (weightReading != null) {
      this._weightReading = weightReading;
    }
    if (weightUnit != null) {
      this._weightUnit = weightUnit;
    }
    if (sugarReading != null) {
      this._sugarReading = sugarReading;
    }
    if (sugarUnit != null) {
      this._sugarUnit = sugarUnit;
    }
    if (note != null) {
      this._note = note;
    }
    if (heartRate != null) {
      this._heartRate = heartRate;
    }
    if (sleeps != null) {
      this._sleeps = sleeps;
    }
    if (status != null) {
      this._status = status;
    }
    if (sheduleDate != null) {
      this._sheduleDate = sheduleDate;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  int? get userId => _userId;
  set userId(int? userId) => _userId = userId;
  String? get pulse => _pulse;
  set pulse(String? pulse) => _pulse = pulse;
  String? get temperatureReading => _temperatureReading;
  set temperatureReading(String? temperatureReading) =>
      _temperatureReading = temperatureReading;
  String? get temperatureUnit => _temperatureUnit;
  set temperatureUnit(String? temperatureUnit) =>
      _temperatureUnit = temperatureUnit;
  String? get systolic => _systolic;
  set systolic(String? systolic) => _systolic = systolic;
  String? get diastolic => _diastolic;
  set diastolic(String? diastolic) => _diastolic = diastolic;
  String? get height => _height;
  set height(String? height) => _height = height;
  String? get weightReading => _weightReading;
  set weightReading(String? weightReading) => _weightReading = weightReading;
  String? get weightUnit => _weightUnit;
  set weightUnit(String? weightUnit) => _weightUnit = weightUnit;
  String? get sugarReading => _sugarReading;
  set sugarReading(String? sugarReading) => _sugarReading = sugarReading;
  String? get sugarUnit => _sugarUnit;
  set sugarUnit(String? sugarUnit) => _sugarUnit = sugarUnit;
  String? get note => _note;
  set note(String? note) => _note = note;
  String? get heartRate => _heartRate;
  set heartRate(String? heartRate) => _heartRate = heartRate;
  int? get sleeps => _sleeps;
  set sleeps(int? sleeps) => _sleeps = sleeps;
  String? get status => _status;
  set status(String? status) => _status = status;
  String? get sheduleDate => _sheduleDate;
  set sheduleDate(String? sheduleDate) => _sheduleDate = sheduleDate;

  VitalInfo.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _userId = json['user_id'];
    _pulse = json['pulse'];
    _temperatureReading = json['temperature_reading'];
    _temperatureUnit = json['temperature_unit'];
    _systolic = json['systolic'];
    _diastolic = json['diastolic'];
    _height = json['height'];
    _weightReading = json['weight_reading'];
    _weightUnit = json['weight_unit'];
    _sugarReading = json['sugar_reading'];
    _sugarUnit = json['sugar_unit'];
    _note = json['note'];
    _heartRate = json['heart_rate'];
    _sleeps = json['sleeps'];
    _status = json['status'];
    _sheduleDate = json['shedule_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['user_id'] = this._userId;
    data['pulse'] = this._pulse;
    data['temperature_reading'] = this._temperatureReading;
    data['temperature_unit'] = this._temperatureUnit;
    data['systolic'] = this._systolic;
    data['diastolic'] = this._diastolic;
    data['height'] = this._height;
    data['weight_reading'] = this._weightReading;
    data['weight_unit'] = this._weightUnit;
    data['sugar_reading'] = this._sugarReading;
    data['sugar_unit'] = this._sugarUnit;
    data['note'] = this._note;
    data['heart_rate'] = this._heartRate;
    data['sleeps'] = this._sleeps;
    data['status'] = this._status;
    data['shedule_date'] = this._sheduleDate;
    return data;
  }
}

@HiveType(typeId: 4)
class VisitSummary {
  @HiveField(0)
  int? _id;
  @HiveField(1)
  String? _dname;
  @HiveField(2)
  String? _chiefComplain;
  @HiveField(3)
  String? _advice;
  @HiveField(4)
  String? _type;
  @HiveField(5)
  String? _tds;
  @HiveField(6)
  String? _viewUrl;

  VisitSummary(
      {int? id,
        String? dname,
        String? chiefComplain,
        String? advice,
        String? type,
        String? tds,
        String? viewUrl}) {
    if (id != null) {
      this._id = id;
    }
    if (dname != null) {
      this._dname = dname;
    }
    if (chiefComplain != null) {
      this._chiefComplain = chiefComplain;
    }
    if (advice != null) {
      this._advice = advice;
    }
    if (type != null) {
      this._type = type;
    }
    if (tds != null) {
      this._tds = tds;
    }
    if (viewUrl != null) {
      this._viewUrl = viewUrl;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get dname => _dname;
  set dname(String? dname) => _dname = dname;
  String? get chiefComplain => _chiefComplain;
  set chiefComplain(String? chiefComplain) => _chiefComplain = chiefComplain;
  String? get advice => _advice;
  set advice(String? advice) => _advice = advice;
  String? get type => _type;
  set type(String? type) => _type = type;
  String? get tds => _tds;
  set tds(String? tds) => _tds = tds;
  String? get viewUrl => _viewUrl;
  set viewUrl(String? viewUrl) => _viewUrl = viewUrl;

  VisitSummary.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _dname = json['dname'];
    _chiefComplain = json['chief_complain'];
    _advice = json['advice'];
    _type = json['type'];
    _tds = json['tds'];
    _viewUrl = json['view-url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['dname'] = this._dname;
    data['chief_complain'] = this._chiefComplain;
    data['advice'] = this._advice;
    data['type'] = this._type;
    data['tds'] = this._tds;
    data['view-url'] = this._viewUrl;
    return data;
  }
}
