//**1st Model */
// class PrescriptionLIstModelResult {
//   bool? _error;
//   String? _msg;
//  // PrescriptionLIstModel? _data;
//  PrescriptionLIstModel? _data;
//   PrescriptionLIstModelResult({bool? error, String? msg, PrescriptionLIstModel? data}) {
//     if (error != null) {
//       this._error = error;
//     }
//     if (msg != null) {
//       this._msg = msg;
//     }
//     if (data != null) {
//       this._data = data;
//     }
//   }
//   bool? get error => _error;
//   set error(bool? error) => _error = error;
//   String? get msg => _msg;
//   set msg(String? msg) => _msg = msg;
//   PrescriptionLIstModel? get data => _data;
//   set data(PrescriptionLIstModel? data) => _data = data;

//   PrescriptionLIstModelResult.fromJson(Map<String, dynamic> json) {
//     _error = json['error'];
//     _msg = json['msg'];
//     _data = json['data'] != null ? new PrescriptionLIstModel.fromJson(json['data']) : null;
//   }
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['error'] = this._error;
//     data['msg'] = this._msg;
//     if (this._data != null) {
//       data['data'] = this._data!.toJson();
//     }
//     return data;
//   }
// }

// class PrescriptionLIstModel {
//   int? _currentPage;
//   List<PrescriptionList>? _data;
//   String? _firstPageUrl;
//   int? _from;
//   int? _lastPage;
//   String? _lastPageUrl;
//   String? _nextPageUrl;
//   String? _path;
//   int? _perPage;
//   String? _prevPageUrl;
//   int? _to;
//   int? _total;

//   PrescriptionLIstModel(
//       {int? currentPage,
//         List<PrescriptionList>? data,
//         String? firstPageUrl,
//         int? from,
//         int? lastPage,
//         String? lastPageUrl,
//         String? nextPageUrl,
//         String? path,
//         int? perPage,
//         String? prevPageUrl,
//         int? to,
//         int? total, required String imageurl}) {
//     if (currentPage != null) {
//       this._currentPage = currentPage;
//     }
//     if (data != null) {
//       this._data = data;
//     }
//     if (firstPageUrl != null) {
//       this._firstPageUrl = firstPageUrl;
//     }
//     if (from != null) {
//       this._from = from;
//     }
//     if (lastPage != null) {
//       this._lastPage = lastPage;
//     }
//     if (lastPageUrl != null) {
//       this._lastPageUrl = lastPageUrl;
//     }
//     if (nextPageUrl != null) {
//       this._nextPageUrl = nextPageUrl;
//     }
//     if (path != null) {
//       this._path = path;
//     }
//     if (perPage != null) {
//       this._perPage = perPage;
//     }
//     if (prevPageUrl != null) {
//       this._prevPageUrl = prevPageUrl;
//     }
//     if (to != null) {
//       this._to = to;
//     }
//     if (total != null) {
//       this._total = total;
//     }
//   }

//   int? get currentPage => _currentPage;
//   set currentPage(int? currentPage) => _currentPage = currentPage;
//   List<PrescriptionList>? get data => _data;
//   set data(List<PrescriptionList>? data) => _data = data;
//   String? get firstPageUrl => _firstPageUrl;
//   set firstPageUrl(String? firstPageUrl) => _firstPageUrl = firstPageUrl;
//   int? get from => _from;
//   set from(int? from) => _from = from;
//   int? get lastPage => _lastPage;
//   set lastPage(int? lastPage) => _lastPage = lastPage;
//   String? get lastPageUrl => _lastPageUrl;
//   set lastPageUrl(String? lastPageUrl) => _lastPageUrl = lastPageUrl;
//   String? get nextPageUrl => _nextPageUrl;
//   set nextPageUrl(String? nextPageUrl) => _nextPageUrl = nextPageUrl;
//   String? get path => _path;
//   set path(String? path) => _path = path;
//   int? get perPage => _perPage;
//   set perPage(int? perPage) => _perPage = perPage;
//   String? get prevPageUrl => _prevPageUrl;
//   set prevPageUrl(String? prevPageUrl) => _prevPageUrl = prevPageUrl;
//   int? get to => _to;
//   set to(int? to) => _to = to;
//   int? get total => _total;
//   set total(int? total) => _total = total;

