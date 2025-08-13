part of 'view_module_bloc.dart';

class ViewModuleEvent {
  const ViewModuleEvent();
}

class ViewModuleStarted extends ViewModuleEvent {
  final int tabId;
  final bool isRefresh;

  const ViewModuleStarted({required this.tabId, this.isRefresh = false});
}

class ViewModuleFetched extends ViewModuleEvent {
  const ViewModuleFetched();
}
