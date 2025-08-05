import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:e_commerce_app/presentation/features/home/bloc/menu_bloc.dart';
import 'package:e_commerce_app/presentation/features/mall_type/cubit/mall_type_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MallTypeCubit, MallType>(
      builder: (context, mallType) {
        return BlocProvider(
          create: (context) =>
              MenuBloc(displayUsecase: getIt<DisplayUsecase>())
                ..add(MenuStarted(mallType: mallType)),
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
    return Center(
      child: BlocListener<MallTypeCubit, MallType>(
        listener: (context, mallType) {
          context.read<MenuBloc>().add(MenuStarted(mallType: mallType));
        },
        listenWhen: (previous, current) => previous.index != current.index,
        child: BlocBuilder<MenuBloc, MenuState>(
          builder: (context, MenuState state) {
            switch (state.status) {
              case Status.initial:
              case Status.loading:
                return const CircularProgressIndicator();
              case Status.success:
                return Text(state.menus.toString());
              case Status.failure:
                return Text(state.error.message ?? '');
            }
          },
        ),
      ),
    );
  }
}
