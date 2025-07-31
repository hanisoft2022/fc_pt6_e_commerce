import 'package:e_commerce_app/features/bottom_nav/cubit/bottom_nav_cubit.dart';
import 'package:e_commerce_app/features/top_app_bar/widget/default_app_bar.dart';
import 'package:e_commerce_app/features/top_app_bar/widget/home_app_bar.dart';
import 'package:flutter/material.dart' hide Tab;
import 'package:flutter_bloc/flutter_bloc.dart';

class TopAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TopAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(44);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, BottomNavState>(
      builder: (context, state) {
        switch (state.tab) {
          case MyTab.home:
            return const HomeAppBar();
          case MyTab.category:
          case MyTab.search:
          case MyTab.user:
            return DefaultAppBar(tab: state.tab);
        }
      },
    );
  }
}
