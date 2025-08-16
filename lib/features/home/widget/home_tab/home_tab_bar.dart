import 'package:domain/domain.dart';
import 'package:e_commerce_app/core/core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/menu_bloc/menu_bloc.dart';

class HomeTabBar extends StatelessWidget {
  final List<Menu> menus;

  const HomeTabBar({super.key, required this.menus});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuBloc, MenuState>(
      builder: (context, state) {
        return Stack(
          children: [
            TabBar(
              dividerColor: context.colorScheme.onSecondary,
              tabs: List.generate(menus.length, (index) => Text(menus[index].title)),
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width: 2, color: context.colorScheme.primary),
              ),
              indicatorSize: TabBarIndicatorSize.label,
              labelPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 13),
              labelStyle: context.textTheme.titleSmall.semiBold?.copyWith(
                color: context.colorScheme.primary,
              ),
              unselectedLabelColor: context.colorScheme.contentSecondary,
              unselectedLabelStyle: context.textTheme.titleSmall,
            ),
            if (state.status == Status.loading)
              Positioned.fill(
                child: ColoredBox(
                  color: Colors.black.withAlpha(100),
                  child: Center(
                    child: Transform.scale(scale: 0.5, child: CircularProgressIndicator()),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