//   PrescriptionLIstModel.fromJson(Map<String, dynamic> json) {
//     _currentPage = json['current_page'];
//     if (json['data'] != null) {
//       _data = <PrescriptionList>[];
//       json['data'].forEach((v) {
//         _data!.add(new PrescriptionList.fromJson(v));
//       });
//     }
//     _firstPageUrl = json['first_page_url'];
//     _from = json['from'];
//     _lastPage = json['last_page'];
//     _lastPageUrl = json['last_page_url'];
//     _nextPageUrl = json['next_page_url'];
//     _path = json['path'];
//     _perPage = json['per_page'];
//     _prevPageUrl = json['prev_page_url'];
//     _to = json['to'];
//     _total = json['total'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['current_page'] = this._currentPage;
//     if (this._data != null) {
//       data['data'] = this._data!.map((v) => v.toJson()).toList();
//     }
//     data['first_page_url'] = this._firstPageUrl;
//     data['from'] = this._from;
//     data['last_page'] = this._lastPage;
//     data['last_page_url'] = this._lastPageUrl;
//     data['next_page_url'] = this._nextPageUrl;
//     data['path'] = this._path;
//     data['per_page'] = this._perPage;
//     data['prev_page_url'] = this._prevPageUrl;
//     data['to'] = this._to;
//     data['total'] = this._total;
//     return data;
//   }
// }

// class PrescriptionList {
//   int? _id;
//   String? _heading;
//   String? _drName;
//   int? _userId;
//   String? _imageurl;
//   String? _image;
//   PrescriptionList(
//       {int? id,
//         String? heading,
//         String? drName,
//         int? userId,
//         String? imageurl,
//         String? image}) {
//     if (id != null) {
//       this._id = id;
//     }
//     if (heading != null) {
//       this._heading = heading;
//     }
//     if (drName != null) {
//       this._drName = drName;
//     }
//     if (userId != null) {
//       this._userId = userId;
//     }
//     if (imageurl != null) {
//       this._imageurl = imageurl;
//     }
//     if (image != null) {
//       this._image = image;
//     }
//   }
//   int? get id => _id;
//   set id(int? id) => _id = id;
//   String? get heading => _heading;
//   set heading(String? heading) => _heading = heading;
//   String? get drName => _drName;
//   set drName(String? drName) => _drName = drName;
//   int? get userId => _userId;
//   set userId(int? userId) => _userId = userId;
//   String? get imageurl => _imageurl;
//   set imageurl(String? imageurl) => _imageurl = imageurl;
//   String? get image => _image;
//   set image(String? image) => _image = image;

//   PrescriptionList.fromJson(Map<String, dynamic> json) {
//     _id = json['id'];
//     _heading = json['heading'];
//     _drName = json['dr_name'];
//     _userId = json['user_id'];
//     _imageurl = json['imageurl'];
//     _image = json['image'];
//   }
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this._id;
//     data['heading'] = this._heading;
//     data['dr_name'] = this._drName;
//     data['user_id'] = this._userId;
//     data['imageurl'] = this._imageurl;
//     data['image'] = this._image;
//     return data;
//   }
// }
//***1st Model End **************/

///***2nd Model */
// class PrescriptionLIstModelResult {
//   bool? _error;
//   String? _msg;
//  // PrescriptionLIstModel? _data;
//  List <PrescriptionLIstModel>? _data;
//   PrescriptionLIstModelResult({bool? error, String? msg, List <PrescriptionLIstModel>? data}) {
//     if (error != null) {
//       this._error = error;
//     }
//     if (msg != null) {
//       this._msg = msg;
//     }
//     if (data != null) {
//       this._data = data;
//     }
//   }
//   bool? get error => _error;
//   set error(bool? error) => _error = error;
//   String? get msg => _msg;
//   set msg(String? msg) => _msg = msg;
//   List <PrescriptionLIstModel>? get data => _data;
//   set data(List <PrescriptionLIstModel>? data) => _data = data;

