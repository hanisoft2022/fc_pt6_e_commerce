import 'package:e_commerce_app/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../cart/cart.dart';

class CartPriceInfo extends StatelessWidget {
  const CartPriceInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final productInfo = context.watch<CartBloc>().state.productInfo;
    final quantity = context.watch<CartBloc>().state.quantity;

    void qtyIncreased() => context.read<CartBloc>().add(CartQuantityIncreased());
    void qtyDecreased() => context.read<CartBloc>().add(CartQuantityDecreased());

    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      child: Column(
        children: [
          Text(
            productInfo.title,
            style: textTheme.labelLarge?.copyWith(color: context.colorScheme.contentPrimary),
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
          ),
          const Gap(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(productInfo.price.toWon, style: textTheme.titleMedium?.priceCopyWith),
                  const Gap(4),
                  Text(
                    productInfo.originalPrice.toWon,
                    style: textTheme.titleSmall?.originalPriceCopyWith,
                  ),
                ],
              ),
              CartCountButton(quantity: quantity, decreased: qtyDecreased, increased: qtyIncreased),
            ],
          ),
          const Gap(12),
          const Divider(thickness: 1),
          const Gap(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                decoration: BoxDecoration(
                  color: Color(0xFFF5C142),
                  borderRadius: BorderRadius.all(Radius.circular(9)),
                ),
                child: Text(
                  '적립',
                  style: textTheme.labelSmall.semiBold?.copyWith(color: colorScheme.surface),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '로그인 후, 할인 및 적립 혜택 적용',
                style: textTheme.labelMedium?.copyWith(color: colorScheme.contentSecondary),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
