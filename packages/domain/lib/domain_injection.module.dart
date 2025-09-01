//@GeneratedMicroModule;DomainPackageModule;package:domain/domain_injection.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:domain/domain.dart' as _i494;
import 'package:domain/src/usecase/display/display_usecase.dart' as _i578;
import 'package:domain/src/usecase/user/user_usecase.dart' as _i603;
import 'package:injectable/injectable.dart' as _i526;

class DomainPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    gh.singleton<_i603.UserUsecase>(
        () => _i603.UserUsecase(userRepository: gh<_i494.UserRepository>()));
    gh.singleton<_i578.DisplayUsecase>(() =>
        _i578.DisplayUsecase(displayRepository: gh<_i494.DisplayRepository>()));
  }
}
