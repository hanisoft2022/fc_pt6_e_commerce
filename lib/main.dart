import 'package:e_commerce_app/features/cart/cart.dart';

import 'core/core.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'features/cart_list/cart_list.dart';
import 'firebase_options.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  configureDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
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
