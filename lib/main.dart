// ignore_for_file: avoid_print

import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:e_commerce_app/core/router/router.dart';
import 'package:e_commerce_app/core/theme/app_theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() async {
  final data = await DisplayRepositoryImpl(
    displayApi: DisplayMockApi(),
  ).getMenus(mallType: MallType.market);
  print(data);
  print('---------------------------------');
  print(data.data);
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
