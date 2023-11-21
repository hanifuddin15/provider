class ScheduleListResult {
  bool? _error;
  String? _msg;
  ScheduleResult? _data;

  ScheduleListResult({bool? error, String? msg, ScheduleResult? data}) {
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
  ScheduleResult? get data => _data;
  set data(ScheduleResult? data) => _data = data;

  ScheduleListResult.fromJson(Map<String, dynamic> json) {
    _error = json['error'];
    _msg = json['msg'];
    _data = json['data'] != null ? new ScheduleResult.fromJson(json['data']) : null;
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

class ScheduleResult {
  ExternalScheduleList? _externalScheduleList;
  PatCode? _patCode;

  ScheduleResult({ExternalScheduleList? externalScheduleList, PatCode? patCode}) {
    if (externalScheduleList != null) {
      this._externalScheduleList = externalScheduleList;
    }
    if (patCode != null) {
      this._patCode = patCode;
    }
  }

  ExternalScheduleList? get externalScheduleList => _externalScheduleList;
  set externalScheduleList(ExternalScheduleList? externalScheduleList) =>
      _externalScheduleList = externalScheduleList;
  PatCode? get patCode => _patCode;
  set patCode(PatCode? patCode) => _patCode = patCode;

  ScheduleResult.fromJson(Map<String, dynamic> json) {
    _externalScheduleList = json['external_schedule_list'] != null
        ? new ExternalScheduleList.fromJson(json['external_schedule_list'])
        : null;
    _patCode = json['pat_code'] != null
        ? new PatCode.fromJson(json['pat_code'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._externalScheduleList != null) {
      data['external_schedule_list'] = this._externalScheduleList!.toJson();
    }
    if (this._patCode != null) {
      data['pat_code'] = this._patCode!.toJson();
    }
    return data;
  }
}

class ExternalScheduleList {
  int? _currentPage;
  List<SchedulePatient>? _data;
  String? _firstPageUrl;
  int? _from;
  int? _lastPage;
  String? _lastPageUrl;
  String? _nextPageUrl;
  String? _path;
  int? _perPage;
  String? _prevPageUrl;
  int? _to;
  int? _total;

  ExternalScheduleList(
      {int? currentPage,
        List<SchedulePatient>? data,
        String? firstPageUrl,
        int? from,
        int? lastPage,
        String? lastPageUrl,
        String? nextPageUrl,
        String? path,
        int? perPage,
        String? prevPageUrl,
        int? to,
        int? total}) {
    if (currentPage != null) {
      this._currentPage = currentPage;
    }
    if (data != null) {
      this._data = data;
    }
    if (firstPageUrl != null) {
      this._firstPageUrl = firstPageUrl;
    }
    if (from != null) {
      this._from = from;
    }
    if (lastPage != null) {
      this._lastPage = lastPage;
    }
    if (lastPageUrl != null) {
      this._lastPageUrl = lastPageUrl;
    }
    if (nextPageUrl != null) {
      this._nextPageUrl = nextPageUrl;
    }
    if (path != null) {
      this._path = path;
    }
    if (perPage != null) {
      this._perPage = perPage;
    }
    if (prevPageUrl != null) {
      this._prevPageUrl = prevPageUrl;
    }
    if (to != null) {
      this._to = to;
    }
    if (total != null) {
      this._total = total;
    }
  }

  int? get currentPage => _currentPage;
  set currentPage(int? currentPage) => _currentPage = currentPage;
  List<SchedulePatient>? get data => _data;
  set data(List<SchedulePatient>? data) => _data = data;
  String? get firstPageUrl => _firstPageUrl;
  set firstPageUrl(String? firstPageUrl) => _firstPageUrl = firstPageUrl;
  int? get from => _from;
  set from(int? from) => _from = from;
  int? get lastPage => _lastPage;
  set lastPage(int? lastPage) => _lastPage = lastPage;
  String? get lastPageUrl => _lastPageUrl;
  set lastPageUrl(String? lastPageUrl) => _lastPageUrl = lastPageUrl;
  String? get nextPageUrl => _nextPageUrl;
  set nextPageUrl(String? nextPageUrl) => _nextPageUrl = nextPageUrl;
  String? get path => _path;
  set path(String? path) => _path = path;
  int? get perPage => _perPage;
  set perPage(int? perPage) => _perPage = perPage;
  String? get prevPageUrl => _prevPageUrl;
  set prevPageUrl(String? prevPageUrl) => _prevPageUrl = prevPageUrl;
  int? get to => _to;
  set to(int? to) => _to = to;
  int? get total => _total;
  set total(int? total) => _total = total;

  ExternalScheduleList.fromJson(Map<String, dynamic> json) {
    _currentPage = json['current_page'];
    if (json['data'] != null) {
      _data = <SchedulePatient>[];
      json['data'].forEach((v) {
        _data!.add(new SchedulePatient.fromJson(v));
      });
    }
    _firstPageUrl = json['first_page_url'];
    _from = json['from'];
    _lastPage = json['last_page'];
    _lastPageUrl = json['last_page_url'];
    _nextPageUrl = json['next_page_url'];
    _path = json['path'];
    _perPage = json['per_page'];
    _prevPageUrl = json['prev_page_url'];
    _to = json['to'];
    _total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this._currentPage;
    if (this._data != null) {
      data['data'] = this._data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this._firstPageUrl;
    data['from'] = this._from;
    data['last_page'] = this._lastPage;
    data['last_page_url'] = this._lastPageUrl;
    data['next_page_url'] = this._nextPageUrl;
    data['path'] = this._path;
    data['per_page'] = this._perPage;
    data['prev_page_url'] = this._prevPageUrl;
    data['to'] = this._to;
    data['total'] = this._total;
    return data;
  }
}

class SchedulePatient {
  int? _id;
  int? _physicianId;
  String? _type;
  int? _memberId;
  String? _sdate;
  String? _stime;
  String? _sday;
  String? _remarks;
  String? _instantFeedback;
  int? _feedbackReview;
  int? _anyMoreHelp;
  String? _anyMoreHelpDetails;
  int? _visitId;
  String? _mrn;
  String? _questions;
  String? _category;
  String? _dateTime;
  String? _endDateTime;
  String? _meetingUrl;
  String? _confidentialInformation;
  String? _exposed;
  String? _otherConfidentialInformation;
  String? _noteBy;
  String? _note;
  String? _noteFor;
  String? _patientView;
  String? _createdAt;
  String? _updatedAt;
  int? _createdBy;
  String? _updatedBy;
  int? _userId;
  String? _name;
  String? _mobile;
  String? _gender;
  String? _age;
  int? _patientId;
  String? _photo;

  SchedulePatient(
      {int? id,
        int? physicianId,
        String? type,
        int? memberId,
        String? sdate,
        String? stime,
        String? sday,
        String? remarks,
        String? instantFeedback,
        int? feedbackReview,
        int? anyMoreHelp,
        String? anyMoreHelpDetails,
        int? visitId,
        String? mrn,
        String? questions,
        String? category,
        String? dateTime,
        String? endDateTime,
        String? meetingUrl,
        String? confidentialInformation,
        String? exposed,
        String? otherConfidentialInformation,
        String? noteBy,
        String? note,
        String? noteFor,
        String? patientView,
        String? createdAt,
        String? updatedAt,
        int? createdBy,
        String? updatedBy,
        int? userId,
        String? name,
        String? mobile,
        String? gender,
        String? age,
        int? patientId,
        String? photo}) {
    if (id != null) {
      this._id = id;
    }
    if (physicianId != null) {
      this._physicianId = physicianId;
    }
    if (type != null) {
      this._type = type;
    }
    if (memberId != null) {
      this._memberId = memberId;
    }
    if (sdate != null) {
      this._sdate = sdate;
    }
    if (stime != null) {
      this._stime = stime;
    }
    if (sday != null) {
      this._sday = sday;
    }
    if (remarks != null) {
      this._remarks = remarks;
    }
    if (instantFeedback != null) {
      this._instantFeedback = instantFeedback;
    }
    if (feedbackReview != null) {
      this._feedbackReview = feedbackReview;
    }
    if (anyMoreHelp != null) {
      this._anyMoreHelp = anyMoreHelp;
    }
    if (anyMoreHelpDetails != null) {
      this._anyMoreHelpDetails = anyMoreHelpDetails;
    }
    if (visitId != null) {
      this._visitId = visitId;
    }
    if (mrn != null) {
      this._mrn = mrn;
    }
    if (questions != null) {
      this._questions = questions;
    }
    if (category != null) {
      this._category = category;
    }
    if (dateTime != null) {
      this._dateTime = dateTime;
    }
    if (endDateTime != null) {
      this._endDateTime = endDateTime;
    }
    if (meetingUrl != null) {
      this._meetingUrl = meetingUrl;
    }
    if (confidentialInformation != null) {
      this._confidentialInformation = confidentialInformation;
    }
    if (exposed != null) {
      this._exposed = exposed;
    }
    if (otherConfidentialInformation != null) {
      this._otherConfidentialInformation = otherConfidentialInformation;
    }
    if (noteBy != null) {
      this._noteBy = noteBy;
    }
    if (note != null) {
      this._note = note;
    }
    if (noteFor != null) {
      this._noteFor = noteFor;
    }
    if (patientView != null) {
      this._patientView = patientView;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
    if (createdBy != null) {
      this._createdBy = createdBy;
    }
    if (updatedBy != null) {
      this._updatedBy = updatedBy;
    }
    if (userId != null) {
      this._userId = userId;
    }
    if (name != null) {
      this._name = name;
    }
    if (mobile != null) {
      this._mobile = mobile;
    }
    if (gender != null) {
      this._gender = gender;
    }
    if (age != null) {
      this._age = age;
    }
    if (patientId != null) {
      this._patientId = patientId;
    }
    if (photo != null) {
      this._photo = photo;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  int? get physicianId => _physicianId;
  set physicianId(int? physicianId) => _physicianId = physicianId;
  String? get type => _type;
  set type(String? type) => _type = type;
  int? get memberId => _memberId;
  set memberId(int? memberId) => _memberId = memberId;
  String? get sdate => _sdate;
  set sdate(String? sdate) => _sdate = sdate;
  String? get stime => _stime;
  set stime(String? stime) => _stime = stime;
  String? get sday => _sday;
  set sday(String? sday) => _sday = sday;
  String? get remarks => _remarks;
  set remarks(String? remarks) => _remarks = remarks;
  String? get instantFeedback => _instantFeedback;
  set instantFeedback(String? instantFeedback) =>
      _instantFeedback = instantFeedback;
  int? get feedbackReview => _feedbackReview;
  set feedbackReview(int? feedbackReview) => _feedbackReview = feedbackReview;
  int? get anyMoreHelp => _anyMoreHelp;
  set anyMoreHelp(int? anyMoreHelp) => _anyMoreHelp = anyMoreHelp;
  String? get anyMoreHelpDetails => _anyMoreHelpDetails;
  set anyMoreHelpDetails(String? anyMoreHelpDetails) =>
      _anyMoreHelpDetails = anyMoreHelpDetails;
  int? get visitId => _visitId;
  set visitId(int? visitId) => _visitId = visitId;
  String? get mrn => _mrn;
  set mrn(String? mrn) => _mrn = mrn;
  String? get questions => _questions;
  set questions(String? questions) => _questions = questions;
  String? get category => _category;
  set category(String? category) => _category = category;
  String? get dateTime => _dateTime;
  set dateTime(String? dateTime) => _dateTime = dateTime;
  String? get endDateTime => _endDateTime;
  set endDateTime(String? endDateTime) => _endDateTime = endDateTime;
  String? get meetingUrl => _meetingUrl;
  set meetingUrl(String? meetingUrl) => _meetingUrl = meetingUrl;
  String? get confidentialInformation => _confidentialInformation;
  set confidentialInformation(String? confidentialInformation) =>
      _confidentialInformation = confidentialInformation;
  String? get exposed => _exposed;
  set exposed(String? exposed) => _exposed = exposed;
  String? get otherConfidentialInformation => _otherConfidentialInformation;
  set otherConfidentialInformation(String? otherConfidentialInformation) =>
      _otherConfidentialInformation = otherConfidentialInformation;
  String? get noteBy => _noteBy;
  set noteBy(String? noteBy) => _noteBy = noteBy;
  String? get note => _note;
  set note(String? note) => _note = note;
  String? get noteFor => _noteFor;
  set noteFor(String? noteFor) => _noteFor = noteFor;
  String? get patientView => _patientView;
  set patientView(String? patientView) => _patientView = patientView;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;
  int? get createdBy => _createdBy;
  set createdBy(int? createdBy) => _createdBy = createdBy;
  String? get updatedBy => _updatedBy;
  set updatedBy(String? updatedBy) => _updatedBy = updatedBy;
  int? get userId => _userId;
  set userId(int? userId) => _userId = userId;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get mobile => _mobile;
  set mobile(String? mobile) => _mobile = mobile;
  String? get gender => _gender;
  set gender(String? gender) => _gender = gender;
  String? get age => _age;
  set age(String? age) => _age = age;
  int? get patientId => _patientId;
  set patientId(int? patientId) => _patientId = patientId;
  String? get photo => _photo;
  set photo(String? photo) => _photo = photo;

  SchedulePatient.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _physicianId = json['physician_id'];
    _type = json['type'];
    _memberId = json['member_id'];
    _sdate = json['sdate'];
    _stime = json['stime'];
    _sday = json['sday'];
    _remarks = json['remarks'];
    _instantFeedback = json['instant_feedback'];
    _feedbackReview = json['feedback_review'];
    _anyMoreHelp = json['any_more_help'];
    _anyMoreHelpDetails = json['any_more_help_details'];
    _visitId = json['visit_id'];
    _mrn = json['mrn'];
    _questions = json['questions'];
    _category = json['category'];
    _dateTime = json['date_time'];
    _endDateTime = json['end_date_time'];
    _meetingUrl = json['meeting_url'];
    _confidentialInformation = json['confidential_information'];
    _exposed = json['exposed'];
    _otherConfidentialInformation = json['other_confidential_information'];
    _noteBy = json['note_by'];
    _note = json['note'];
    _noteFor = json['note_for'];
    _patientView = json['patient_view'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _createdBy = json['created_by'];
    _updatedBy = json['updated_by'];
    _userId = json['user_id'];
    _name = json['name'];
    _mobile = json['mobile'];
    _gender = json['gender'];
    _age = json['age'].toString();
    _patientId = json['patient_id'];
    _photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['physician_id'] = this._physicianId;
    data['type'] = this._type;
    data['member_id'] = this._memberId;
    data['sdate'] = this._sdate;
    data['stime'] = this._stime;
    data['sday'] = this._sday;
    data['remarks'] = this._remarks;
    data['instant_feedback'] = this._instantFeedback;
    data['feedback_review'] = this._feedbackReview;
    data['any_more_help'] = this._anyMoreHelp;
    data['any_more_help_details'] = this._anyMoreHelpDetails;
    data['visit_id'] = this._visitId;
    data['mrn'] = this._mrn;
    data['questions'] = this._questions;
    data['category'] = this._category;
    data['date_time'] = this._dateTime;
    data['end_date_time'] = this._endDateTime;
    data['meeting_url'] = this._meetingUrl;
    data['confidential_information'] = this._confidentialInformation;
    data['exposed'] = this._exposed;
    data['other_confidential_information'] = this._otherConfidentialInformation;
    data['note_by'] = this._noteBy;
    data['note'] = this._note;
    data['note_for'] = this._noteFor;
    data['patient_view'] = this._patientView;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    data['created_by'] = this._createdBy;
    data['updated_by'] = this._updatedBy;
    data['user_id'] = this._userId;
    data['name'] = this._name;
    data['mobile'] = this._mobile;
    data['gender'] = this._gender;
    data['age'] = this._age;
    data['patient_id'] = this._patientId;
    data['photo'] = this._photo;
    return data;
  }
}

class PatCode {
  int? _id;
  String? _category;
  String? _shortCode;
  String? _tds;
  int? _actionBy;
  String? _createdAt;
  String? _updatedAt;

  PatCode(
      {int? id,
        String? category,
        String? shortCode,
        String? tds,
        int? actionBy,
        String? createdAt,
        String? updatedAt}) {
    if (id != null) {
      this._id = id;
    }
    if (category != null) {
      this._category = category;
    }
    if (shortCode != null) {
      this._shortCode = shortCode;
    }
    if (tds != null) {
      this._tds = tds;
    }
    if (actionBy != null) {
      this._actionBy = actionBy;
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
  String? get category => _category;
  set category(String? category) => _category = category;
  String? get shortCode => _shortCode;
  set shortCode(String? shortCode) => _shortCode = shortCode;
  String? get tds => _tds;
  set tds(String? tds) => _tds = tds;
  int? get actionBy => _actionBy;
  set actionBy(int? actionBy) => _actionBy = actionBy;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  PatCode.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _category = json['category'];
    _shortCode = json['short_code'];
    _tds = json['tds'];
    _actionBy = json['action_by'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['category'] = this._category;
    data['short_code'] = this._shortCode;
    data['tds'] = this._tds;
    data['action_by'] = this._actionBy;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}
