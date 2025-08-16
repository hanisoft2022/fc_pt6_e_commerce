import 'package:e_commerce_app/core/core.dart';
import 'package:flutter/material.dart';

class ViewModuleSubtitle extends StatelessWidget {
  final String subtitle;

  const ViewModuleSubtitle({super.key, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        subtitle,
        style: context.textTheme.titleSmall.semiBold?.copyWith(
          color: context.colorScheme.contentTertiary,
        ),
      ),
    );
  }
}
