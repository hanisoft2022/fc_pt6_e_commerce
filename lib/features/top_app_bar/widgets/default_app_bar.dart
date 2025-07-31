import 'package:e_commerce_app/core/theme/custom/custom_theme.dart';
import 'package:e_commerce_app/features/bottom_nav/cubit/bottom_nav_cubit.dart';
import 'package:e_commerce_app/features/mall_type/cubit/mall_type_cubit.dart';
import 'package:e_commerce_app/core/extensions/context_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DefaultAppBar extends StatelessWidget {
  final MyTab tab;

  const DefaultAppBar({super.key, required this.tab});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MallTypeCubit, MallType>(
      builder: (context, MallType mallType) {
        return Container(
          color: mallType.isMarket ? context.colorScheme.primary : context.colorScheme.surface,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          child: AppBar(
            centerTitle: true,
            title: Text(
              tab.name,
              style: context.textTheme.headlineSmall?.copyWith(
                color: mallType.isMarket
                    ? context.colorScheme.surface
                    : context.colorScheme.contentPrimary,
              ),
            ),
            backgroundColor: Colors.transparent,
            leadingWidth: 86,
          ),
        );
      },
    );
  }
}
