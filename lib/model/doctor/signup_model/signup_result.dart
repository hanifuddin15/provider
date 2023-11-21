class SignupResult {
  bool? _error;
  String? _msg;
  SignupInfo? _data;

  SignupResult({bool? error, String? msg, SignupInfo? data}) {
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
  SignupInfo? get data => _data;
  set data(SignupInfo? data) => _data = data;

  SignupResult.fromJson(Map<String, dynamic> json) {
    _error = json['error'];
    _msg = json['msg'];
    _data = json['data'] != null ? new SignupInfo.fromJson(json['data']) : null;
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

class SignupInfo {
  int? _id;
  String? _firstname;
  String? _lastname;
  String? _type;
  String? _username;
  String? _mobile;
  int? _token;

  SignupInfo(
      {int? id,
        String? firstname,
        String? lastname,
        String? type,
        String? username,
        String? mobile,
        int? token}) {
    if (id != null) {
      this._id = id;
    }
    if (firstname != null) {
      this._firstname = firstname;
    }
    if (lastname != null) {
      this._lastname = lastname;
    }
    if (type != null) {
      this._type = type;
    }
    if (username != null) {
      this._username = username;
    }
    if (mobile != null) {
      this._mobile = mobile;
    }
    if (token != null) {
      this._token = token;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get firstname => _firstname;
  set firstname(String? firstname) => _firstname = firstname;
  String? get lastname => _lastname;
  set lastname(String? lastname) => _lastname = lastname;
  String? get type => _type;
  set type(String? type) => _type = type;
  String? get username => _username;
  set username(String? username) => _username = username;
  String? get mobile => _mobile;
  set mobile(String? mobile) => _mobile = mobile;
  int? get token => _token;
  set token(int? token) => _token = token;

  SignupInfo.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _firstname = json['firstname'];
    _lastname = json['lastname'];
    _type = json['type'];
    _username = json['username'];
    _mobile = json['mobile'];
    _token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['firstname'] = this._firstname;
    data['lastname'] = this._lastname;
    data['type'] = this._type;
    data['username'] = this._username;
    data['mobile'] = this._mobile;
    data['token'] = this._token;
    return data;
  }
}