//   PrescriptionLIstModelResult.fromJson(Map<String, dynamic> json) {
//     _error = json['error'];
//     _msg = json['msg'];
//     //_data = json['data'] != null ? new PrescriptionLIstModel.fromJson(json['data']) : null;
//      if (json['data'] != null) {
//       _data = <PrescriptionLIstModel>[];
//       json['data'].forEach((x) {
//         _data!.add(new PrescriptionLIstModel.fromJson(x));
//       });
//     }
//   }
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['error'] = this._error;
//     data['msg'] = this._msg;
//     if (this._data != null) {
//       data['data'] = this._data!.map((x) => x.toJson()).toList();
//       //this._data!.toJson();
//     }
//     return data;
//   }
// }

// class PrescriptionLIstModel {
//   int? _currentPage;
//   List<PrescriptionList>? _data;
//   String? _firstPageUrl;
//   int? _from;
//   int? _lastPage;
//   String? _lastPageUrl;
//   String? _nextPageUrl;
//   String? _path;
//   int? _perPage;
//   String? _prevPageUrl;
//   int? _to;
//   int? _total;

//   PrescriptionLIstModel(
//       {int? currentPage,
//         List<PrescriptionList>? data,
//         String? firstPageUrl,
//         int? from,
//         int? lastPage,
//         String? lastPageUrl,
//         String? nextPageUrl,
//         String? path,
//         int? perPage,
//         String? prevPageUrl,
//         int? to,
//         int? total}) {
//     if (currentPage != null) {
//       this._currentPage = currentPage;
//     }
//     if (data != null) {
//       this._data = data;
//     }
//     if (firstPageUrl != null) {
//       this._firstPageUrl = firstPageUrl;
//     }
//     if (from != null) {
//       this._from = from;
//     }
//     if (lastPage != null) {
//       this._lastPage = lastPage;
//     }
//     if (lastPageUrl != null) {
//       this._lastPageUrl = lastPageUrl;
//     }
//     if (nextPageUrl != null) {
//       this._nextPageUrl = nextPageUrl;
//     }
//     if (path != null) {
//       this._path = path;
//     }
//     if (perPage != null) {
//       this._perPage = perPage;
//     }
//     if (prevPageUrl != null) {
//       this._prevPageUrl = prevPageUrl;
//     }
//     if (to != null) {
//       this._to = to;
//     }
//     if (total != null) {
//       this._total = total;
//     }
//   }

//   int? get currentPage => _currentPage;
//   set currentPage(int? currentPage) => _currentPage = currentPage;
//   List<PrescriptionList>? get data => _data;
//   set data(List<PrescriptionList>? data) => _data = data;
//   String? get firstPageUrl => _firstPageUrl;
//   set firstPageUrl(String? firstPageUrl) => _firstPageUrl = firstPageUrl;
//   int? get from => _from;
//   set from(int? from) => _from = from;
//   int? get lastPage => _lastPage;
//   set lastPage(int? lastPage) => _lastPage = lastPage;
//   String? get lastPageUrl => _lastPageUrl;
//   set lastPageUrl(String? lastPageUrl) => _lastPageUrl = lastPageUrl;
//   String? get nextPageUrl => _nextPageUrl;
//   set nextPageUrl(String? nextPageUrl) => _nextPageUrl = nextPageUrl;
//   String? get path => _path;
//   set path(String? path) => _path = path;
//   int? get perPage => _perPage;
//   set perPage(int? perPage) => _perPage = perPage;
//   String? get prevPageUrl => _prevPageUrl;
//   set prevPageUrl(String? prevPageUrl) => _prevPageUrl = prevPageUrl;
//   int? get to => _to;
//   set to(int? to) => _to = to;
//   int? get total => _total;
//   set total(int? total) => _total = total;

