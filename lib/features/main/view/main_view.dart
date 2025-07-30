import 'package:e_commerce_app/features/category/view/category_page.dart';
import 'package:e_commerce_app/features/home/view/home_page.dart';
import 'package:e_commerce_app/features/bottom_nav/cubit/bottom_nav_cubit.dart';
import 'package:e_commerce_app/features/bottom_nav/widgets/navigation_bar.dart';
import 'package:e_commerce_app/features/app_bar/top_app_bar.dart';
import 'package:flutter/material.dart' hide NavigationBar, Tab;
import 'package:flutter_bloc/flutter_bloc.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => BottomNavCubit(), child: const MainPage());
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppBar(),
      body: BlocBuilder<BottomNavCubit, BottomNavState>(
        builder: (context, state) {
          switch (state.tab) {
            case Tab.home:
              return const HomePage();
            case Tab.category:
              return const CategoryPage();
            case Tab.search:
              return const SearchPage();
            case Tab.user:
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
