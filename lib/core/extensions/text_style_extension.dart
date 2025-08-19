import 'package:flutter/material.dart';

import '../core.dart';

extension TextStyleEx on TextStyle {
  TextStyle? get titleCopyWith => copyWith(color: CustomTheme.colorScheme.contentPrimary).regular;

  TextStyle? get discountRateCopyWith => copyWith(color: CustomTheme.colorScheme.secondary).bold;

  TextStyle? get priceCopyWith => copyWith(color: CustomTheme.colorScheme.contentPrimary).bold;

  TextStyle? get originalPriceCopyWith => copyWith(
    color: CustomTheme.colorScheme.contentFourth,
    decoration: TextDecoration.lineThrough,
    decorationColor: CustomTheme.colorScheme.contentFourth,
  ).regular;

  TextStyle? get reviewCountCopyWith => copyWith(
    color: CustomTheme.colorScheme.contentTertiary,
    fontWeight: FontWeight.normal,
  ).regular;
}
