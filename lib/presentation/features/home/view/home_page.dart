import 'package:e_commerce_app/presentation/features/home/widget/home_tab/home_tab.dart';
import 'package:flutter/material.dart';

import 'package:core/core.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:e_commerce_app/presentation/features/home/bloc/menu_bloc/menu_bloc.dart';
import 'package:e_commerce_app/presentation/features/mall_type/cubit/mall_type_cubit.dart';

import '../../../../core/core.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MallTypeCubit, MallType>(
      builder: (context, mallType) {
        return BlocProvider(
          create: (context) => getIt<MenuBloc>()..add(MenuStarted(mallType: mallType)),
          child: const HomeView(),
        );
      },
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<MallTypeCubit, MallType>(
      listener: (context, mallType) {
        context.read<MenuBloc>().add(MenuStarted(mallType: mallType));
      },
      listenWhen: (previous, current) => previous.index != current.index,
      child: BlocConsumer<MenuBloc, MenuState>(
        builder: (context, state) {
          switch (state.status) {
            case Status.initial:
            case Status.loading:
            case Status.success:
              return DefaultTabController(
                length: state.menus.length,
                child: Column(
                  children: [
                    HomeTabBar(menus: state.menus),
                    HomeTabBarView(menus: state.menus, mallType: state.mallType),
                  ],
                ),
              );
            case Status.failure:
              return Text(state.error.message ?? '');
          }
        },
        listener: (context, state) async {
          if (state.status == Status.failure) {
            final bool result = await CommonDialog.errorDialog(context, state.error) ?? false;
            if (result && context.mounted) {
              context.read<MenuBloc>().add(MenuStarted(mallType: MallType.market));
            }
          }
        },
        listenWhen: (previous, current) => previous.status != current.status,
      ),
    );
  }
}
