part of 'kakao_user_bloc.dart';

sealed class KakaoUserEvent {
  const KakaoUserEvent();
}

class KakaoUserLogin extends KakaoUserEvent {}

class KakaoUserLoginWithToken extends KakaoUserEvent {}

class KakaoUserLogout extends KakaoUserEvent {}
