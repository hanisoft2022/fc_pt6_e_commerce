import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/menu_bloc/menu_bloc.dart';
import '../../bloc/view_module_bloc/view_module_bloc.dart';

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
            return ListView.separated(
              itemBuilder: (context, index) => state.viewModuleWidgets[index],
              separatorBuilder: (context, index) => const Divider(thickness: 1),
              itemCount: state.viewModuleWidgets.length,
            );
          case Status.failure:
            return Text(state.error.message ?? '');
        }
      },
    );
  }
}
