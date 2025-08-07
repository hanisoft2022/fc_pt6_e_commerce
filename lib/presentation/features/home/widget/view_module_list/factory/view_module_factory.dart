import 'package:domain/domain.dart';
import 'package:e_commerce_app/core/core.dart';

import '../view_module_list.dart';
import 'factory.dart';

enum Modules { viewModuleA, viewModuleB, viewModuleC, viewModuleD, viewModuleE }

class ViewModuleFactory {
  ViewModuleWidget viewModuleToViewModuleWidget(ViewModule viewModule) {
    final String snakeCasesdType = viewModule.type.toSnakeCase();

    for (final module in Modules.values) {
      final String snakeCasedName = module.name.toSnakeCase();
      if (snakeCasedName == snakeCasesdType) {
        return module.toViewModuleWidget();
      }
    }
    return const ViewModuleNone();
  }
}

extension ModulesX on Modules {
  ViewModuleWidget toViewModuleWidget() {
    switch (this) {
      case Modules.viewModuleA:
        return const ViewModuleA();
      case Modules.viewModuleB:
        return const ViewModuleB();
      case Modules.viewModuleC:
        return const ViewModuleC();
      case Modules.viewModuleD:
        return const ViewModuleD();
      case Modules.viewModuleE:
        return const ViewModuleE();
    }
  }
}
