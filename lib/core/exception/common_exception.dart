import 'package:core/core.dart';
import 'package:dio/dio.dart';

class CommonException {
  const CommonException();

  static ErrorResponse setError(dynamic error) {
    if (error is DioException) {
      return _handleDioException(error);
    }

    if (error is Exception) {
      return _handleGenericException();
    }

    return _handleUnknownError();
  }

  static ErrorResponse _handleDioException(DioException dioError) {
    final code = dioError.response?.statusCode.toString() ?? '9999';

    return ErrorResponse(
      code: code,
      message: '접속하신 네트워크 환경이 불안정합니다.\n 잠시 후에 다시 시도해주세요.',
      status: 'network error',
    );
  }

  static ErrorResponse _handleGenericException() {
    return ErrorResponse(
      code: '8888',
      message: '서비스에 일시적인 오류가 발생했습니다.\n 잠시 후에 다시 시도해주세요.',
      status: 'network error',
    );
  }

  static ErrorResponse _handleUnknownError() {
    return ErrorResponse(
      code: '7777',
      message: '서비스에 일시적인 오류가 발생했습니다.\n 잠시 후에 다시 시도해주세요.',
      status: 'unKnown error',
    );
  }
}
