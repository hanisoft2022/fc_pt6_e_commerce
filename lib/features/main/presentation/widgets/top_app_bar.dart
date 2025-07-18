import 'package:e_commerce_app/core/theme/constant/app_icons.dart';
import 'package:e_commerce_app/shared/extensions/context_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class TopAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TopAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(44);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colorScheme.primary,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: AppBar(
        centerTitle: true,
        title: Text(
          'main_screen app bar',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        leadingWidth: 86,
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: SvgPicture.asset(AppIcons.mainLogo),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(4),
            child: SvgPicture.asset(
              AppIcons.location,

              colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
          ),
          Gap(8),
          Padding(
            padding: const EdgeInsets.all(4),
            child: SvgPicture.asset(
              AppIcons.cart,
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
          ),
        ],
      ),
    );
  }
}
