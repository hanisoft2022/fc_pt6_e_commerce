import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:e_commerce_app/core/service_locator/service_locator.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/view_module_bloc/view_module_bloc.dart';
import '../view_module/view_module.dart';

class HomeTabBarView extends StatelessWidget {
  final List<Menu> menus;
  final MallType mallType;

  const HomeTabBarView({super.key, required this.menus, required this.mallType});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        children: List.generate(
          menus.length,
          (index) => BlocProvider(
            create: (context) =>
                ViewModuleBloc(displayUsecase: getIt<DisplayUsecase>())
                  ..add(ViewModuleStarted(tabId: menus[index].tabId)),
            child: ViewModuleList(),
          ),
        ),
      ),
    );
  }
}
