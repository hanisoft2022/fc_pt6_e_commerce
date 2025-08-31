part of 'user_bloc.dart';

@freezed
abstract class UserState with _$UserState {
  factory UserState({
    @Default(Status.initial) Status status,
    @Default(ErrorResponse()) ErrorResponse error,
    User? user,
  }) = _UserState;
}
