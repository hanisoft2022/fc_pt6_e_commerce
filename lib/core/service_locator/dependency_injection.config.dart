// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:data/data_injection.module.dart' as _i1027;
import 'package:domain/domain.dart' as _i494;
import 'package:domain/domain_injection.module.dart' as _i966;
import 'package:e_commerce_app/features/cart/bloc/cart_bloc.dart' as _i102;
import 'package:e_commerce_app/features/cart_list/bloc/cart_list_bloc.dart'
    as _i519;
import 'package:e_commerce_app/features/home/bloc/menu_bloc/menu_bloc.dart'
    as _i183;
import 'package:e_commerce_app/features/home/bloc/view_module_bloc/view_module_bloc.dart'
    as _i853;
import 'package:e_commerce_app/features/payment/payment_bloc/payment_bloc.dart'
    as _i63;
import 'package:e_commerce_app/features/user/user_bloc/kakao_user_bloc.dart'
    as _i147;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    await _i1027.DataPackageModule().init(gh);
    await _i966.DomainPackageModule().init(gh);
    gh.factory<_i63.PaymentBloc>(() => _i63.PaymentBloc());
    gh.factory<_i102.CartBloc>(() => _i102.CartBloc());
    gh.factory<_i147.KakaoUserBloc>(
      () => _i147.KakaoUserBloc(gh<_i494.KakaoUserUsecase>()),
    );
    gh.factory<_i183.MenuBloc>(
      () => _i183.MenuBloc(displayUsecase: gh<_i494.DisplayUsecase>()),
    );
    gh.factory<_i853.ViewModuleBloc>(
      () => _i853.ViewModuleBloc(displayUsecase: gh<_i494.DisplayUsecase>()),
    );
    gh.factory<_i519.CartListBloc>(
      () => _i519.CartListBloc(gh<_i494.DisplayUsecase>()),
    );
    return this;
  }
}
