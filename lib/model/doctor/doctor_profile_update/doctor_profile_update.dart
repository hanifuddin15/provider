import 'package:kambaii_provider/model/doctor/login_model/login_result_model.dart';

class DoctorProfileUpdate {
  bool? error;
  String? msg;
  DoctorProfile? data;

  DoctorProfileUpdate({this.error, this.msg, this.data});

  DoctorProfileUpdate.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    msg = json['msg'];
    data = json['data'] != null ? new DoctorProfile.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

