class VisitRecordsResult {
  bool? _error;
  String? _msg;
  List<VisitRecord>? _data;

  VisitRecordsResult({bool? error, String? msg, List<VisitRecord>? data}) {
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
  List<VisitRecord>? get data => _data;
  set data(List<VisitRecord>? data) => _data = data;

  VisitRecordsResult.fromJson(Map<String, dynamic> json) {
    _error = json['error'];
    _msg = json['msg'];
    if (json['data'] != null) {
      _data = <VisitRecord>[];
      json['data'].forEach((v) {
        _data!.add(new VisitRecord.fromJson(v));
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

class VisitRecord {
  String? _docName;
  int? _patientId;
  String? _patientName;
  int? _prescriptionId;
  String? _visitId;
  String? _date;

  VisitRecord(
      {String? docName,
        int? patientId,
        String? patientName,
        int? prescriptionId,
        String? visitId,
        String? date}) {
    if (docName != null) {
      this._docName = docName;
    }
    if (patientId != null) {
      this._patientId = patientId;
    }
    if (patientName != null) {
      this._patientName = patientName;
    }
    if (prescriptionId != null) {
      this._prescriptionId = prescriptionId;
    }
    if (visitId != null) {
      this._visitId = visitId;
    }
    if (date != null) {
      this._date = date;
    }
  }

  String? get docName => _docName;
  set docName(String? docName) => _docName = docName;
  int? get patientId => _patientId;
  set patientId(int? patientId) => _patientId = patientId;
  String? get patientName => _patientName;
  set patientName(String? patientName) => _patientName = patientName;
  int? get prescriptionId => _prescriptionId;
  set prescriptionId(int? prescriptionId) => _prescriptionId = prescriptionId;
  String? get visitId => _visitId;
  set visitId(String? visitId) => _visitId = visitId;
  String? get date => _date;
  set date(String? date) => _date = date;

  VisitRecord.fromJson(Map<String, dynamic> json) {
    _docName = json['doc_name'];
    _patientId = json['patient_id'];
    _patientName = json['patient_name'];
    _prescriptionId = json['prescription_id'];
    _visitId = json['visit_id'];
    _date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['doc_name'] = this._docName;
    data['patient_id'] = this._patientId;
    data['patient_name'] = this._patientName;
    data['prescription_id'] = this._prescriptionId;
    data['visit_id'] = this._visitId;
    data['date'] = this._date;
    return data;
  }
}
