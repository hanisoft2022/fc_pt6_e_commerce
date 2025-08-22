import 'core/core.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/cart/bloc/cart_bloc.dart';

void main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  configureDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => getIt<CartBloc>()..add(CartStarted()))],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: CustomThemeData.themeData,
        routerConfig: router,
      ),
    );
  }
}
