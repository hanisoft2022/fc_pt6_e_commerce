part of 'view_module_bloc.dart';

class ViewModuleEvent {
  const ViewModuleEvent();
}

class ViewModuleStarted extends ViewModuleEvent {
  final int tabId;

  const ViewModuleStarted({required this.tabId});
}

class ViewModuleFetched extends ViewModuleEvent {
  const ViewModuleFetched();
}
