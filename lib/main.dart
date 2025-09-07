import 'package:e_commerce_app/features/cart/cart.dart';
import 'package:e_commerce_app/features/user/user.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

import 'core/core.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'features/cart_list/cart_list.dart';
import 'firebase_options.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  KakaoSdk.init(nativeAppKey: KakaoConstants.NATIVE_APP_KEY);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await configureDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<KakaoUserBloc>()..add(KakaoUserLoginWithToken()),
          lazy: false,
        ),

        BlocProvider(create: (context) => getIt<CartBloc>()..add(CartStarted())),

        BlocProvider(
          lazy: false,
          create: (context) => getIt<CartListBloc>()..add(CartListStarted()),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: CustomThemeData.themeData,
        routerConfig: router,
      ),
    );
  }
}

// for commit september 3rd
// for commit septemver 4th
// for commit september 5th
// for commit september 6th
// for commit september 7th
