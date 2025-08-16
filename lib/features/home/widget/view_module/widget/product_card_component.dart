import 'package:e_commerce_app/core/core.dart';
import 'package:flutter/material.dart';

import 'widget.dart';

class LargeProductCard extends ProductCardWidget {
  final BuildContext context;

  LargeProductCard({super.key, required this.context, required super.productInfo})
    : super(
        imageAspectRatio: 150 / 195,
        showReviewCount: true,
        titleStyle: context.textTheme.titleSmall,
        priceStyle: context.textTheme.titleSmall,
        originalPriceStyle: context.textTheme.labelMedium,
        reviewStyle: context.textTheme.labelSmall,
      );
}

class SmallProductCard extends ProductCardWidget {
  final BuildContext context;

  SmallProductCard({super.key, required this.context, required super.productInfo})
    : super(
        imageAspectRatio: 114 / 152,
        showReviewCount: false,
        titleStyle: context.textTheme.labelMedium,
        priceStyle: context.textTheme.labelMedium,
        originalPriceStyle: context.textTheme.labelMedium,
        reviewStyle: context.textTheme.labelSmall,
      );
}
