class LoginResult {
  bool? _error;
  String? _msg;
  DoctorProfile? _data;

  LoginResult({bool? error, String? msg, DoctorProfile? data}) {
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
//modified by hanif
  bool? get error => _error;
  set error(bool? error) => _error = error;
  String? get msg => _msg;
  set msg(String? msg) => _msg = msg;
  DoctorProfile? get data => _data;
  set data(DoctorProfile? data) => _data = data;

  LoginResult.fromJson(Map<String, dynamic> json) {
    _error = json['error'];
    _msg = json['msg'];
    _data = json['data'] != null ? new DoctorProfile.fromJson(json['data']) : null;
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

class DoctorProfile {
  int? _id;
  String? _name;
  String? _firstname;
  String? _lastname;
  String? _type;
  int? _userCategory;
  int? _userSubCategory;
  String? _email;
  String? _username;
  String? _mobile;
  String? _address;
  String? _dateOfBirth;
  int? _age ;
  String? _gender;
  String? _height;
  String? _heightFt;
  String? _heightInch;
  String? _heightUnit;
  String? _weight;
  String? _weightUnit;
  String? _note;
  String? _city;
  String? _state;
  String? _country;
  String? _zipCode;
  String? _zoompass;
  String? _photo;
  String? _token;
  String? _primaryCareGiverContactInfo;
  String? _emergencyContactRelation;
  String? _morning;
  int? _isExternal;
  String? _afternoon;
  String? _night;
  String? _emergencyContactNumber;
  String? _fcmToken;
  String? _point;
  String? _emergencyContactPersonName;
  String? _authorizedBy;
  String? _planId;
  GeneralInfo? _generalInfo;

  String? _planName;
  List<PlanKeys>? _planKeys;
  JwtToken? _jwtToken;

  DoctorProfile({int? id, String? name, String? firstname, String? lastname, String? type, 
  int? userCategory, int? userSubCategory, String? email, 
  String? username, String? mobile, String? address, String? dateOfBirth, 
  int? age, 
  String? gender, String? height, String? heightFt, String? heightInch, String? heightUnit, String? weight, String? weightUnit, String? note, String? city, String? state, String? country, String? zipCode, String? zoom_pass, String? photo, String? token, String? primaryCareGiverContactInfo, String? emergencyContactRelation, String? morning, int? isExternal, String? afternoon, String? night, String? emergencyContactNumber, String? fcmToken, String? point, String? emergencyContactPersonName, String? authorizedBy, String? planId, GeneralInfo? generalInfo, List<Null>? deviceInfo, String? planName, List<PlanKeys>? planKeys, JwtToken? jwtToken}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
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
    if (userCategory != null) {
      this._userCategory = userCategory;
    }
    if (userSubCategory != null) {
      this._userSubCategory = userSubCategory;
    }
    if (email != null) {
      this._email = email;
    }
    if (username != null) {
      this._username = username;
    }
    if (mobile != null) {
      this._mobile = mobile;
    }
    if (address != null) {
      this._address = address;
    }
    if (dateOfBirth != null) {
      this._dateOfBirth = dateOfBirth;
    }
     if (age != null) {
      this._age = age;
    }
    if (gender != null) {
      this._gender = gender;
    }
    if (height != null) {
      this._height = height;
    }
    if (heightFt != null) {
      this._heightFt = heightFt;
    }
    if (heightInch != null) {
      this._heightInch = heightInch;
    }
    if (heightUnit != null) {
      this._heightUnit = heightUnit;
    }
    if (weight != null) {
      this._weight = weight;
    }
    if (weightUnit != null) {
      this._weightUnit = weightUnit;
    }
    if (note != null) {
      this._note = note;
    }
    if (city != null) {
      this._city = city;
    }
    if (state != null) {
      this._state = state;
    }
    if (country != null) {
      this._country = country;
    }
    if (zipCode != null) {
      this._zipCode = zipCode;
    }
    if(zoom_pass != null) {
      this._zoompass = zoom_pass;
    }
    if (photo != null) {
      this._photo = photo;
    }
    if (token != null) {
      this._token = token;
    }
    if (primaryCareGiverContactInfo != null) {
      this._primaryCareGiverContactInfo = primaryCareGiverContactInfo;
    }
    if (emergencyContactRelation != null) {
      this._emergencyContactRelation = emergencyContactRelation;
    }
    if (morning != null) {
      this._morning = morning;
    }
    if (isExternal != null) {
      this._isExternal = isExternal;
    }
    if (afternoon != null) {
      this._afternoon = afternoon;
    }
    if (night != null) {
      this._night = night;
    }
    if (emergencyContactNumber != null) {
      this._emergencyContactNumber = emergencyContactNumber;
    }
    if (fcmToken != null) {
      this._fcmToken = fcmToken;
    }
    if (point != null) {
      this._point = point;
    }
    if (emergencyContactPersonName != null) {
      this._emergencyContactPersonName = emergencyContactPersonName;
    }
    if (authorizedBy != null) {
      this._authorizedBy = authorizedBy;
    }
    if (planId != null) {
      this._planId = planId;
    }
    if (generalInfo != null) {
      this._generalInfo = generalInfo;
    }

    if (planName != null) {
      this._planName = planName;
    }
    if (planKeys != null) {
      this._planKeys = planKeys;
    }
    if (jwtToken != null) {
      this._jwtToken = jwtToken;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get firstname => _firstname;
  set firstname(String? firstname) => _firstname = firstname;
  String? get lastname => _lastname;
  set lastname(String? lastname) => _lastname = lastname;
  String? get type => _type;
  set type(String? type) => _type = type;
  int? get userCategory => _userCategory;
  set userCategory(int? userCategory) => _userCategory = userCategory;
  int? get userSubCategory => _userSubCategory;
  set userSubCategory(int? userSubCategory) => _userSubCategory = userSubCategory;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get username => _username;
  set username(String? username) => _username = username;
  String? get mobile => _mobile;
  set mobile(String? mobile) => _mobile = mobile;
  String? get address => _address;
  set address(String? address) => _address = address;
  String? get dateOfBirth => _dateOfBirth;
  set dateOfBirth(String? dateOfBirth) => _dateOfBirth = dateOfBirth;
  int? get age => _age;
  set age(int? age) => _age = age;
  String? get gender => _gender;
  set gender(String? gender) => _gender = gender;
  String? get height => _height;
  set height(String? height) => _height = height;
  String? get heightFt => _heightFt;
  set heightFt(String? heightFt) => _heightFt = heightFt;
  String? get heightInch => _heightInch;
  set heightInch(String? heightInch) => _heightInch = heightInch;
  String? get heightUnit => _heightUnit;
  set heightUnit(String? heightUnit) => _heightUnit = heightUnit;
  String? get weight => _weight;
  set weight(String? weight) => _weight = weight;
  String? get weightUnit => _weightUnit;
  set weightUnit(String? weightUnit) => _weightUnit = weightUnit;
  String? get note => _note;
  set note(String? note) => _note = note;
  String? get city => _city;
  set city(String? city) => _city = city;
  String? get state => _state;
  set state(String? state) => _state = state;
  String? get country => _country;
  set country(String? country) => _country = country;
  String? get zipCode => _zipCode;
  set zipCode(String? zipCode) => _zipCode = zipCode;
  String? get zoom_pass => _zoompass;
  set zoom_pass(String? zoom_pass) => _zoompass =zoom_pass;
  // String? get photo => _photo;
  // set photo(String? photo) => _photo = photo;
   String? get photo => _photo;
  set photo(String? photo) => _photo = photo;
  String? get token => _token;
  set token(String? token) => _token = token;
  String? get primaryCareGiverContactInfo => _primaryCareGiverContactInfo;
  set primaryCareGiverContactInfo(String? primaryCareGiverContactInfo) => _primaryCareGiverContactInfo = primaryCareGiverContactInfo;
  String? get emergencyContactRelation => _emergencyContactRelation;
  set emergencyContactRelation(String? emergencyContactRelation) => _emergencyContactRelation = emergencyContactRelation;
  String? get morning => _morning;
  set morning(String? morning) => _morning = morning;
  int? get isExternal => _isExternal;
  set isExternal(int? isExternal) => _isExternal = isExternal;
  String? get afternoon => _afternoon;
  set afternoon(String? afternoon) => _afternoon = afternoon;
  String? get night => _night;
  set night(String? night) => _night = night;
  String? get emergencyContactNumber => _emergencyContactNumber;
  set emergencyContactNumber(String? emergencyContactNumber) => _emergencyContactNumber = emergencyContactNumber;
  String? get fcmToken => _fcmToken;
  set fcmToken(String? fcmToken) => _fcmToken = fcmToken;
  String? get point => _point;
  set point(String? point) => _point = point;
  String? get emergencyContactPersonName => _emergencyContactPersonName;
  set emergencyContactPersonName(String? emergencyContactPersonName) => _emergencyContactPersonName = emergencyContactPersonName;
  String? get authorizedBy => _authorizedBy;
  set authorizedBy(String? authorizedBy) => _authorizedBy = authorizedBy;
  String? get planId => _planId;
  set planId(String? planId) => _planId = planId;
  GeneralInfo? get generalInfo => _generalInfo;
  set generalInfo(GeneralInfo? generalInfo) => _generalInfo = generalInfo;

  String? get planName => _planName;
  set planName(String? planName) => _planName = planName;
  List<PlanKeys>? get planKeys => _planKeys;
  set planKeys(List<PlanKeys>? planKeys) => _planKeys = planKeys;
  JwtToken? get jwtToken => _jwtToken;
  set jwtToken(JwtToken? jwtToken) => _jwtToken = jwtToken;

  DoctorProfile.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _firstname = json['firstname'];
    _lastname = json['lastname'];
    _type = json['type'];
    _userCategory = json['user_category'];
    _userSubCategory = json['user_sub_category'];
    _email = json['email'];
    _username = json['username'];
    _mobile = json['mobile'];
    _address = json['address'];


    _dateOfBirth = json.containsKey('date_of_birth') ? json['date_of_birth'] : null;
  _age = json.containsKey('age') ? (json['age']) : null;

    _gender = json['gender'];
    _height = json['height'];
    _heightFt = json['height_ft'];
    _heightInch = json['height_inch'];
    _heightUnit = json['height_unit'];
    _weight = json['weight'];
    _weightUnit = json['weight_unit'];
    _note = json['note'];
    _city = json['city'];
    _state = json['state'];
    _country = json['country'];
    _zipCode = json['zip_code'];
    _zoompass = json['zoom_pass'];
    _photo = json['photo'];
    _token = json['token'];
    _primaryCareGiverContactInfo = json['primary_care_giver_contact_info'];
    _emergencyContactRelation = json['emergency_contact_relation'];
    _morning = json['morning'];
    _isExternal = json['is_external'];
    _afternoon = json['afternoon'];
    _night = json['night'];
    _emergencyContactNumber = json['emergency_contact_number'];
    _fcmToken = json['fcm_token'];
    _point = json['point'];
    _emergencyContactPersonName = json['emergency_contact_person_name'];
    _authorizedBy = json['authorized_by'];
    _planId = json['plan_id'];
    _generalInfo = json['general_info'] != null ? new GeneralInfo.fromJson(json['general_info']) : null;

    _planName = json['plan_name'];
    if (json['plan_keys'] != null) {
      _planKeys = <PlanKeys>[];
      json['plan_keys'].forEach((v) { _planKeys!.add(new PlanKeys.fromJson(v)); });
    }
    _jwtToken = json['jwt_token'] != null ? new JwtToken.fromJson(json['jwt_token']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['firstname'] = this._firstname;
    data['lastname'] = this._lastname;
    data['type'] = this._type;
    data['user_category'] = this._userCategory;
    data['user_sub_category'] = this._userSubCategory;
    data['email'] = this._email;
    data['username'] = this._username;
    data['mobile'] = this._mobile;
    data['address'] = this._address;
    data['date_of_birth'] = this._dateOfBirth;
    data['age'] = this._age;
    data['gender'] = this._gender;
    data['height'] = this._height;
    data['height_ft'] = this._heightFt;
    data['height_inch'] = this._heightInch;
    data['height_unit'] = this._heightUnit;
    data['weight'] = this._weight;
    data['weight_unit'] = this._weightUnit;
    data['note'] = this._note;
    data['city'] = this._city;
    data['state'] = this._state;
    data['country'] = this._country;
    data['zip_code'] = this._zipCode;
    data['zoom_pass'] = this._zoompass;
    data['photo'] = this._photo;
    data['token'] = this._token;
    data['primary_care_giver_contact_info'] = this._primaryCareGiverContactInfo;
    data['emergency_contact_relation'] = this._emergencyContactRelation;
    data['morning'] = this._morning;
    data['is_external'] = this._isExternal;
    data['afternoon'] = this._afternoon;
    data['night'] = this._night;
    data['emergency_contact_number'] = this._emergencyContactNumber;
    data['fcm_token'] = this._fcmToken;
    data['point'] = this._point;
    data['emergency_contact_person_name'] = this._emergencyContactPersonName;
    data['authorized_by'] = this._authorizedBy;
    data['plan_id'] = this._planId;
    if (this._generalInfo != null) {
      data['general_info'] = this._generalInfo!.toJson();
    }

    data['plan_name'] = this._planName;
    if (this._planKeys != null) {
      data['plan_keys'] = this._planKeys!.map((v) => v.toJson()).toList();
    }
    if (this._jwtToken != null) {
      data['jwt_token'] = this._jwtToken!.toJson();
    }
    return data;
  }
}

class GeneralInfo {
  int? _id;
  String? _adminEmail;
  String? _generalEmail;
  String? _paymentMail;
  String? _adminMobile;
  String? _generalMobile;
  String? _fb;
  String? _twitter;
  String? _linkedin;
  String? _googlePlus;
  String? _instragram;
  String? _youtube;
  String? _gmail;
  String? _skype;
  String? _companyAddress;
  String? _whatsappNumber;
  String? _zoomId;
  String? _lisenceNumber;
  String? _tinNumber;
  String? _logo;
  String? _createdBy;
  String? _updatedBy;
  String? _createdAt;
  String? _updatedAt;

  GeneralInfo({int? id, String? adminEmail, String? generalEmail, String? paymentMail, String? adminMobile, String? generalMobile, String? fb, String? twitter, String? linkedin, String? googlePlus, String? instragram, String? youtube, String? gmail, String? skype, String? companyAddress, String? whatsappNumber, String? zoomId, String? lisenceNumber, String? tinNumber, String? logo, String? createdBy, String? updatedBy, String? createdAt, String? updatedAt}) {
    if (id != null) {
      this._id = id;
    }
    if (adminEmail != null) {
      this._adminEmail = adminEmail;
    }
    if (generalEmail != null) {
      this._generalEmail = generalEmail;
    }
    if (paymentMail != null) {
      this._paymentMail = paymentMail;
    }
    if (adminMobile != null) {
      this._adminMobile = adminMobile;
    }
    if (generalMobile != null) {
      this._generalMobile = generalMobile;
    }
    if (fb != null) {
      this._fb = fb;
    }
    if (twitter != null) {
      this._twitter = twitter;
    }
    if (linkedin != null) {
      this._linkedin = linkedin;
    }
    if (googlePlus != null) {
      this._googlePlus = googlePlus;
    }
    if (instragram != null) {
      this._instragram = instragram;
    }
    if (youtube != null) {
      this._youtube = youtube;
    }
    if (gmail != null) {
      this._gmail = gmail;
    }
    if (skype != null) {
      this._skype = skype;
    }
    if (companyAddress != null) {
      this._companyAddress = companyAddress;
    }
    if (whatsappNumber != null) {
      this._whatsappNumber = whatsappNumber;
    }
    if (zoomId != null) {
      this._zoomId = zoomId;
    }
    if (lisenceNumber != null) {
      this._lisenceNumber = lisenceNumber;
    }
    if (tinNumber != null) {
      this._tinNumber = tinNumber;
    }
    if (logo != null) {
      this._logo = logo;
    }
    if (createdBy != null) {
      this._createdBy = createdBy;
    }
    if (updatedBy != null) {
      this._updatedBy = updatedBy;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get adminEmail => _adminEmail;
  set adminEmail(String? adminEmail) => _adminEmail = adminEmail;
  String? get generalEmail => _generalEmail;
  set generalEmail(String? generalEmail) => _generalEmail = generalEmail;
  String? get paymentMail => _paymentMail;
  set paymentMail(String? paymentMail) => _paymentMail = paymentMail;
  String? get adminMobile => _adminMobile;
  set adminMobile(String? adminMobile) => _adminMobile = adminMobile;
  String? get generalMobile => _generalMobile;
  set generalMobile(String? generalMobile) => _generalMobile = generalMobile;
  String? get fb => _fb;
  set fb(String? fb) => _fb = fb;
  String? get twitter => _twitter;
  set twitter(String? twitter) => _twitter = twitter;
  String? get linkedin => _linkedin;
  set linkedin(String? linkedin) => _linkedin = linkedin;
  String? get googlePlus => _googlePlus;
  set googlePlus(String? googlePlus) => _googlePlus = googlePlus;
  String? get instragram => _instragram;
  set instragram(String? instragram) => _instragram = instragram;
  String? get youtube => _youtube;
  set youtube(String? youtube) => _youtube = youtube;
  String? get gmail => _gmail;
  set gmail(String? gmail) => _gmail = gmail;
  String? get skype => _skype;
  set skype(String? skype) => _skype = skype;
  String? get companyAddress => _companyAddress;
  set companyAddress(String? companyAddress) => _companyAddress = companyAddress;
  String? get whatsappNumber => _whatsappNumber;
  set whatsappNumber(String? whatsappNumber) => _whatsappNumber = whatsappNumber;
  String? get zoomId => _zoomId;
  set zoomId(String? zoomId) => _zoomId = zoomId;
  String? get lisenceNumber => _lisenceNumber;
  set lisenceNumber(String? lisenceNumber) => _lisenceNumber = lisenceNumber;
  String? get tinNumber => _tinNumber;
  set tinNumber(String? tinNumber) => _tinNumber = tinNumber;
  String? get logo => _logo;
  set logo(String? logo) => _logo = logo;
  String? get createdBy => _createdBy;
  set createdBy(String? createdBy) => _createdBy = createdBy;
  String? get updatedBy => _updatedBy;
  set updatedBy(String? updatedBy) => _updatedBy = updatedBy;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  GeneralInfo.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _adminEmail = json['admin_email'];
    _generalEmail = json['general_email'];
    _paymentMail = json['payment_mail'];
    _adminMobile = json['admin_mobile'];
    _generalMobile = json['general_mobile'];
    _fb = json['fb'];
    _twitter = json['twitter'];
    _linkedin = json['linkedin'];
    _googlePlus = json['google_plus'];
    _instragram = json['instragram'];
    _youtube = json['youtube'];
    _gmail = json['gmail'];
    _skype = json['skype'];
    _companyAddress = json['company_address'];
    _whatsappNumber = json['whatsapp_number'];
    _zoomId = json['zoom_id'];
    _lisenceNumber = json['lisence_number'];
    _tinNumber = json['tin_number'];
    _logo = json['logo'];
    _createdBy = json['created_by'];
    _updatedBy = json['updated_by'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['admin_email'] = this._adminEmail;
    data['general_email'] = this._generalEmail;
    data['payment_mail'] = this._paymentMail;
    data['admin_mobile'] = this._adminMobile;
    data['general_mobile'] = this._generalMobile;
    data['fb'] = this._fb;
    data['twitter'] = this._twitter;
    data['linkedin'] = this._linkedin;
    data['google_plus'] = this._googlePlus;
    data['instragram'] = this._instragram;
    data['youtube'] = this._youtube;
    data['gmail'] = this._gmail;
    data['skype'] = this._skype;
    data['company_address'] = this._companyAddress;
    data['whatsapp_number'] = this._whatsappNumber;
    data['zoom_id'] = this._zoomId;
    data['lisence_number'] = this._lisenceNumber;
    data['tin_number'] = this._tinNumber;
    data['logo'] = this._logo;
    data['created_by'] = this._createdBy;
    data['updated_by'] = this._updatedBy;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}

class PlanKeys {
  int? _sl;
  int? _id;
  String? _keyForApp;
  String? _status;
  String? _unitCost;
  String? _heading;

  PlanKeys({int? sl, int? id, String? keyForApp, String? status, String? unitCost, String? heading}) {
    if (sl != null) {
      this._sl = sl;
    }
    if (id != null) {
      this._id = id;
    }
    if (keyForApp != null) {
      this._keyForApp = keyForApp;
    }
    if (status != null) {
      this._status = status;
    }
    if (unitCost != null) {
      this._unitCost = unitCost;
    }
    if (heading != null) {
      this._heading = heading;
    }
  }

  int? get sl => _sl;
  set sl(int? sl) => _sl = sl;
  int? get id => _id;
  set id(int? id) => _id = id;
  String? get keyForApp => _keyForApp;
  set keyForApp(String? keyForApp) => _keyForApp = keyForApp;
  String? get status => _status;
  set status(String? status) => _status = status;
  String? get unitCost => _unitCost;
  set unitCost(String? unitCost) => _unitCost = unitCost;
  String? get heading => _heading;
  set heading(String? heading) => _heading = heading;

  PlanKeys.fromJson(Map<String, dynamic> json) {
    _sl = json['sl'];
    _id = json['id'];
    _keyForApp = json['key_for_app'];
    _status = json['status'];
    _unitCost = json['unit_cost'];
    _heading = json['heading'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sl'] = this._sl;
    data['id'] = this._id;
    data['key_for_app'] = this._keyForApp;
    data['status'] = this._status;
    data['unit_cost'] = this._unitCost;
    data['heading'] = this._heading;
    return data;
  }
}

class JwtToken {

  Original? _original;
  String? _exception;

  JwtToken({Original? original, String? exception}) {

    if (original != null) {
      this._original = original;
    }
    if (exception != null) {
      this._exception = exception;
    }
  }

  Original? get original => _original;
  set original(Original? original) => _original = original;
  String? get exception => _exception;
  set exception(String? exception) => _exception = exception;

  JwtToken.fromJson(Map<String, dynamic> json) {

    _original = json['original'] != null ? new Original.fromJson(json['original']) : null;
    _exception = json['exception'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this._original != null) {
      data['original'] = this._original!.toJson();
    }
    data['exception'] = this._exception;
    return data;
  }
}


class Original {
  String? _accessToken;
  String? _tokenType;
  int? _expiresIn;

  Original({String? accessToken, String? tokenType, int? expiresIn}) {
    if (accessToken != null) {
      this._accessToken = accessToken;
    }
    if (tokenType != null) {
      this._tokenType = tokenType;
    }
    if (expiresIn != null) {
      this._expiresIn = expiresIn;
    }
  }

  String? get accessToken => _accessToken;
  set accessToken(String? accessToken) => _accessToken = accessToken;
  String? get tokenType => _tokenType;
  set tokenType(String? tokenType) => _tokenType = tokenType;
  int? get expiresIn => _expiresIn;
  set expiresIn(int? expiresIn) => _expiresIn = expiresIn;

  Original.fromJson(Map<String, dynamic> json) {
    _accessToken = json['access_token'];
    _tokenType = json['token_type'];
    _expiresIn = json['expires_in'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this._accessToken;
    data['token_type'] = this._tokenType;
    data['expires_in'] = this._expiresIn;
    return data;
  }
}
