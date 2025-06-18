import 'package:e_commerce_app/features/home/presentation/home_routes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('splash')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('splash_page', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            Gap(30),
            ElevatedButton(
              child: Text('Go to home'),
              onPressed: () => context.pushNamed(HomeRoutes.name),
            ),
          ],
        ),
      ),
    );
  }
}
