import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_event.dart';
part 'menu_state.dart';

part 'menu_bloc.freezed.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final DisplayUsecase _displayUsecase;

  MenuBloc({required DisplayUsecase displayUsecase})
    : _displayUsecase = displayUsecase,
      super(MenuState()) {
    on<MenuStarted>(_onMenuStarted);
  }

  Future<void> _onMenuStarted(MenuStarted event, Emitter<MenuState> emit) async {}
}
