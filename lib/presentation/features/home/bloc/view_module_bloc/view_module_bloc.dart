import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:e_commerce_app/presentation/features/home/widget/view_module/factory/factory.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../../../../core/core.dart';
import '../../../../../core/exception/common_exception.dart';
import '../../widget/view_module/view_module.dart';
import '../menu_bloc/menu_bloc.dart';

part 'view_module_event.dart';
part 'view_module_state.dart';
part 'view_module_bloc.freezed.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

@injectable
class ViewModuleBloc extends Bloc<ViewModuleEvent, ViewModuleState> {
  final DisplayUsecase _displayUsecase;

  ViewModuleBloc({required DisplayUsecase displayUsecase})
    : _displayUsecase = displayUsecase,
      super(ViewModuleState()) {
    on<ViewModuleStarted>(_onViewModuleStarted);
    on<ViewModuleFetched>(_onViewModuleFetched, transformer: throttleDroppable(throttleDuration));
  }

  Future<void> _onViewModuleStarted(ViewModuleStarted event, Emitter<ViewModuleState> emit) async {
    emit(state.copyWith(status: Status.loading));

    await Future.delayed(Duration(milliseconds: 500));

    try {
      final tabId = event.tabId;

      final Result<List<ViewModule>> response = await _fetch(tabId: tabId);

      response.when(
        success: (List<ViewModule> viewModules) {
          final List<ViewModuleWidget> viewModuleWidgets = viewModules
              .map((e) => ViewModuleFactory.viewModuleToViewModuleWidget(e))
              .toList();

          emit(
            state.copyWith(
              status: Status.success,
              viewModuleWidgets: viewModuleWidgets,
              tabId: tabId,
            ),
          );
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

  Future<void> _onViewModuleFetched(ViewModuleFetched event, Emitter<ViewModuleState> emit) async {
    // ignore: avoid_print
    print('[test] fetched call');
    // 끝 페이지에 도달했다면 리턴
    if (state.isLastPage) return;

    final nextPage = state.currentPage + 1;
    final tabId = state.tabId;

    emit(state.copyWith(status: Status.loading));

    await Future.delayed(Duration(milliseconds: 500));

    try {
      final Result<List<ViewModule>> response = await _fetch(tabId: tabId, page: nextPage);

      response.when(
        success: (List<ViewModule> viewModules) {
          if (viewModules.isEmpty) {
            emit(state.copyWith(status: Status.success, currentPage: nextPage, isLastPage: true));

            return;
          }

          // final List<ViewModuleWidget> viewModuleWidgets = viewModules
          //     .map((e) => ViewModuleFactory.viewModuleToViewModuleWidget(e))
          //     .toList();

          final List<ViewModuleWidget> viewModuleWidgets = [...state.viewModuleWidgets];

          viewModuleWidgets.addAll(
            List.generate(
              viewModules.length,
              (index) => ViewModuleFactory.viewModuleToViewModuleWidget(viewModules[index]),
            ),
          );

          emit(
            state.copyWith(
              status: Status.success,
              viewModuleWidgets: viewModuleWidgets,
              tabId: tabId,
            ),
          );
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

  Future<Result<List<ViewModule>>> _fetch({required int tabId, int page = 1}) async {
    final result = await _displayUsecase.execute<Result<List<ViewModule>>>(
      remoteUsecase: GetViewModulesUsecase(tabId: tabId, page: page),
    );
    return result;
  }
}
