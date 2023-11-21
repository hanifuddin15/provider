
import 'package:hive/hive.dart';
part 'all_diagnosis_name.g.dart';


@HiveType(typeId: 2)
class AllDiagnosisName {
  @HiveField(0)
  bool? _error;
  @HiveField(1)
  String? _msg;
  @HiveField(2)
  List<String>? _data;

  AllDiagnosisName({bool? error, String? msg, List<String>? data}) {
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
  List<String>? get data => _data;
  set data(List<String>? data) => _data = data;

  AllDiagnosisName.fromJson(Map<String, dynamic> json) {
    _error = json['error'];
    _msg = json['msg'];
    _data = json['data'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this._error;
    data['msg'] = this._msg;
    data['data'] = this._data;
    return data;
  }
}

