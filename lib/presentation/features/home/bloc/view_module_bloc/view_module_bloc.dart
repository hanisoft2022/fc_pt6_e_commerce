import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:e_commerce_app/presentation/features/home/widget/view_module_list/factory/factory.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/core.dart';
import '../../../../../core/exception/common_exception.dart';
import '../../widget/view_module_list/view_module_list.dart';
import '../menu_bloc/menu_bloc.dart';

part 'view_module_event.dart';
part 'view_module_state.dart';
part 'view_module_bloc.freezed.dart';

class ViewModuleBloc extends Bloc<ViewModuleEvent, ViewModuleState> {
  final DisplayUsecase _displayUsecase;

  ViewModuleBloc({required displayUsecase})
    : _displayUsecase = displayUsecase,
      super(ViewModuleState()) {
    on<ViewModuleStarted>(_onViewModuleStarted);
  }

  Future<void> _onViewModuleStarted(ViewModuleStarted event, Emitter<ViewModuleState> emit) async {
    emit(state.copyWith(status: Status.loading));

    await Future.delayed(Duration(milliseconds: 500));

    try {
      final tabId = event.tabId;

      final Result<List<ViewModule>> response = await _fetch(tabId);

      response.when(
        success: (List<ViewModule> data) {
          ViewModuleFactory viewModuleFactory = ViewModuleFactory();

          final List<ViewModuleWidget> viewModules = data
              .map((e) => viewModuleFactory.viewModuleToViewModuleWidget(e))
              .toList();

          emit(state.copyWith(status: Status.success, viewModules: viewModules, tabId: tabId));
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

  Future<Result<List<ViewModule>>> _fetch(int tabId) async {
    final result = await _displayUsecase.execute<Result<List<ViewModule>>>(
      remoteUsecase: GetViewModulesUsecase(tabId: tabId),
    );
    return result;
  }
}
