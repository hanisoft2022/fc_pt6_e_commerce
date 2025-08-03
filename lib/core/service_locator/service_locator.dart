import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  _registerCoreServices();

  _registerExternalServices();

  _registerDataLayer();

  _registerDomainLayer();

  _registerPresentationLayer();
}

void _registerCoreServices() {}

void _registerExternalServices() {}

void _registerDataLayer() {
  getIt.registerSingleton<DisplayApi>(DisplayMockApi());
}

void _registerDomainLayer() {
  getIt.registerSingleton<DisplayRepository>(
    DisplayRepositoryImpl(displayApi: getIt<DisplayApi>()),
  );

  getIt.registerSingleton<DisplayUsecase>(
    DisplayUsecase(displayRepository: getIt<DisplayRepository>()),
  );
}

void _registerPresentationLayer() {}