//   PrescriptionLIstModel.fromJson(Map<String, dynamic> json) {
//     _currentPage = json['current_page'];
//     if (json['data'] != null) {
//       _data = <PrescriptionList>[];
//       json['data'].forEach((v) {
//         _data!.add(new PrescriptionList.fromJson(v));
//       });
//     }
//     _firstPageUrl = json['first_page_url'];
//     _from = json['from'];
//     _lastPage = json['last_page'];
//     _lastPageUrl = json['last_page_url'];
//     _nextPageUrl = json['next_page_url'];
//     _path = json['path'];
//     _perPage = json['per_page'];
//     _prevPageUrl = json['prev_page_url'];
//     _to = json['to'];
//     _total = json['total'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['current_page'] = this._currentPage;
//     if (this._data != null) {
//       data['data'] = this._data!.map((v) => v.toJson()).toList();
//     }
//     data['first_page_url'] = this._firstPageUrl;
//     data['from'] = this._from;
//     data['last_page'] = this._lastPage;
//     data['last_page_url'] = this._lastPageUrl;
//     data['next_page_url'] = this._nextPageUrl;
//     data['path'] = this._path;
//     data['per_page'] = this._perPage;
//     data['prev_page_url'] = this._prevPageUrl;
//     data['to'] = this._to;
//     data['total'] = this._total;
//     return data;
//   }
// }

// class PrescriptionList {
//   int? _id;
//   String? _heading;
//   String? _drName;
//   int? _userId;
//   String? _imageurl;
//   String? _image;
//   PrescriptionList(
//       {int? id,
//         String? heading,
//         String? drName,
//         int? userId,
//         String? imageurl,
//         String? image}) {
//     if (id != null) {
//       this._id = id;
//     }
//     if (heading != null) {
//       this._heading = heading;
//     }
//     if (drName != null) {
//       this._drName = drName;
//     }
//     if (userId != null) {
//       this._userId = userId;
//     }
//     if (imageurl != null) {
//       this._imageurl = imageurl;
//     }
//     if (image != null) {
//       this._image = image;
//     }
//   }
//   int? get id => _id;
//   set id(int? id) => _id = id;
//   String? get heading => _heading;
//   set heading(String? heading) => _heading = heading;
//   String? get drName => _drName;
//   set drName(String? drName) => _drName = drName;
//   int? get userId => _userId;
//   set userId(int? userId) => _userId = userId;
//   String? get imageurl => _imageurl;
//   set imageurl(String? imageurl) => _imageurl = imageurl;
//   String? get image => _image;
//   set image(String? image) => _image = image;

//   PrescriptionList.fromJson(Map<String, dynamic> json) {
//     _id = json['id'];
//     _heading = json['heading'];
//     _drName = json['dr_name'];
//     _userId = json['user_id'];
//     _imageurl = json['imageurl'];
//     _image = json['image'];
//   }
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this._id;
//     data['heading'] = this._heading;
//     data['dr_name'] = this._drName;
//     data['user_id'] = this._userId;
//     data['imageurl'] = this._imageurl;
//     data['image'] = this._image;
//     return data;
//   }
// }
///***2nd model End */

///*****3rd Model Start */
// class PrescriptionLIstModelResult {
//   bool? _error;
//   String? _msg;
//   PrescriptionLIstModel? _data;

//   PrescriptionLIstModelResult({bool? error, String? msg, PrescriptionLIstModel? data}) {
//     if (error != null) {
//       this._error = error;
//     }
//     if (msg != null) {
//       this._msg = msg;
//     }
//     if (data != null) {
//       this._data = data;
//     }
//   }

//   bool? get error => _error;
//   set error(bool? error) => _error = error;
//   String? get msg => _msg;
//   set msg(String? msg) => _msg = msg;
//   PrescriptionLIstModel? get data => _data;
//   set data(PrescriptionLIstModel? data) => _data = data;

//   PrescriptionLIstModelResult.fromJson(Map<String, dynamic> json) {
//     _error = json['error'];
//     _msg = json['msg'];
//     _data = json['data'] != null ? PrescriptionLIstModel.fromJson(json['data']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['error'] = this._error;
//     data['msg'] = this._msg;
//     if (this._data != null) {
//       data['data'] = this._data!.toJson();
//     }
//     return data;
//   }
// }

