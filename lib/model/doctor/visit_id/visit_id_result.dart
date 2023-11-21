import 'package:hive/hive.dart';
part 'visit_id_result.g.dart';

class VisitIdResult {
  bool? _error;
  String? _msg;
  VisitId? _data;

  VisitIdResult({bool? error, String? msg, VisitId? data}) {
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
  VisitId? get data => _data;
  set data(VisitId? data) => _data = data;

  VisitIdResult.fromJson(Map<String, dynamic> json) {
    _error = json['error'];
    _msg = json['msg'];
    _data = json['data'] != null ? new VisitId.fromJson(json['data']) : null;
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

@HiveType(typeId: 6)
class VisitId extends HiveObject {
  @HiveField(0)
  int? _visitId;

  VisitId({int? visitId}) {
    if (visitId != null) {
      this._visitId = visitId;
    }
  }

  int? get visitId => _visitId;
  set visitId(int? visitId) => _visitId = visitId;

  VisitId.fromJson(Map<String, dynamic> json) {
    _visitId = json['visit_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['visit_id'] = this._visitId;
    return data;
  }
}
