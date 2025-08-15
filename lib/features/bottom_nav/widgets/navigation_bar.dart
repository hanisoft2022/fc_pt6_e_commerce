import 'package:e_commerce_app/features/bottom_nav/cubit/bottom_nav_cubit.dart';
import 'package:flutter/material.dart' hide Tab;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, BottomNavState>(
      builder: (context, state) {
        return BottomNavigationBar(
          // showSelectedLabels: false,
          // showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          currentIndex: context.read<BottomNavCubit>().state.tab.index,
          onTap: (index) => {context.read<BottomNavCubit>().changeTab(index)},
          items: List.generate(MyTab.values.length, (index) {
            return BottomNavigationBarItem(
              icon: SvgPicture.asset(MyTab.values[index].iconPath),
              activeIcon: SvgPicture.asset(MyTab.values[index].activeIconPath),
              label: MyTab.values[index].name,
            );
          }),
        );
      },
    );
  }
}
