part of 'menu_bloc.dart';

sealed class MenuEvent {
  const MenuEvent();
}

class MenuStarted extends MenuEvent {
  final MallType mallType;

  const MenuStarted({required this.mallType});
}
