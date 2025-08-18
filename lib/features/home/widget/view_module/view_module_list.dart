import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/menu_bloc/menu_bloc.dart';
import '../../bloc/view_module_bloc/view_module_bloc.dart';
import '../widget.dart';

class ViewModuleList extends StatefulWidget {
  final int tabId;

  const ViewModuleList({super.key, required this.tabId});

  @override
  State<ViewModuleList> createState() => _ViewModuleListState();
}

class _ViewModuleListState extends State<ViewModuleList> {
  final ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_is90PercentEnd) {
      BlocProvider.of<ViewModuleBloc>(context).add(ViewModuleFetched());
    }
  }

  bool get _is90PercentEnd {
    if (scrollController.hasClients == false) return false;
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    return maxScroll * 0.9 <= currentScroll;
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => BlocProvider.of<ViewModuleBloc>(
        context,
      ).add(ViewModuleStarted(tabId: widget.tabId, isRefresh: true)),
      child: BlocBuilder<ViewModuleBloc, ViewModuleState>(
        builder: (context, state) {
          return state.status.isInitial || state.viewModuleWidgets.isEmpty
              ? Center(child: CircularProgressIndicator())
              : ListView(
                  controller: scrollController,
                  children: [
                    ...state.viewModuleWidgets,
                    if (state.status.isLoading) _LoadingWidget(),
                    Footer(),
                  ],
                );
          // switch (state.status) {
          //   case Status.initial:
          //   case Status.loading:
          //     return const Center(child: CircularProgressIndicator());
          //   case Status.success:
          //     return ListView.separated(
          //       itemBuilder: (context, index) => state.viewModuleWidgets[index],
          //       separatorBuilder: (context, index) => const Divider(thickness: 1),
          //       itemCount: state.viewModuleWidgets.length,
          //     );
          //   case Status.failure:
          //     return Text(state.error.message ?? '');
          // }
        },
      ),
    );
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Transform.scale(scale: 0.5, child: Center(child: CircularProgressIndicator())),
    );
  }
}
