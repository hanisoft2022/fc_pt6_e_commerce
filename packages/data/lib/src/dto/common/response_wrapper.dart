import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';

part 'response_wrapper.freezed.dart';
part 'response_wrapper.g.dart';

@Freezed(genericArgumentFactories: true)
abstract class ResponseWrapper<T> with _$ResponseWrapper<T> implements ApiResponse<T> {
  const factory ResponseWrapper({
    @Default('') String status,
    @Default('') String code,
    @Default('') String message,
    T? data,
  }) = _ResponseWrapper;

  factory ResponseWrapper.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$ResponseWrapperFromJson(json, fromJsonT);
}
