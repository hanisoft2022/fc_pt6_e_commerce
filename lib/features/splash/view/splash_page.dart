import 'dart:async';

import 'package:e_commerce_app/core/theme/constant/app_colors.dart';
import 'package:e_commerce_app/core/theme/constant/app_icons.dart';
import 'package:e_commerce_app/features/main/view/main_routes.dart';
import 'package:e_commerce_app/core/extensions/context_media_query_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () => context.goNamed(MainRoute.name));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryContainer,
      body: Stack(
        children: [
          Center(
            child: SvgPicture.asset(
              AppIcons.mainLogo,
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: context.bottomPadding,
            child: SvgPicture.asset(
              'assets/svg/hanisoft_logo.svg',
              height: 50,
              colorFilter: ColorFilter.mode(Colors.white.withAlpha(100), BlendMode.srcIn),
            ),
          ),
        ],
      ),
    );
  }
}
