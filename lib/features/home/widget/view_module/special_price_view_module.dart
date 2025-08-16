import 'package:domain/domain.dart';
import 'package:e_commerce_app/core/core.dart';
import 'package:e_commerce_app/features/home/widget/view_module/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

import 'view_module.dart';

class SpecialPriceViewModule extends StatelessWidget with ViewModuleWidget {
  final ViewModule viewModule;

  const SpecialPriceViewModule({super.key, required this.viewModule});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ViewModulePadding(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ViewModuleTitle(title: viewModule.title),
              ViewModuleSubtitle(subtitle: viewModule.subtitle),
              if (viewModule.time >= 0)
                Row(
                  children: [
                    Lottie.asset(
                      AppIcons.lottieClock2,
                      width: 20,
                      height: 20,
                      delegates: LottieDelegates(
                        values: [
                          ValueDelegate.color([
                            'Oval',
                            'Oval',
                            'Fill 1',
                          ], value: context.colorScheme.inversePrimary),
                        ],
                      ),
                    ),
                    Gap(5),
                    TimerWidget(endTime: DateTime.fromMillisecondsSinceEpoch(viewModule.time)),
                  ],
                ),
              Gap(16),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return _SpecialPriceProduct(productInfo: viewModule.products[index]);
                },
                separatorBuilder: (context, index) => Gap(16),
                itemCount: viewModule.products.length,
              ),
            ],
          ),
        ),
        Gap(16),
      ],
    );
  }
}

class _SpecialPriceProduct extends StatelessWidget {
  final ProductInfo productInfo;

  const _SpecialPriceProduct({required this.productInfo});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colorScheme = context.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            AspectRatio(
              aspectRatio: 343 / 174,
              child: Image.network(productInfo.imageUrl, fit: BoxFit.cover),
            ),
            AddCartButton(),
          ],
        ),
        Gap(9),
        Text(
          productInfo.subtitle,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: textTheme.labelLarge?.copyWith(color: colorScheme.contentTertiary).regular,
        ),
        Text(
          productInfo.title,
          style: textTheme.titleMedium?.titleCopyWith,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        Gap(4),
        Row(
          children: [
            Text('${productInfo.discountRate}%', style: textTheme.titleLarge!.discountRateCopyWith),
            Gap(4),
            Text(productInfo.price.toWon),
            Gap(4),
            Text(
              productInfo.originalPrice.toWon,
              style: textTheme.titleLarge!.originalPriceCopyWith,
            ),
          ],
        ),
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
            Text(
              '후기 ${productInfo.reviewCount.cappedAt9999}',
              style: textTheme.labelMedium!.reviewCountCopyWith,
            ),
          ],
        ),
      ],
    );
  }
}
