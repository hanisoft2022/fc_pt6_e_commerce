import 'package:domain/domain.dart';
import 'package:e_commerce_app/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import 'view_module_widget.dart';
import 'widget/view_module_padding.dart';
import 'widget/view_module_title.dart';

class BrandProductViewModule extends StatelessWidget with ViewModuleWidget {
  final ViewModule viewModule;

  const BrandProductViewModule({super.key, required this.viewModule});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final textTheme = context.textTheme;

    return ViewModulePadding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Chip(label: Text('브랜드')),
          ViewModuleTitle(title: viewModule.title),
          Gap(8),
          if (viewModule.imageUrl.isNotEmpty)
            AspectRatio(aspectRatio: 343 / 173, child: CommonImage(viewModule.imageUrl)),
          if (viewModule.subtitle.isNotEmpty) Gap(13),
          if (viewModule.subtitle.isNotEmpty)
            Text(
              viewModule.subtitle,
              style: textTheme.titleSmall?.copyWith(color: colorScheme.contentSecondary).regular,
            ),
          if (viewModule.subtitle.isNotEmpty) Gap(16),
          Divider(thickness: 1, color: colorScheme.outline),
          Gap(16),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (_, index) => _BrandProduct(productInfo: viewModule.products[index]),
            separatorBuilder: (_, __) => const Gap(8),
            itemCount: viewModule.products.length,
          ),
          Gap(8),
          Container(
            decoration: BoxDecoration(
              color: colorScheme.inverseSurface.withAlpha(40),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '전체보기',
                    style: textTheme.titleSmall
                        ?.copyWith(color: colorScheme.contentPrimary)
                        .regular,
                  ),
                  SvgPicture.asset(
                    AppIcons.chevronRight,
                    width: 16,
                    height: 16,
                    colorFilter: ColorFilter.mode(colorScheme.contentPrimary, BlendMode.srcIn),
                  ),
                ],
              ),
            ),
          ),
          Gap(16),
        ],
      ),
    );
  }
}

class _BrandProduct extends StatelessWidget {
  final ProductInfo productInfo;

  const _BrandProduct({required this.productInfo});

  @override
  Widget build(BuildContext context) {
    var textStyle = context.textTheme;
    var colorScheme = context.colorScheme;

    return AspectRatio(
      aspectRatio: 343 / 61,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            child: CommonImage(productInfo.imageUrl, width: 49, height: 49),
          ),
          Gap(11),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productInfo.title,
                    style: textStyle.labelLarge?.titleCopyWith,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Row(
                    children: [
                      Text(
                        '${productInfo.discountRate}%',
                        style: textStyle.labelLarge?.discountRateCopyWith,
                      ),
                      Gap(4),
                      Text(productInfo.price.toWon, style: textStyle.labelLarge?.priceCopyWith),
                      Gap(4),
                      Text(
                        productInfo.originalPrice.toWon,
                        style: textStyle.labelMedium?.originalPriceCopyWith,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Gap(12),
          Padding(
            padding: EdgeInsets.only(top: 5),
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10).copyWith(left: 8),
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: colorScheme.outline),
                  borderRadius: const BorderRadius.all(Radius.circular(6.0)),
                ),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    AppIcons.cart,
                    width: 18,
                    height: 18,
                    colorFilter: ColorFilter.mode(colorScheme.contentPrimary, BlendMode.srcIn),
                  ),
                  Gap(8),
                  Text(
                    '담기',
                    style: textStyle.titleSmall
                        ?.copyWith(color: colorScheme.contentPrimary)
                        .regular,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
