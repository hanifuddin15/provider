import 'package:hive/hive.dart';
part 'medicine_list_user.g.dart';
class UserMedicineModel {
  bool? _error;
  String? _msg;
  List<UserMedicine>? _data;

  UserMedicineModel({bool? error, String? msg, List<UserMedicine>? data}) {
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
  List<UserMedicine>? get data => _data;
  set data(List<UserMedicine>? data) => _data = data;

  // UserMedicineModel.fromJson(Map<String, dynamic> json) {
  //   _error = json['error'];
  //   _msg = json['msg'];
  //   if (json['data'] != null) {
  //     _data = <UserMedicine>[];
  //     json['data'].forEach((v) {
  //       _data!.add(new UserMedicine.fromJson(v));
  //     });
  //   }
  // }
  //***2nd */
//   UserMedicineModel.fromJson(Map<String, dynamic> json) {
//   _error = json['error'];
//   _msg = json['msg'];
//   if (json['data'] != null) {
//     _data = <UserMedicine>[];
//     if (json['data'] is List) {
//       json['data'].forEach((v) {
//         _data!.add(UserMedicine.fromJson(v));
//       });
//     }
//   }
// }

///****2nd  */
///^^ 3rd attempt by hanif
UserMedicineModel.fromJson(Map<String, dynamic> json) {
  _error = json['error'];
  _msg = json['msg'];
  
  if (json['data'] != null) {
    final Map<String, dynamic> data = json['data'];
    _data = <UserMedicine>[];
    
    if (data['data'] != null && data['data'] is List) {
      data['data'].forEach((v) {
        _data!.add(UserMedicine.fromJson(v));
      });
    }
  }
}
///**specially modified by hanif  3rd*/
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

@HiveType(typeId: 7)
class UserMedicine extends HiveObject {
  @HiveField(0)
  int? _id;
  @HiveField(1)
  String? _type;
  @HiveField(2)
  String? _medicineName;
  @HiveField(3)
  String? _genericName;
  @HiveField(4)
  String? _measurement;
  @HiveField(5)
  String? _measurementUnit;
  @HiveField(6)
  String? _morning;
  @HiveField(7)
  String? _afternoon;
  @HiveField(8)
  String? _night;
  @HiveField(9)
  int? _isNotified;
  @HiveField(10)
  String? _photo;
  @HiveField(11)
  String? _photourl;
  @HiveField(12)
  String? _barQrCode;
  @HiveField(13)
  String? _howManyDays;
  @HiveField(14)
  String? _howMuch;
  @HiveField(15)
  String? _beforeOrAfterMeal;
  @HiveField(16)
  String? _medicineStatus;
  @HiveField(17)
  String? _howManyMedicineHave;

  UserMedicine(
      {int? id,
        String? type,
        String? medicineName,
        String? genericName,
        String? measurement,
        String? measurementUnit,
        String? morning,
        String? afternoon,
        String? night,
        int? isNotified,
        String? photo,
        String? photourl,
        String? barQrCode,
        String? howManyDays,
        String? howMuch,
        String? beforeOrAfterMeal,
        String? medicineStatus,
        String? howManyMedicineHave}) {
    if (id != null) {
      this._id = id;
    }
    if (type != null) {
      this._type = type;
    }
    if (medicineName != null) {
      this._medicineName = medicineName;
    }
    if (genericName != null) {
      this._genericName = genericName;
    }
    if (measurement != null) {
      this._measurement = measurement;
    }
    if (measurementUnit != null) {
      this._measurementUnit = measurementUnit;
    }
    if (morning != null) {
      this._morning = morning;
    }
    if (afternoon != null) {
      this._afternoon = afternoon;
    }
    if (night != null) {
      this._night = night;
    }
    if (isNotified != null) {
      this._isNotified = isNotified;
    }
    if (photo != null) {
      this._photo = photo;
    }
    if (photourl != null) {
      this._photourl = photourl;
    }
    if (barQrCode != null) {
      this._barQrCode = barQrCode;
    }
    if (howManyDays != null) {
      this._howManyDays = howManyDays;
    }
    if (howMuch != null) {
      this._howMuch = howMuch;
    }
    if (beforeOrAfterMeal != null) {
      this._beforeOrAfterMeal = beforeOrAfterMeal;
    }
    if (medicineStatus != null) {
      this._medicineStatus = medicineStatus;
    }
    if (howManyMedicineHave != null) {
      this._howManyMedicineHave = howManyMedicineHave;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get type => _type;
  set type(String? type) => _type = type;
  String? get medicineName => _medicineName;
  set medicineName(String? medicineName) => _medicineName = medicineName;
  String? get genericName => _genericName;
  set genericName(String? genericName) => _genericName = genericName;
  String? get measurement => _measurement;
  set measurement(String? measurement) => _measurement = measurement;
  String? get measurementUnit => _measurementUnit;
  set measurementUnit(String? measurementUnit) =>
      _measurementUnit = measurementUnit;
  String? get morning => _morning;
  set morning(String? morning) => _morning = morning;
  String? get afternoon => _afternoon;
  set afternoon(String? afternoon) => _afternoon = afternoon;
  String? get night => _night;
  set night(String? night) => _night = night;
  int? get isNotified => _isNotified;
  set isNotified(int? isNotified) => _isNotified = isNotified;
  String? get photo => _photo;
  set photo(String? photo) => _photo = photo;
  String? get photourl => _photourl;
  set photourl(String? photourl) => _photourl = photourl;
  String? get barQrCode => _barQrCode;
  set barQrCode(String? barQrCode) => _barQrCode = barQrCode;
  String? get howManyDays => _howManyDays;
  set howManyDays(String? howManyDays) => _howManyDays = howManyDays;
  String? get howMuch => _howMuch;
  set howMuch(String? howMuch) => _howMuch = howMuch;
  String? get beforeOrAfterMeal => _beforeOrAfterMeal;
  set beforeOrAfterMeal(String? beforeOrAfterMeal) =>
      _beforeOrAfterMeal = beforeOrAfterMeal;
  String? get medicineStatus => _medicineStatus;
  set medicineStatus(String? medicineStatus) =>
      _medicineStatus = medicineStatus;
  String? get howManyMedicineHave => _howManyMedicineHave;
  set howManyMedicineHave(String? howManyMedicineHave) =>
      _howManyMedicineHave = howManyMedicineHave;

  UserMedicine.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _type = json['type'];
    _medicineName = json['medicine_name'];
    _genericName = json['generic_name'];
    _measurement = json['measurement'];
    _measurementUnit = json['measurement_unit'];
    _morning = json['morning'];
    _afternoon = json['afternoon'];
    _night = json['night'];
    _isNotified = json['is_notified'];
    _photo = json['photo'];
    _photourl = json['photourl'];
    _barQrCode = json['bar_qr_code'];
    _howManyDays = json['how_many_days'];
    _howMuch = json['how_much'];
    _beforeOrAfterMeal = json['before_or_after_meal'];
    _medicineStatus = json['medicine_status'];
    _howManyMedicineHave = json['how_many_medicine_have'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['type'] = this._type;
    data['medicine_name'] = this._medicineName;
    data['generic_name'] = this._genericName;
    data['measurement'] = this._measurement;
    data['measurement_unit'] = this._measurementUnit;
    data['morning'] = this._morning;
    data['afternoon'] = this._afternoon;
    data['night'] = this._night;
    data['is_notified'] = this._isNotified;
    data['photo'] = this._photo;
    data['photourl'] = this._photourl;
    data['bar_qr_code'] = this._barQrCode;
    data['how_many_days'] = this._howManyDays;
    data['how_much'] = this._howMuch;
    data['before_or_after_meal'] = this._beforeOrAfterMeal;
    data['medicine_status'] = this._medicineStatus;
    data['how_many_medicine_have'] = this._howManyMedicineHave;
    return data;
  }
}