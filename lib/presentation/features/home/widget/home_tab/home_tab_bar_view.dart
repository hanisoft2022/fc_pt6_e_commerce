import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:e_commerce_app/core/service_locator/service_locator.dart';
import 'package:e_commerce_app/presentation/features/home/bloc/view_module_bloc/view_module_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/menu_bloc/menu_bloc.dart';

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

class ViewModuleList extends StatelessWidget {
  const ViewModuleList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewModuleBloc, ViewModuleState>(
      builder: (context, state) {
        switch (state.status) {
          case Status.initial:
          case Status.loading:
            return const Center(child: CircularProgressIndicator());
          case Status.success:
            return Column(
              children: [
                Container(
                  height: 50,
                  color: Colors.deepOrange,
                  child: Center(child: Text(state.tabId.toString())),
                ),
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: 200,
                        child: Center(child: Text(state.viewModules[index].type)),
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(thickness: 4),
                    itemCount: state.viewModules.length,
                  ),
                ),
              ],
            );
          case Status.failure:
            return Text(state.error.message ?? '');
        }
      },
    );
  }
}
