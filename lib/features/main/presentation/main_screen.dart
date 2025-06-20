import 'package:e_commerce_app/features/main/presentation/widgets/navigation_bar.dart';
import 'package:e_commerce_app/features/main/presentation/widgets/top_app_bar.dart';
import 'package:flutter/material.dart' hide NavigationBar;

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppBar(),
      body: Center(
        child: Text('main_screen', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
      ),
      bottomNavigationBar: NavigationBar(),
    );
  }
}
