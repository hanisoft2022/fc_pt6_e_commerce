import 'package:e_commerce_app/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddCartButton extends StatelessWidget {
  const AddCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 8,
      right: 8,
      child: Container(
        decoration: BoxDecoration(
          color: context.colorScheme.primary.withAlpha(100),
          shape: BoxShape.circle,
        ),
        width: 32,
        height: 32,
        child: Center(
          child: SvgPicture.asset(
            AppIcons.cart,
            width: 20,
            height: 20,
            colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
          ),
        ),
      ),
    );
  }
}
