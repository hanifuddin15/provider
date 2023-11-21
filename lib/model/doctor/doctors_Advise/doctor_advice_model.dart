//developed by hanif

class DoctorsAdvice {
  late bool error;
  late String msg;
  late List<dynamic> data; // Depending on the actual data type in the response

  DoctorsAdvice({
    required this.error,
    required this.msg,
    required this.data,
  });

  factory DoctorsAdvice.fromJson(Map<String, dynamic> json) {
    return DoctorsAdvice(
      error: json['error'] ?? true,
      msg: json['msg'] ?? '',
      data: json['data'] ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'error': error,
      'msg': msg,
      'data': data,
    };
  }
}
