part of 'user_bloc.dart';

sealed class UserEvent {
  const UserEvent();
}

class UserLogin extends UserEvent {}

class UserLoginWithToken extends UserEvent {}

class UserLogout extends UserEvent {}
