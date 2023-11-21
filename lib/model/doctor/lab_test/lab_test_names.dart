import 'package:hive/hive.dart';
part 'lab_test_names.g.dart';

class AllLabTestResult {
  bool? _error;
  String? _msg;
  List<LabTest>? _data;

  AllLabTestResult({bool? error, String? msg, List<LabTest>? data}) {
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
  List<LabTest>? get data => _data;
  set data(List<LabTest>? data) => _data = data;

  AllLabTestResult.fromJson(Map<String, dynamic> json) {
    _error = json['error'];
    _msg = json['msg'];
    if (json['data'] != null) {
      _data = <LabTest>[];
      json['data'].forEach((v) {
        _data!.add(new LabTest.fromJson(v));
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

@HiveType(typeId: 1)
class LabTest {
  @HiveField(0)
  int? _id;
  @HiveField(1)
  String? _testname;

  LabTest({int? id, String? testname}) {
    if (id != null) {
      this._id = id;
    }
    if (testname != null) {
      this._testname = testname;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get testname => _testname;
  set testname(String? testname) => _testname = testname;

  LabTest.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _testname = json['testname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['testname'] = this._testname;
    return data;
  }
}
