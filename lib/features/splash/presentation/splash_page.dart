import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SvgPicture.asset(
        'assets/svgs/main_logo.svg',
        fit: BoxFit.cover,
        alignment: Alignment.center,
      ),
    );
  }
}
