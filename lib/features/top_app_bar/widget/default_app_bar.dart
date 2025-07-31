import 'package:e_commerce_app/features/bottom_nav/cubit/bottom_nav_cubit.dart';
import 'package:e_commerce_app/shared/extensions/context_theme_extension.dart';
import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget {
  final MyTab tab;

  const DefaultAppBar({super.key, required this.tab});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colorScheme.primary,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: AppBar(
        centerTitle: true,
        title: Text(
          tab.name,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        leadingWidth: 86,
      ),
    );
  }
}
