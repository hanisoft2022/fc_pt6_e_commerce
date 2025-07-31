import 'package:e_commerce_app/core/theme/constant/app_icons.dart';
import 'package:e_commerce_app/core/theme/custom/custom_app_bar.dart';
import 'package:e_commerce_app/core/theme/custom/custom_font_weight.dart';
import 'package:e_commerce_app/features/mall_type/cubit/mall_type_cubit.dart';
import 'package:e_commerce_app/core/extensions/context_theme_extension.dart';
import 'package:e_commerce_app/features/top_app_bar/widgets/home_app_bar/svg_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MallTypeCubit, MallType>(
      builder: (context, MallType mallType) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 150),
          color: mallType.theme.backgroundColor,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          child: AppBar(
            backgroundColor: Colors.transparent,
            leadingWidth: 86,
            leading: SVGIconButton(
              iconPath: AppIcons.mainLogo,
              color: mallType.theme.logoColor,
              padding: 8,
            ),
            title: AnimatedContainer(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(CustomAppBarTheme.tabBarRadius),
                color: mallType.theme.containerColor,
              ),
              duration: Duration(milliseconds: 150),
              height: 35,
              child: DefaultTabController(
                initialIndex: mallType.index,
                length: MallType.values.length,
                child: TabBar(
                  tabs: List.generate(
                    MallType.values.length,
                    (index) => Tab(text: MallType.values[index].name),
                  ),
                  splashBorderRadius: BorderRadius.circular(CustomAppBarTheme.tabBarRadius),
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(CustomAppBarTheme.tabBarRadius),
                    color: mallType.theme.indicatorColor,
                  ),
                  dividerColor: Colors.transparent,
                  indicatorSize: TabBarIndicatorSize.tab,
                  onTap: (index) =>
                      context.read<MallTypeCubit>().changeMallType(MallType.values[index]),
                  labelPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  labelColor: mallType.theme.labelColor,
                  labelStyle: context.textTheme.labelLarge.bold,
                  unselectedLabelColor: mallType.theme.unselectedLabelColor,
                  unselectedLabelStyle: context.textTheme.labelLarge,
                ),
              ),
            ),
            actions: [
              SVGIconButton(
                iconPath: AppIcons.location,
                color: mallType.theme.iconColor,
                padding: 8,
              ),

              SVGIconButton(iconPath: AppIcons.cart, color: mallType.theme.iconColor, padding: 8),
            ],
          ),
        );
      },
    );
  }
}
