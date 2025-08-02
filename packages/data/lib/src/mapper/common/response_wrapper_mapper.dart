import 'package:data/data.dart';

extension ResponseWrapperX on ResponseWrapper {
  ResponseWrapper<T> toEntity<T>(T data) {
    return ResponseWrapper<T>(status: status, code: code, message: message, data: data);
  }
}
