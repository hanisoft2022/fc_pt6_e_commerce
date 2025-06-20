import 'package:e_commerce_app/core/theme/constant/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(icon: SvgPicture.asset(AppIcons.navHome), label: 'Home'),
        BottomNavigationBarItem(icon: SvgPicture.asset(AppIcons.navCategory), label: 'Home'),
        BottomNavigationBarItem(icon: SvgPicture.asset(AppIcons.navSearch), label: 'Search'),
        BottomNavigationBarItem(icon: SvgPicture.asset(AppIcons.navUser), label: 'Profile'),
      ],
    );
  }
}
