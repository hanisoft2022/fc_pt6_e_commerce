import 'package:e_commerce_app/core/theme/constant/app_icons.dart';
import 'package:e_commerce_app/core/theme/custom/custom_theme.dart';
import 'package:e_commerce_app/features/mall_type/cubit/mall_type_cubit.dart';
import 'package:e_commerce_app/shared/extensions/context_theme_extension.dart';
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
          color: mallType.isMarket ? context.colorScheme.primary : context.colorScheme.surface,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          child: AppBar(
            centerTitle: true,
            title: DefaultTabController(
              initialIndex: mallType.index,
              length: MallType.values.length,
              child: TabBar(
                onTap: (index) =>
                    context.read<MallTypeCubit>().changeMallType(MallType.values[index]),

                labelColor: Colors.black,
                tabs: List.generate(
                  MallType.values.length,
                  (index) => Tab(text: MallType.values[index].name),
                ),
              ),
            ),
            backgroundColor: Colors.transparent,
            leadingWidth: 86,
            leading: Padding(
              padding: const EdgeInsets.all(8),
              child: SvgPicture.asset(
                AppIcons.mainLogo,
                colorFilter: ColorFilter.mode(
                  mallType.isMarket ? context.colorScheme.onPrimary : context.colorScheme.primary,
                  BlendMode.srcIn,
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(4),
                child: SvgPicture.asset(
                  AppIcons.location,
                  colorFilter: ColorFilter.mode(
                    mallType.isMarket
                        ? context.colorScheme.surface
                        : context.colorScheme.contentPrimary,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              Gap(8),
              Padding(
                padding: const EdgeInsets.all(4),
                child: SvgPicture.asset(
                  AppIcons.cart,
                  colorFilter: ColorFilter.mode(
                    mallType.isMarket
                        ? context.colorScheme.surface
                        : context.colorScheme.contentPrimary,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
