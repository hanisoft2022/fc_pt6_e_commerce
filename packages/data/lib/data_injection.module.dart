//@GeneratedMicroModule;DataPackageModule;package:data/data_injection.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:data/data.dart' as _i437;
import 'package:data/src/data_source/data_source_module.dart' as _i94;
import 'package:data/src/repository_impl/display_repository_impl.dart' as _i755;
import 'package:domain/domain.dart' as _i494;
import 'package:injectable/injectable.dart' as _i526;

class DataPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    final dataSourceModule = _$DataSourceModule();
    gh.singleton<_i437.DisplayApi>(() => dataSourceModule.displayApi);
    gh.singleton<_i494.DisplayRepository>(
        () => _i755.DisplayRepositoryImpl(displayApi: gh<_i437.DisplayApi>()));
  }
}

class _$DataSourceModule extends _i94.DataSourceModule {}
