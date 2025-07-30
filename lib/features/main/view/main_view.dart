import 'package:e_commerce_app/features/main/widgets/navigation_bar.dart';
import 'package:e_commerce_app/features/main/widgets/top_app_bar.dart';
import 'package:flutter/material.dart' hide NavigationBar;

class MainView extends StatelessWidget {
  const MainView({super.key});

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
