// import 'package:get/get.dart';
// import 'package:kambaii_provider/model/doctor/login_model/login_result_model.dart';

// class LoginResultController extends GetxController {
//   RxBool? _error;
//   RxString? _msg;
//   Rx<DoctorProfile?>? _data;

//   LoginResultController({bool? error, String? msg, DoctorProfile? data}) {
//     _error = error?.obs;
//     _msg = msg?.obs;
//     _data = data?.obs;
//   }

//   bool? get error => _error?.value;
//   set error(bool? error) => _error?.value = error!;

//   String? get msg => _msg?.value;
//   set msg(String? msg) => _msg?.value = msg!;

//   DoctorProfile? get data => _data?.value;
//   set data(DoctorProfile? data) => _data?.value = data;

//   LoginResultController.fromJson(Map<String, dynamic> json) {
//     _error = json['error']?.obs;
//     _msg = json['msg']?.obs;
//     _data = (json['data'] != null ? DoctorProfileController.fromJson(json['data']) : null)?.obs;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = {};
//     data['error'] = _error?.value;
//     data['msg'] = _msg?.value;
//     if (_data?.value != null) {
//       data['data'] = (_data?.value as DoctorProfileController).toJson();
//     }
//     return data;
//   }
// }

// class DoctorProfileController extends GetxController {
//   RxInt? _id;
//   RxString? _name;
//   RxString? _firstname;
//   RxString? _lastname;
//   RxString? _type;
//   RxInt? _userCategory;
//   RxInt? _userSubCategory;
//   RxString? _email;
//   RxString? _username;
//   RxString? _mobile;
//   RxString? _address;
//   RxString? _dateOfBirth;
//   RxInt? _age;
//   RxString? _gender;
//   RxString? _height;
//   RxString? _heightFt;
//   RxString? _heightInch;
//   RxString? _heightUnit;
//   RxString? _weight;
//   RxString? _weightUnit;
//   RxString? _note;
//   RxString? _city;
//   RxString? _state;
//   RxString? _country;
//   RxString? _zipCode;
//   RxString? _zoompass;
//   RxString? _photo;
//   RxString? _token;
//   RxString? _primaryCareGiverContactInfo;
//   RxString? _emergencyContactRelation;
//   RxString? _morning;
//   RxInt? _isExternal;
//   RxString? _afternoon;
//   RxString? _night;
//   RxString? _emergencyContactNumber;
//   RxString? _fcmToken;
//   RxString? _point;
//   RxString? _emergencyContactPersonName;
//   RxString? _authorizedBy;
//   RxString? _planId;
//   Rx<GeneralInfoController?>? _generalInfo;

//   RxString? _planName;
//   RxList<PlanKeysController>? _planKeys;
//   Rx<JwtTokenController?>? _jwtToken;

//   DoctorProfileController({
//     int? id,
//     String? name,
//     String? firstname,
//     String? lastname,
//     String? type,
//     int? userCategory,
//     int? userSubCategory,
//     String? email,
//     String? username,
//     String? mobile,
//     String? address,
//     String? dateOfBirth,
//     int? age,
//     String? gender,
//     String? height,
//     String? heightFt,
//     String? heightInch,
//     String? heightUnit,
//     String? weight,
//     String? weightUnit,
//     String? note,
//     String? city,
//     String? state,
//     String? country,
//     String? zipCode,
//     String? zoom_pass,
//     String? photo,
//     String? token,
//     String? primaryCareGiverContactInfo,
//     String? emergencyContactRelation,
//     String? morning,
//     int? isExternal,
//     String? afternoon,
//     String? night,
//     String? emergencyContactNumber,
//     String? fcmToken,
//     String? point,
//     String? emergencyContactPersonName,
//     String? authorizedBy,
//     String? planId,
//     GeneralInfoController? generalInfo,
//     List<Null>? deviceInfo,
//     String? planName,
//     List<PlanKeysController>? planKeys,
//     JwtTokenController? jwtToken,
//   }) {
//     _id = id?.obs;
//     _name = name?.obs;
//     _firstname = firstname?.obs;
//     _lastname = lastname?.obs;
//     _type = type?.obs;
//     _userCategory = userCategory?.obs;
//     _userSubCategory = userSubCategory?.obs;
//     _email = email?.obs;
//     _username = username?.obs;
//     _mobile = mobile?.obs;
//     _address = address?.obs;
//     _dateOfBirth = dateOfBirth?.obs;
//     _age = age?.obs;
//     _gender = gender?.obs;
//     _height = height?.obs;
//     _heightFt = heightFt?.obs;
//     _heightInch = heightInch?.obs;
//     _heightUnit = heightUnit?.obs;
//     _weight = weight?.obs;
//     _weightUnit = weightUnit?.obs;
//     _note = note?.obs;
//     _city = city?.obs;
//     _state = state?.obs;
//     _country = country?.obs;
//     _zipCode = zipCode?.obs;
//     _zoompass = zoom_pass?.obs;
//     _photo = photo?.obs;
//     _token = token?.obs;
//     _primaryCareGiverContactInfo = primaryCareGiverContactInfo?.obs;
//     _emergencyContactRelation = emergencyContactRelation?.obs;
//     _morning = morning?.obs;
//     _isExternal = isExternal?.obs;
//     _afternoon = afternoon?.obs;
//     _night = night?.obs;
//     _emergencyContactNumber = emergencyContactNumber?.obs;
//     _fcmToken = fcmToken?.obs;
//     _point = point?.obs;
//     _emergencyContactPersonName = emergencyContactPersonName?.obs;
//     _authorizedBy = authorizedBy?.obs;
//     _planId = planId?.obs;
//     _generalInfo = generalInfo?.obs;
//     _planName = planName?.obs;
//     _planKeys = planKeys?.obs;
//     _jwtToken = jwtToken?.obs;
//   }

