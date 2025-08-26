import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../core/core.dart';
import '../../cart/cart.dart';

class CartProductInfo extends StatelessWidget {
  const CartProductInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final productInfo = context.watch<CartBloc>().state.productInfo;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      child: Row(
        children: [
          CommonImage(productInfo.imageUrl, height: 48, width: 48),
          Gap(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productInfo.title,
                  style: context.textTheme.labelLarge?.copyWith(
                    color: context.colorScheme.contentPrimary,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Gap(4),
                Text(
                  productInfo.subtitle,
                  style: context.textTheme.labelMedium?.copyWith(
                    color: context.colorScheme.contentTertiary,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
