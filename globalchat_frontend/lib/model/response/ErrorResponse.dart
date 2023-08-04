class ErrorResponse {
  ErrorResponse({
    required this.status,
    required this.message,
  });

  ErrorResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
  }

  late int status;
  late String message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    return map;
  }
}
