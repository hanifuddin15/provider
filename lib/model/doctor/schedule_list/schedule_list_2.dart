//developed by hanif
class ProviderSchedule {
  bool? error;
  String? msg;
  List<PatientSchedule>? data;

  ProviderSchedule({this.error, this.msg, this.data});

  ProviderSchedule.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <PatientSchedule>[];
      json['data'].forEach((v) {
        data!.add(new PatientSchedule.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PatientSchedule {
  int? scheduleId;
  int? doctorId;
  int? patientId;
  String? doctorName;
  String? patientName;
  String? userMobile;
  int? userAge;
  String? userGender;
  String? userPhoto;
  String? patientBirthDate;
  String? status;
  String? meetingUrl;
  String? doctorType;
  String? reason;
  String? scheduleTime;
  String? sheduleDate;
  String? createdAt;

  PatientSchedule(
      {this.scheduleId,
      this.doctorId,
      this.patientId,
      this.doctorName,
      this.patientName,
      this.userMobile,
      this.userAge,
      this.userGender,
      this.userPhoto,
      this.patientBirthDate,
      this.status,
      this.meetingUrl,
      this.doctorType,
      this.reason,
      this.scheduleTime,
      this.sheduleDate,
      this.createdAt});

  PatientSchedule.fromJson(Map<String, dynamic> json) {
    scheduleId = json['schedule_id'];
    doctorId = json['doctor_id'];
    patientId = json['patient_id'];
    doctorName = json['doctor_name'];
    patientName = json['patient_name'];
    userMobile = json['user_mobile'];
    userAge = json['user_age'];
    userGender = json['user_gender'];
    userPhoto = json['user_photo'];
    patientBirthDate = json['patient_birth_date'];
    status = json['status'];
    meetingUrl = json['meeting_url'];
    doctorType = json['doctor_type'];
    reason = json['reason'];
    scheduleTime = json['schedule_time'];
    sheduleDate = json['shedule_date'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['schedule_id'] = this.scheduleId;
    data['doctor_id'] = this.doctorId;
    data['patient_id'] = this.patientId;
    data['doctor_name'] = this.doctorName;
    data['patient_name'] = this.patientName;
    data['user_mobile'] = this.userMobile;
    data['user_age'] = this.userAge;
    data['user_gender'] = this.userGender;
    data['user_photo'] = this.userPhoto;
    data['patient_birth_date'] = this.patientBirthDate;
    data['status'] = this.status;
    data['meeting_url'] = this.meetingUrl;
    data['doctor_type'] = this.doctorType;
    data['reason'] = this.reason;
    data['schedule_time'] = this.scheduleTime;
    data['shedule_date'] = this.sheduleDate;
    data['created_at'] = this.createdAt;
    return data;
  }
}