//   int? get id => _id?.value;
//   set id(int? id) => _id?.value = id;

//   String? get name => _name?.value;
//   set name(String? name) => _name?.value = name;

//   String? get firstname => _firstname?.value;
//   set firstname(String? firstname) => _firstname?.value = firstname;

//   String? get lastname => _lastname?.value;
//   set lastname(String? lastname) => _lastname?.value = lastname;

//   String? get type => _type?.value;
//   set type(String? type) => _type?.value = type;

//   int? get userCategory => _userCategory?.value;
//   set userCategory(int? userCategory) => _userCategory?.value = userCategory;

//   int? get userSubCategory => _userSubCategory?.value;
//   set userSubCategory(int? userSubCategory) => _userSubCategory?.value = userSubCategory;

//   String? get email => _email?.value;
//   set email(String? email) => _email?.value = email;

//   String? get username => _username?.value;
//   set username(String? username) => _username?.value = username;

//   String? get mobile => _mobile?.value;
//   set mobile(String? mobile) => _mobile?.value = mobile;

//   String? get address => _address?.value;
//   set address(String? address) => _address?.value = address;

//   String? get dateOfBirth => _dateOfBirth?.value;
//   set dateOfBirth(String? dateOfBirth) => _dateOfBirth?.value = dateOfBirth;

//   int? get age => _age?.value;
//   set age(int? age) => _age?.value = age;

//   String? get gender => _gender?.value;
//   set gender(String? gender) => _gender?.value = gender;

//   String? get height => _height?.value;
//   set height(String? height) => _height?.value = height;

//   String? get heightFt => _heightFt?.value;
//   set heightFt(String? heightFt) => _heightFt?.value = heightFt;

//   String? get heightInch => _heightInch?.value;
//   set heightInch(String? heightInch) => _heightInch?.value = heightInch;

//   String? get heightUnit => _heightUnit?.value;
//   set heightUnit(String? heightUnit) => _heightUnit?.value = heightUnit;

//   String? get weight => _weight?.value;
//   set weight(String? weight) => _weight?.value = weight;

//   String? get weightUnit => _weightUnit?.value;
//   set weightUnit(String? weightUnit) => _weightUnit?.value = weightUnit;

//   String? get note => _note?.value;
//   set note(String? note) => _note?.value = note;

//   String? get city => _city?.value;
//   set city(String? city) => _city?.value = city;

//   String? get state => _state?.value;
//   set state(String? state) => _state?.value = state;

//   String? get country => _country?.value;
//   set country(String? country) => _country?.value = country;

//   String? get zipCode => _zipCode?.value;
//   set zipCode(String? zipCode) => _zipCode?.value = zipCode;

//   String? get zoom_pass => _zoompass?.value;
//   set zoom_pass(String? zoom_pass) => _zoompass?.value = zoom_pass;

//   String? get photo => _photo?.value;
//   set photo(String? photo) => _photo?.value = photo;

//   String? get token => _token?.value;
//   set token(String? token) => _token?.value = token;

//   String? get primaryCareGiverContactInfo => _primaryCareGiverContactInfo?.value;
//   set primaryCareGiverContactInfo(String? primaryCareGiverContactInfo) =>
//       _primaryCareGiverContactInfo?.value = primaryCareGiverContactInfo;

//   String? get emergencyContactRelation => _emergencyContactRelation?.value;
//   set emergencyContactRelation(String? emergencyContactRelation) =>
//       _emergencyContactRelation?.value = emergencyContactRelation;

//   String? get morning => _morning?.value;
//   set morning(String? morning) => _morning?.value = morning;

//   int? get isExternal => _isExternal?.value;
//   set isExternal(int? isExternal) => _isExternal?.value = isExternal;

//   String? get afternoon => _afternoon?.value;
//   set afternoon(String? afternoon) => _afternoon?.value = afternoon;

//   String? get night => _night?.value;
//   set night(String? night) => _night?.value = night;

//   String? get emergencyContactNumber => _emergencyContactNumber?.value;
//   set emergencyContactNumber(String? emergencyContactNumber) =>
//       _emergencyContactNumber?.value = emergencyContactNumber;

//   String? get fcmToken => _fcmToken?.value;
//   set fcmToken(String? fcmToken) => _fcmToken?.value = fcmToken;

//   String? get point => _point?.value;
//   set point(String? point) => _point?.value = point;

//   String? get emergencyContactPersonName => _emergencyContactPersonName?.value;
//   set emergencyContactPersonName(String? emergencyContactPersonName) =>
//       _emergencyContactPersonName?.value = emergencyContactPersonName;

//   String? get authorizedBy => _authorizedBy?.value;
//   set authorizedBy(String? authorizedBy) => _authorizedBy?.value = authorizedBy;

//   String? get planId => _planId?.value;
//   set planId(String? planId) => _planId?.value = planId;

//   GeneralInfoController? get generalInfo => _generalInfo?.value;
//   set generalInfo(GeneralInfoController? generalInfo
