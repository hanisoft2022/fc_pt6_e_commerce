part of 'kakao_user_bloc.dart';

@freezed
abstract class KakaoUserState with _$KakaoUserState {
  factory KakaoUserState({
    @Default(Status.initial) Status status,
    @Default(ErrorResponse()) ErrorResponse error,
    kakao.User? user,
  }) = _KakaoUserState;
}
