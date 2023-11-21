class WalletModelResult {
  bool? _error;
  String? _msg;
  WalletModel? _data;

  WalletModelResult({bool? error, String? msg, WalletModel? data}) {
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
  WalletModel? get data => _data;
  set data(WalletModel? data) => _data = data;

  WalletModelResult.fromJson(Map<String, dynamic> json) {
    _error = json['error'];
    _msg = json['msg'];
    _data = json['data'] != null ? new WalletModel.fromJson(json['data']) : null;
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

class WalletModel {
  int? _lastWeek;
  int? _last30Days;
  int? _totalVisit;
  List<LastVisitedPatients>? _lastVisitedPatients;

  WalletModel(
      {int? lastWeek,
        int? last30Days,
        int? totalVisit,
        List<LastVisitedPatients>? lastVisitedPatients}) {
    if (lastWeek != null) {
      this._lastWeek = lastWeek;
    }
    if (last30Days != null) {
      this._last30Days = last30Days;
    }
    if (totalVisit != null) {
      this._totalVisit = totalVisit;
    }
    if (lastVisitedPatients != null) {
      this._lastVisitedPatients = lastVisitedPatients;
    }
  }

  int? get lastWeek => _lastWeek;
  set lastWeek(int? lastWeek) => _lastWeek = lastWeek;
  int? get last30Days => _last30Days;
  set last30Days(int? last30Days) => _last30Days = last30Days;
  int? get totalVisit => _totalVisit;
  set totalVisit(int? totalVisit) => _totalVisit = totalVisit;
  List<LastVisitedPatients>? get lastVisitedPatients => _lastVisitedPatients;
  set lastVisitedPatients(List<LastVisitedPatients>? lastVisitedPatients) =>
      _lastVisitedPatients = lastVisitedPatients;

  WalletModel.fromJson(Map<String, dynamic> json) {
    _lastWeek = json['last_week'];
    _last30Days = json['last_30_days'];
    _totalVisit = json['total_visit'];
    if (json['last_visited_patients'] != null) {
      _lastVisitedPatients = <LastVisitedPatients>[];
      json['last_visited_patients'].forEach((v) {
        _lastVisitedPatients!.add(new LastVisitedPatients.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['last_week'] = this._lastWeek;
    data['last_30_days'] = this._last30Days;
    data['total_visit'] = this._totalVisit;
    if (this._lastVisitedPatients != null) {
      data['last_visited_patients'] =
          this._lastVisitedPatients!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LastVisitedPatients {
  String? _name;
  String? _mobile;
  String? _visitDate;

  LastVisitedPatients({String? name, String? mobile, String? visitDate}) {
    if (name != null) {
      this._name = name;
    }
    if (mobile != null) {
      this._mobile = mobile;
    }
    if (visitDate != null) {
      this._visitDate = visitDate;
    }
  }

  String? get name => _name;
  set name(String? name) => _name = name;
  String? get mobile => _mobile;
  set mobile(String? mobile) => _mobile = mobile;
  String? get visitDate => _visitDate;
  set visitDate(String? visitDate) => _visitDate = visitDate;

  LastVisitedPatients.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _mobile = json['mobile'];
    _visitDate = json['visit_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    data['mobile'] = this._mobile;
    data['visit_date'] = this._visitDate;
    return data;
  }
}



// class WalletModel {
//   bool? error;
//   String? msg;
//   Data? data;

//   WalletModel({this.error, this.msg, this.data});

//   WalletModel.fromJson(Map<String, dynamic> json) {
//     error = json['error'];
//     msg = json['msg'];
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['error'] = this.error;
//     data['msg'] = this.msg;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }

// class Data {
//   int? lastWeek;
//   int? last30Days;
//   int? totalVisit;
//   List<LastVisitedPatients>? lastVisitedPatients;

//   Data(
//       {this.lastWeek,
//       this.last30Days,
//       this.totalVisit,
//       this.lastVisitedPatients});

//   Data.fromJson(Map<String, dynamic> json) {
//     lastWeek = json['last_week'];
//     last30Days = json['last_30_days'];
//     totalVisit = json['total_visit'];
//     if (json['last_visited_patients'] != null) {
//       lastVisitedPatients = <LastVisitedPatients>[];
//       json['last_visited_patients'].forEach((v) {
//         lastVisitedPatients!.add(new LastVisitedPatients.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['last_week'] = this.lastWeek;
//     data['last_30_days'] = this.last30Days;
//     data['total_visit'] = this.totalVisit;
//     if (this.lastVisitedPatients != null) {
//       data['last_visited_patients'] =
//           this.lastVisitedPatients!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class LastVisitedPatients {
//   String? name;
//   String? mobile;
//   String? visitDate;

//   LastVisitedPatients({this.name, this.mobile, this.visitDate});

//   LastVisitedPatients.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     mobile = json['mobile'];
//     visitDate = json['visit_date'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['mobile'] = this.mobile;
//     data['visit_date'] = this.visitDate;
//     return data;
//   }
// }
