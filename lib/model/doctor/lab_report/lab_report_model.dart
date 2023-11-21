class LabReportModel {
  bool? _error;
  String? _msg;
  List<LabReport>? _data;

  LabReportModel({bool? error, String? msg, List<LabReport>? data}) {
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
  List<LabReport>? get data => _data;
  set data(List<LabReport>? data) => _data = data;

  LabReportModel.fromJson(Map<String, dynamic> json) {
    _error = json['error'];
    _msg = json['msg'];
    if (json['data'] != null) {
      _data = <LabReport>[];
      json['data'].forEach((v) {
        _data!.add(new LabReport.fromJson(v));
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

class LabReport {
  String? _testname;
  String? _tds;
  List<LabImages>? _images;
  int? _id;

  LabReport({String? testname, String? tds, List<LabImages>? images, int? id}) {
    if (testname != null) {
      this._testname = testname;
    }
    if (tds != null) {
      this._tds = tds;
    }
    if (images != null) {
      this._images = images;
    }
    if (id != null) {
      this._id = id;
    }
  }

  String? get testname => _testname;
  set testname(String? testname) => _testname = testname;
  String? get tds => _tds;
  set tds(String? tds) => _tds = tds;
  List<LabImages>? get images => _images;
  set images(List<LabImages>? images) => _images = images;
  int? get id => _id;
  set id(int? id) => _id = id;

  LabReport.fromJson(Map<String, dynamic> json) {
    _testname = json['testname'];
    _tds = json['tds'];
    if (json['images'] != null) {

      _images = <LabImages>[];
      try{
        json['images'].forEach((v) {
          _images!.add(new LabImages.fromJson(v));
        });
      }catch(e){

      }

    }
    _id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['testname'] = this._testname;
    data['tds'] = this._tds;
    if (this._images != null) {
      data['images'] = this._images!.map((v) => v.toJson()).toList();
    }
    data['id'] = this._id;
    return data;
  }
}

class LabImages {
  String? _img;

  LabImages({String? img}) {
    if (img != null) {
      this._img = img;
    }
  }

  String? get img => _img;
  set img(String? img) => _img = img;

  LabImages.fromJson(Map<String, dynamic> json) {
    _img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['img'] = this._img;
    return data;
  }
}
