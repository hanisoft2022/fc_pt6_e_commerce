import 'package:flutter/material.dart';

import '../core.dart';

/// 96
const double _counterWidth = 96;

/// 36
const double _counterHeight = 36;

/// 16
const double _counterIconSize = 16;

/// 8
const double _counterIconPadding = 8;

class CartCountButton extends StatelessWidget {
  final int quantity;
  final VoidCallback? decreased;
  final VoidCallback? increased;

  const CartCountButton({
    required this.quantity,
    required this.decreased,
    required this.increased,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colorScheme = context.colorScheme;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: colorScheme.outline),
        borderRadius: BorderRadius.circular(4),
      ),
      width: _counterWidth,
      height: _counterHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SVGIconButton(
            iconPath: AppIcons.subtract,
            color: (quantity == 1) ? colorScheme.contentFourth : colorScheme.contentPrimary,
            padding: _counterIconPadding,
            size: _counterIconSize,
            onPressed: decreased,
          ),
          Text(
            '$quantity',
            style: textTheme.labelLarge.semiBold?.copyWith(color: colorScheme.contentPrimary),
          ),
          SVGIconButton(
            iconPath: AppIcons.add,
            color: colorScheme.contentPrimary,
            padding: _counterIconPadding,
            size: _counterIconSize,
            onPressed: increased,
          ),
        ],
      ),
    );
  }
}
