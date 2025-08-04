import 'package:e_commerce_app/presentation/features/category/view/category_page.dart';
import 'package:e_commerce_app/presentation/features/home/view/home_page.dart';
import 'package:e_commerce_app/presentation/features/bottom_nav/cubit/bottom_nav_cubit.dart';
import 'package:e_commerce_app/presentation/features/bottom_nav/widgets/navigation_bar.dart';
import 'package:e_commerce_app/presentation/features/mall_type/cubit/mall_type_cubit.dart';
import 'package:e_commerce_app/presentation/features/top_app_bar/widgets/top_app_bar.dart';
import 'package:flutter/material.dart' hide NavigationBar, Tab;
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BottomNavCubit()),
        BlocProvider(create: (context) => MallTypeCubit()),
      ],
      child: const MainView(),
    );
  }
}

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopAppBar(),
      body: BlocBuilder<BottomNavCubit, BottomNavState>(
        builder: (context, state) {
          switch (state.tab) {
            case MyTab.home:
              return const HomePage();
            case MyTab.category:
              return const CategoryPage();
            case MyTab.search:
              return const SearchPage();
            case MyTab.user:
              return const UserPage();
          }
        },
      ),
      bottomNavigationBar: NavigationBar(),
    );
  }
}

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
