part of 'view_module_bloc.dart';

@freezed
abstract class ViewModuleState with _$ViewModuleState {
  const factory ViewModuleState({
    @Default(Status.initial) Status status,
    @Default(-1) int tabId,
    @Default(1) int currentPage,
    @Default(false) bool isLastPage,
    @Default(<ViewModuleWidget>[]) List<ViewModuleWidget> viewModuleWidgets,
    @Default(ErrorResponse()) ErrorResponse error,
  }) = _ViewModuleState;
}
