part of 'menu_bloc.dart';

@freezed
abstract class MenuState with _$MenuState {
  factory MenuState({
    @Default(Status.initial) Status status,
    @Default(MallType.market) MallType mallType,
    @Default(<MenuEntity>[]) List<MenuEntity> menus,
    @Default(ErrorResponse()) ErrorResponse error,
  }) = _MenuState;
}
