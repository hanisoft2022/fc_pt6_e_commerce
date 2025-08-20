import 'package:e_commerce_app/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cart/cart.dart';

const double _buttonHeight = 48;

class AddCartButton extends StatelessWidget {
  const AddCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final textTheme = context.textTheme;
    final blocState = context.watch<CartBloc>().state;

    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: colorScheme.primary,
          borderRadius: BorderRadius.circular(6),
        ),
        height: _buttonHeight,
        margin: const EdgeInsets.all(10),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: blocState.totalPrice.toWon,
                style: textTheme.titleSmall?.semiBold?.copyWith(color: colorScheme.onPrimary),
              ),
              TextSpan(
                text: ' 장바구니 담기',
                style: textTheme.titleSmall?.copyWith(color: colorScheme.onPrimary),
              ),
            ],
          ),
        ),
      ),
      // onTap: () => context.read<CartListBloc>().add(
      //   CartListAdded(quantity: blocState.quantity, productInfo: blocState.productInfo),
      // ),
    );
  }
}

// for commit
