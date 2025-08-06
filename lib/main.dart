// ignore_for_file: avoid_print

import 'package:data/data.dart';
import 'package:flutter/material.dart';

import 'core/core.dart';

void main() async {
  setupServiceLocator();

  final data = await getIt<DisplayApi>().getViewModulues(10001);
  print(data);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeData,
      routerConfig: router,
    );
  }
}
