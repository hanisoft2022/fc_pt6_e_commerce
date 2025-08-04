import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
sealed class Result<T> with _$Result {
  const factory Result.success(T data) = Success;

  const factory Result.failure(ErrorResponse error) = Error;
}
