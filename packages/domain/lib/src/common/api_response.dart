abstract interface class ApiResponse<T> {
  String get status;
  String get code;
  String get message;
  T? get data;
}
