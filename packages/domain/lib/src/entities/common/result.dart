import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
abstract class Result<T> with _$Result {
  const factory Result.success(T data) = Success;

  const factory Result.error(ErrorResponse error) = Error;
}
