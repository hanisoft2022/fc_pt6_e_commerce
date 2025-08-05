import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:e_commerce_app/core/exception/common_exception.dart';
import 'package:e_commerce_app/core/logger/logger.dart';
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

  Future<void> _onMenuStarted(MenuStarted event, Emitter<MenuState> emit) async {
    emit(state.copyWith(status: Status.loading));

    await Future.delayed(Duration(milliseconds: 100));

    try {
      final mallType = event.mallType;

      final Result<List<Menu>> response = await _fetch(mallType);

      response.when(
        success: (List<Menu> menus) {
          emit(state.copyWith(status: Status.success, menus: menus, mallType: mallType));
        },
        failure: (ErrorResponse error) {
          emit(state.copyWith(status: Status.failure, error: CommonException.setError(error)));
        },
      );
    } catch (error) {
      CustomLogger.logger.e(error);
      emit(state.copyWith(status: Status.failure, error: CommonException.setError(error)));
    }
  }

  Future<Result<List<Menu>>> _fetch(MallType mallType) async {
    final result = await _displayUsecase.execute<Result<List<Menu>>>(
      remoteUsecase: GetMenusUsecase(mallType: mallType),
    );
    return result;
  }
}
