import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:e_commerce_app/core/exception/common_exception.dart';
import 'package:e_commerce_app/core/logger/logger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'menu_event.dart';
part 'menu_state.dart';

part 'menu_bloc.freezed.dart';

@injectable
class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final DisplayUsecase _displayUsecase;

  MenuBloc({required DisplayUsecase displayUsecase})
    : _displayUsecase = displayUsecase,
      super(MenuState()) {
    on<MenuStarted>(_onMenuStarted);
  }

  Future<void> _onMenuStarted(MenuStarted event, Emitter<MenuState> emit) async {
    emit(state.copyWith(status: Status.loading));

    await Future.delayed(Duration(milliseconds: 500));

    try {
      final mallType = event.mallType;

      final Result<List<MenuEntity>> response = await _fetch(mallType);

      response.when(
        success: (List<MenuEntity> menus) {
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

  Future<Result<List<MenuEntity>>> _fetch(MallType mallType) async {
    final result = await _displayUsecase.execute<Result<List<MenuEntity>>>(
      usecase: GetMenusUsecase(mallType: mallType),
    );
    return result;
  }
}
