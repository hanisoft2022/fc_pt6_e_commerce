import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/core.dart';
import 'widget.dart';

class ProductCardWidget extends StatelessWidget {
  final ProductInfo productInfo;
  final double aspectRatio;

  const ProductCardWidget({super.key, required this.productInfo, required this.aspectRatio});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            AspectRatio(
              aspectRatio: aspectRatio,
              child: Image.network(productInfo.imageUrl, fit: BoxFit.cover),
            ),
            AddCartButton(),
          ],
        ),
        Gap(8),
        Text(productInfo.title, overflow: TextOverflow.ellipsis, maxLines: 2),
        Gap(8),
        Row(
          children: [Text('${productInfo.discountRate}%'), Gap(4), Text(productInfo.price.toWon)],
        ),
        Gap(8),
        Text(productInfo.originalPrice.toWon),
        Gap(8),
        Row(
          children: [
            SvgPicture.asset(
              AppIcons.chat,
              width: 13,
              height: 13,
              colorFilter: ColorFilter.mode(context.colorScheme.contentTertiary, BlendMode.srcIn),
            ),
            Gap(4),
            Text('후기: ${productInfo.reviewCount.cappedAt9999}'),
          ],
        ),
      ],
    );
  }
}
