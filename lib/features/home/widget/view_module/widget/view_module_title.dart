import 'package:e_commerce_app/core/core.dart';
import 'package:flutter/material.dart';

class ViewModuleTitle extends StatelessWidget {
  final String title;

  const ViewModuleTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 8),
      child: Text(
        title,
        style: context.textTheme.titleLarge.semiBold?.copyWith(
          color: context.colorScheme.contentPrimary,
        ),
      ),
    );
  }
}
