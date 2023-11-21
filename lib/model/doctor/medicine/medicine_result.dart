import 'package:hive/hive.dart';
part 'medicine_result.g.dart';
class MedicineSearch {
  bool? _error;
  String? _msg;
  List<MedicineInfo>? _data;

  MedicineSearch({bool? error, String? msg, List<MedicineInfo>? data}) {
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
  List<MedicineInfo>? get data => _data;
  set data(List<MedicineInfo>? data) => _data = data;

  MedicineSearch.fromJson(Map<String, dynamic> json) {
    _error = json['error'];
    _msg = json['msg'];
    if (json['data'] != null) {
      _data = <MedicineInfo>[];
      json['data'].forEach((v) {
        _data!.add(new MedicineInfo.fromJson(v));
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


@HiveType(typeId: 0)
class MedicineInfo extends HiveObject{
  @HiveField(0)
  int? _id;
  @HiveField(1)
  String? _nameOfManufacturer;
  @HiveField(2)
  String? _brandName;
  @HiveField(3)
  String? _genericName;
  @HiveField(4)
  String? _strength;
  @HiveField(5)
  String? _dosageDescription;
  @HiveField(6)
  String? _price;
  @HiveField(7)
  String? _category;
  @HiveField(8)
  String? _useFor;
  @HiveField(9)
  String? _indication;
  @HiveField(10)
  String? _contraindication;
  @HiveField(11)
  String? _sideEffects;
  @HiveField(12)
  int? _status;
  @HiveField(13)
  String? _dar;
  @HiveField(14)
  String? _createdAt;
  @HiveField(15)
  String? _updatedAt;


  MedicineInfo(
      {int? id,
        String? nameOfManufacturer,
        String? brandName,
        String? genericName,
        String? strength,
        String? dosageDescription,
        String? price,
        String? category,
        String? useFor,
        String? indication,
        String? contraindication,
        String? sideEffects,
        int? status,
        String? dar,
        String? createdAt,
        String? updatedAt}) {
    if (id != null) {
      this._id = id;
    }
    if (nameOfManufacturer != null) {
      this._nameOfManufacturer = nameOfManufacturer;
    }
    if (brandName != null) {
      this._brandName = brandName;
    }
    if (genericName != null) {
      this._genericName = genericName;
    }
    if (strength != null) {
      this._strength = strength;
    }
    if (dosageDescription != null) {
      this._dosageDescription = dosageDescription;
    }
    if (price != null) {
      this._price = price;
    }
    if (category != null) {
      this._category = category;
    }
    if (useFor != null) {
      this._useFor = useFor;
    }
    if (indication != null) {
      this._indication = indication;
    }
    if (contraindication != null) {
      this._contraindication = contraindication;
    }
    if (sideEffects != null) {
      this._sideEffects = sideEffects;
    }
    if (status != null) {
      this._status = status;
    }
    if (dar != null) {
      this._dar = dar;
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
  String? get nameOfManufacturer => _nameOfManufacturer;
  set nameOfManufacturer(String? nameOfManufacturer) =>
      _nameOfManufacturer = nameOfManufacturer;
  String? get brandName => _brandName;
  set brandName(String? brandName) => _brandName = brandName;
  String? get genericName => _genericName;
  set genericName(String? genericName) => _genericName = genericName;
  String? get strength => _strength;
  set strength(String? strength) => _strength = strength;
  String? get dosageDescription => _dosageDescription;
  set dosageDescription(String? dosageDescription) =>
      _dosageDescription = dosageDescription;
  String? get price => _price;
  set price(String? price) => _price = price;
  String? get category => _category;
  set category(String? category) => _category = category;
  String? get useFor => _useFor;
  set useFor(String? useFor) => _useFor = useFor;
  String? get indication => _indication;
  set indication(String? indication) => _indication = indication;
  String? get contraindication => _contraindication;
  set contraindication(String? contraindication) =>
      _contraindication = contraindication;
  String? get sideEffects => _sideEffects;
  set sideEffects(String? sideEffects) => _sideEffects = sideEffects;
  int? get status => _status;
  set status(int? status) => _status = status;
  String? get dar => _dar;
  set dar(String? dar) => _dar = dar;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  MedicineInfo.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _nameOfManufacturer = json['name_of_manufacturer'];
    _brandName = json['brand_name'];
    _genericName = json['generic_name'];
    _strength = json['strength'];
    _dosageDescription = json['dosage_description'];
    _price = json['price'];
    _category = json['category'];
    _useFor = json['use_for'];
    _indication = json['indication'];
    _contraindication = json['contraindication'];
    _sideEffects = json['side_effects'];
    _status = json['status'];
    _dar = json['dar'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name_of_manufacturer'] = this._nameOfManufacturer;
    data['brand_name'] = this._brandName;
    data['generic_name'] = this._genericName;
    data['strength'] = this._strength;
    data['dosage_description'] = this._dosageDescription;
    data['price'] = this._price;
    data['category'] = this._category;
    data['use_for'] = this._useFor;
    data['indication'] = this._indication;
    data['contraindication'] = this._contraindication;
    data['side_effects'] = this._sideEffects;
    data['status'] = this._status;
    data['dar'] = this._dar;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}