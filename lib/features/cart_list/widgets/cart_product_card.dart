import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../core/core.dart';
import '../bloc/cart_list_bloc.dart';

/// 78
const double _imageHeight = 78;

/// 60
const double _imageWidth = 60;

class CartProductCard extends StatelessWidget {
  final CartEntity cartEntity;

  const CartProductCard({super.key, required this.cartEntity});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final textTheme = context.textTheme;

    final productId = cartEntity.productInfo.productId;

    final bloc = context.read<CartListBloc>();

    final isSelected = context.select(
      (CartListBloc bloc) => bloc.state.selectedProductsIds.contains(productId),
    );

    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 20, right: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SVGIconButton(
            iconPath: (isSelected) ? AppIcons.checkMarkCircleFill : AppIcons.checkMarkCircle,
            color: (isSelected) ? colorScheme.primary : colorScheme.contentFourth,
            onPressed: () => bloc.add(CartProductSelected(cartEntity: cartEntity)),
          ),
          Gap(8),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        cartEntity.productInfo.title,
                        style: textTheme.titleSmall?.copyWith(color: colorScheme.contentPrimary),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    Center(
                      child: SVGIconButton(
                        iconPath: AppIcons.close,
                        color: colorScheme.contentTertiary,
                        onPressed: () => bloc.add(CartProductDeleted(productIds: [productId])),
                      ),
                    ),
                  ],
                ),
                Gap(11),
                Row(
                  children: [
                    // 상품 이미지
                    Image.network(
                      cartEntity.productInfo.imageUrl,
                      width: _imageWidth,
                      height: _imageHeight,
                    ),
                    Gap(20),
                    // 가격 + 수량
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cartEntity.productInfo.price.toWon,
                          style: textTheme.titleMedium.bold?.copyWith(
                            color: colorScheme.contentPrimary,
                          ),
                        ),
                        Gap(20),
                        CartCountButton(
                          quantity: cartEntity.quantity,
                          decreased: () =>
                              bloc.add(CartProductQtyDecreased(cartEntity: cartEntity)),
                          increased: () =>
                              bloc.add(CartProductQtyIncreased(cartEntity: cartEntity)),
                        ),
                      ],
                    ),
                  ],
                ),
                Gap(20),
                Divider(height: 1, thickness: 1, color: colorScheme.outline),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
