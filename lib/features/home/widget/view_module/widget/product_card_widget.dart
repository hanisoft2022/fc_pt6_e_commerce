import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/core.dart';
import 'widget.dart';

class ProductCardWidget extends StatelessWidget {
  final ProductInfo productInfo;
  final double aspectRatio;
  final bool showReviewCount;
  final TextStyle? titleStyle;
  final TextStyle? priceStyle;
  final TextStyle? originalPriceStyle;
  final TextStyle? reviewStyle;

  const ProductCardWidget({
    super.key,
    required this.productInfo,
    required this.aspectRatio,
    required this.showReviewCount,
    this.titleStyle,
    this.priceStyle,
    this.originalPriceStyle,
    this.reviewStyle,
  });

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
        Gap(9),
        Text(
          productInfo.title,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: titleStyle!.titleCopyWith,
        ),
        Gap(4),
        Row(
          children: [
            Text('${productInfo.discountRate}%', style: priceStyle!.discountRateCopyWith),
            Gap(4),
            Text(productInfo.price.toWon),
          ],
        ),
        Gap(3),
        Text(productInfo.originalPrice.toWon, style: originalPriceStyle!.originalPriceCopyWith),
        if (showReviewCount) Gap(8),
        if (showReviewCount)
          Row(
            children: [
              SvgPicture.asset(
                AppIcons.chat,
                width: 13,
                height: 13,
                colorFilter: ColorFilter.mode(context.colorScheme.contentTertiary, BlendMode.srcIn),
              ),
              Gap(4),
              Text(
                '후기: ${productInfo.reviewCount.cappedAt9999}',
                style: reviewStyle!.reviewCountCopyWith,
              ),
            ],
          ),
      ],
    );
  }
}