// class PrescriptionLIstModel {
//   int? _currentPage;
//   PrescriptionListData? _data; // Adjusted this line
//   String? _firstPageUrl;
//   int? _from;
//   int? _lastPage;
//   String? _lastPageUrl;
//   String? _nextPageUrl;
//   String? _path;
//   int? _perPage;
//   String? _prevPageUrl;
//   int? _to;
//   int? _total;

//   PrescriptionLIstModel(  {
//     int? currentPage,
//     PrescriptionListData? data, // Adjusted this line
//     String? firstPageUrl,
//     int? from,
//     int? lastPage,
//     String? lastPageUrl,
//     String? nextPageUrl,
//     String? path,
//     int? perPage,
//     String? prevPageUrl,
//     int? to,
//     int? total,
//   }) {
//     if (currentPage != null) {
//       this._currentPage = currentPage;
//     }
//     if (data != null) {
//       this._data = data;
//     }
//     if (firstPageUrl != null) {
//       this._firstPageUrl = firstPageUrl;
//     }
//     if (from != null) {
//       this._from = from;
//     }
//     if (lastPage != null) {
//       this._lastPage = lastPage;
//     }
//     if (lastPageUrl != null) {
//       this._lastPageUrl = lastPageUrl;
//     }
//     if (nextPageUrl != null) {
//       this._nextPageUrl = nextPageUrl;
//     }
//     if (path != null) {
//       this._path = path;
//     }
//     if (perPage != null) {
//       this._perPage = perPage;
//     }
//     if (prevPageUrl != null) {
//       this._prevPageUrl = prevPageUrl;
//     }
//     if (to != null) {
//       this._to = to;
//     }
//     if (total != null) {
//       this._total = total;
//     }
//   }

//   int? get currentPage => _currentPage;
//   set currentPage(int? currentPage) => _currentPage = currentPage;
//   PrescriptionListData? get data => _data;
//   set data(PrescriptionListData? data) => _data = data;
//   String? get firstPageUrl => _firstPageUrl;
//   set firstPageUrl(String? firstPageUrl) => _firstPageUrl = firstPageUrl;
//   int? get from => _from;
//   set from(int? from) => _from = from;
//   int? get lastPage => _lastPage;
//   set lastPage(int? lastPage) => _lastPage = lastPage;
//   String? get lastPageUrl => _lastPageUrl;
//   set lastPageUrl(String? lastPageUrl) => _lastPageUrl = lastPageUrl;
//   String? get nextPageUrl => _nextPageUrl;
//   set nextPageUrl(String? nextPageUrl) => _nextPageUrl = nextPageUrl;
//   String? get path => _path;
//   set path(String? path) => _path = path;
//   int? get perPage => _perPage;
//   set perPage(int? perPage) => _perPage = perPage;
//   String? get prevPageUrl => _prevPageUrl;
//   set prevPageUrl(String? prevPageUrl) => _prevPageUrl = prevPageUrl;
//   int? get to => _to;
//   set to(int? to) => _to = to;
//   int? get total => _total;
//   set total(int? total) => _total = total;

//   PrescriptionLIstModel.fromJson(Map<String, dynamic> json) {
//     _currentPage = json['current_page'];
//     _data = json['data'] != null ? PrescriptionListData.fromJson(json['data']) : null;
//     _firstPageUrl = json['first_page_url'];
//     _from = json['from'];
//     _lastPage = json['last_page'];
//     _lastPageUrl = json['last_page_url'];
//     _nextPageUrl = json['next_page_url'];
//     _path = json['path'];
//     _perPage = json['per_page'];
//     _prevPageUrl = json['prev_page_url'];
//     _to = json['to'];
//     _total = json['total'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['current_page'] = this._currentPage;
//     if (this._data != null) {
//       data['data'] = this._data!.toJson();
//     }
//     data['first_page_url'] = this._firstPageUrl;
//     data['from'] = this._from;
//     data['last_page'] = this._lastPage;
//     data['last_page_url'] = this._lastPageUrl;
//     data['next_page_url'] = this._nextPageUrl;
//     data['path'] = this._path;
//     data['per_page'] = this._perPage;
//     data['prev_page_url'] = this._prevPageUrl;
//     data['to'] = this._to;
//     data['total'] = this._total;
//     return data;
//   }
// }

