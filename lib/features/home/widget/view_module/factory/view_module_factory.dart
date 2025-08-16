import 'package:domain/domain.dart';
import 'package:e_commerce_app/core/core.dart';

import '../view_module.dart';
import 'factory.dart';

enum Modules {
  viewModuleA,
  viewModuleB,
  viewModuleC,
  viewModuleD,
  viewModuleE,
  carouselViewModule,
  bannerViewModule,
  scrollViewModule,
  specialPriceViewModule,
}

abstract class ViewModuleFactory {
  static ViewModuleWidget viewModuleToViewModuleWidget(ViewModule viewModule) {
    final String snakeCasesdType = viewModule.type.toSnakeCase;

    for (final module in Modules.values) {
      final String snakeCasedName = module.name.toSnakeCase;
      if (snakeCasedName == snakeCasesdType) {
        return module.toViewModuleWidget(viewModule);
      }
    }
    return const ViewModuleNone();
  }
}

extension ModulesX on Modules {
  ViewModuleWidget toViewModuleWidget(ViewModule viewModule) {
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
      case Modules.carouselViewModule:
        return CarouselViewModule(viewModule: viewModule);
      case Modules.bannerViewModule:
        return BannerViewModule(viewModule: viewModule);
      case Modules.scrollViewModule:
        return ScrollViewModule(viewModule: viewModule);
      case Modules.specialPriceViewModule:
        return SpecialPriceViewModule(viewModule: viewModule);
    }
  }
}
