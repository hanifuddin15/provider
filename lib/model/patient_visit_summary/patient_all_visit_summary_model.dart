class PatientVisitSummary {
  bool? error;
  String? msg;
  List<PatientVisitInfo>? data;

  PatientVisitSummary({this.error, this.msg, this.data});

  PatientVisitSummary.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <PatientVisitInfo>[];
      json['data'].forEach((v) {
        data!.add(new PatientVisitInfo.fromJson(v));
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

class PatientVisitInfo {
  int? id;
  String? dname;
  String? tds;
  int? scheduleId;
  String? type;
  String? button;

  PatientVisitInfo(
      {this.id, this.dname, this.tds, this.scheduleId, this.type, this.button});

  PatientVisitInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dname = json['dname'];
    tds = json['tds'];
    scheduleId = json['schedule_id'];
    type = json['type'];
    button = json['button'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['dname'] = this.dname;
    data['tds'] = this.tds;
    data['schedule_id'] = this.scheduleId;
    data['type'] = this.type;
    data['button'] = this.button;
    return data;
  }
}
