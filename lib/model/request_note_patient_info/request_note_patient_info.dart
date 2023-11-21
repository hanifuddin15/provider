class RequestNotePatientInfoResult {
  bool? _error;
  String? _msg;
  List<RequestNotePatient>? _data;

  RequestNotePatientInfoResult({bool? error, String? msg, List<RequestNotePatient>? data}) {
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
  List<RequestNotePatient>? get data => _data;
  set data(List<RequestNotePatient>? data) => _data = data;

  RequestNotePatientInfoResult.fromJson(Map<String, dynamic> json) {
    _error = json['error'];
    _msg = json['msg'];
    if (json['data'] != null) {
      _data = <RequestNotePatient>[];
      json['data'].forEach((v) {
        _data!.add(new RequestNotePatient.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this._error;
    data['msg'] = this._msg;
    if (this._data != null) {
      data['data'] = this._data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RequestNotePatient {
  int? _id;
  int? _doctorId;
  String? _dname;
  int? _patientId;
  String? _pname;
  String? _requestNote;
  String? _noteSummery;
  String? _noteSolution;
  String? _status;
  String? _createdAt;

  RequestNotePatient(
      {int? id,
        int? doctorId,
        String? dname,
        int? patientId,
        String? pname,
        String? requestNote,
        String? noteSummery,
        String? noteSolution,
        String? status,
        String? createdAt}) {
    if (id != null) {
      this._id = id;
    }
    if (doctorId != null) {
      this._doctorId = doctorId;
    }
    if (dname != null) {
      this._dname = dname;
    }
    if (patientId != null) {
      this._patientId = patientId;
    }
    if (pname != null) {
      this._pname = pname;
    }
    if (requestNote != null) {
      this._requestNote = requestNote;
    }
    if (noteSummery != null) {
      this._noteSummery = noteSummery;
    }
    if (noteSolution != null) {
      this._noteSolution = noteSolution;
    }
    if (status != null) {
      this._status = status;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  int? get doctorId => _doctorId;
  set doctorId(int? doctorId) => _doctorId = doctorId;
  String? get dname => _dname;
  set dname(String? dname) => _dname = dname;
  int? get patientId => _patientId;
  set patientId(int? patientId) => _patientId = patientId;
  String? get pname => _pname;
  set pname(String? pname) => _pname = pname;
  String? get requestNote => _requestNote;
  set requestNote(String? requestNote) => _requestNote = requestNote;
  String? get noteSummery => _noteSummery;
  set noteSummery(String? noteSummery) => _noteSummery = noteSummery;
  String? get noteSolution => _noteSolution;
  set noteSolution(String? noteSolution) => _noteSolution = noteSolution;
  String? get status => _status;
  set status(String? status) => _status = status;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;

  RequestNotePatient.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _doctorId = json['doctor_id'];
    _dname = json['dname'];
    _patientId = json['patient_id'];
    _pname = json['pname'];
    _requestNote = json['request_note'];
    _noteSummery = json['note_summery'];
    _noteSolution = json['note_solution'];
    _status = json['status'];
    _createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['doctor_id'] = this._doctorId;
    data['dname'] = this._dname;
    data['patient_id'] = this._patientId;
    data['pname'] = this._pname;
    data['request_note'] = this._requestNote;
    data['note_summery'] = this._noteSummery;
    data['note_solution'] = this._noteSolution;
    data['status'] = this._status;
    data['created_at'] = this._createdAt;
    return data;
  }
}
