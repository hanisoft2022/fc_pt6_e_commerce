import 'package:domain/domain.dart';
import 'package:e_commerce_app/core/core.dart';
import 'package:e_commerce_app/features/cart/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class AddCartButton extends StatelessWidget {
  final ProductInfoEntity productInfo;

  const AddCartButton({super.key, required this.productInfo});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 8,
      right: 8,
      child: GestureDetector(
        onTap: () => context.read<CartBloc>().add(CartOpend(productInfo: productInfo, quantity: 1)),
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
      ),
    );
  }
}