// class PrescriptionListData {
//   int? _currentPage;
//   List<PrescriptionList>? _dataList;

//   PrescriptionListData({
//     int? currentPage,
//     List<PrescriptionList>? dataList,
//   }) {
//     if (currentPage != null) {
//       this._currentPage = currentPage;
//     }
//     if (dataList != null) {
//       this._dataList = dataList;
//     }
//   }

//   int? get currentPage => _currentPage;
//   set currentPage(int? currentPage) => _currentPage = currentPage;
//   List<PrescriptionList>? get dataList => _dataList;
//   set dataList(List<PrescriptionList>? dataList) => _dataList = dataList;

//   PrescriptionListData.fromJson(Map<String, dynamic> json) {
//     _currentPage = json['current_page'];
//     if (json['data'] != null) {
//       _dataList = <PrescriptionList>[];
//       json['data'].forEach((v) {
//         _dataList!.add(new PrescriptionList.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['current_page'] = this._currentPage;
//     if (this._dataList != null) {
//       data['data'] = this._dataList!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class PrescriptionList {
//   int? _id;
//   String? _heading;
//   String? _drName;
//   int? _userId;
//   String? _imageurl;
//   String? _image;

//   PrescriptionList({
//     int? id,
//     String? heading,
//     String? drName,
//     int? userId,
//     String? imageurl,
//     String? image,
//   }) {
//     if (id != null) {
//       this._id = id;
//     }
//     if (heading != null) {
//       this._heading = heading;
//     }
//     if (drName != null) {
//       this._drName = drName;
//     }
//     if (userId != null) {
//       this._userId = userId;
//     }
//     if (imageurl != null) {
//       this._imageurl = imageurl;
//     }
//     if (image != null) {
//       this._image = image;
//     }
//   }

//   int? get id => _id;
//   set id(int? id) => _id = id;
//   String? get heading => _heading;
//   set heading(String? heading) => _heading = heading;
//   String? get drName => _drName;
//   set drName(String? drName) => _drName = drName;
//   int? get userId => _userId;
//   set userId(int? userId) => _userId = userId;
//   String? get imageurl => _imageurl;
//   set imageurl(String? imageurl) => _imageurl = imageurl;
//   String? get image => _image;
//   set image(String? image) => _image = image;

//   PrescriptionList.fromJson(Map<String, dynamic> json) {
//     _id = json['id'];
//     _heading = json['heading'];
//     _drName = json['dr_name'];
//     _userId = json['user_id'];
//     _imageurl = json['imageurl'];
//     _image = json['image'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this._id;
//     data['heading'] = this._heading;
//     data['dr_name'] = this._drName;
//     data['user_id'] = this._userId;
//     data['imageurl'] = this._imageurl;
//     data['image'] = this._image;
//     return data;
//   }
// }

///***3rd Model ends */
class PrescriptionLIstModel {
  bool? error;
  String? msg;
  List<PrescriptionList>? data;

  PrescriptionLIstModel({this.error, this.msg, this.data});

  PrescriptionLIstModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <PrescriptionList>[];
      json['data'].forEach((v) {
        data!.add(new PrescriptionList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PrescriptionList {
  int? id;
  String? heading;
  String? doctorName;
  int? doctorId;
  int? userId;
  String? image;
  String? imageurl;

  PrescriptionList(
      {this.id,
      this.heading,
      this.doctorName,
      this.doctorId,
      this.userId,
      this.image,
      this.imageurl});

  PrescriptionList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    heading = json['heading'];
    doctorName = json['doctor_name'];
    doctorId = json['doctor_id'];
    userId = json['user_id'];
    image = json['image'];
    imageurl = json['imageurl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['heading'] = this.heading;
    data['doctor_name'] = this.doctorName;
    data['doctor_id'] = this.doctorId;
    data['user_id'] = this.userId;
    data['image'] = this.image;
    data['imageurl'] = this.imageurl;
    return data;
  }
}
