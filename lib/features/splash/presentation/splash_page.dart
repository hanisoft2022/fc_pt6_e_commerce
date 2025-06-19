import 'package:e_commerce_app/shared/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: SvgPicture.asset(
              'assets/svgs/main_logo.svg',
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: context.bottomPadding,
            child: SvgPicture.asset(
              'assets/svgs/hanisoft_logo.svg',
              height: 50,
              colorFilter: ColorFilter.mode(Colors.white.withAlpha(100), BlendMode.srcIn),
            ),
          ),
        ],
      ),
    );
  }
}
