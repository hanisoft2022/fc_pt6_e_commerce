part of 'menu_bloc.dart';

enum Status { initial, loading, success, failure }

@freezed
abstract class MenuState with _$MenuState {
  factory MenuState({
    @Default(Status.initial) Status status,
    @Default(MallType.market) MallType mallType,
    @Default(<MenuEntity>[]) List<MenuEntity> menus,
    @Default(ErrorResponse()) ErrorResponse error,
  }) = _MenuState;
}

extension StatusX on Status {
  bool get isInitial => this == Status.initial;

  bool get isLoading => this == Status.loading;

  bool get isSuccess => this == Status.success;

  bool get isFailure => this == Status.failure;
}
