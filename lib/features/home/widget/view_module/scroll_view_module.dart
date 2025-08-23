import 'package:domain/domain.dart';
import 'package:e_commerce_app/core/constant/padding_constants.dart';
import 'package:e_commerce_app/features/home/widget/view_module/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'view_module.dart';

class ScrollViewModule extends StatelessWidget with ViewModuleWidget {
  final ViewModuleEntity viewModule;

  const ScrollViewModule({super.key, required this.viewModule});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ViewModulePadding(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ViewModuleTitle(title: viewModule.title),
              if (viewModule.subtitle.isNotEmpty) ViewModuleSubtitle(subtitle: viewModule.subtitle),
            ],
          ),
        ),
        Gap(10),
        _ImageList(products: viewModule.products),
        Gap(50),
      ],
    );
  }
}

class _ImageList extends StatelessWidget {
  final List<ProductInfoEntity> products;

  const _ImageList({required this.products});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 375 / 305,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: PaddingConstants.horizontalPadding,
        itemBuilder: (context, index) {
          final product = products[index];

          return AspectRatio(
            aspectRatio: 150 / 305,
            child: LargeProductCard(context: context, productInfo: product),
          );
        },
        separatorBuilder: (context, index) => Gap(8),
        itemCount: products.length,
      ),
    );
  }
}
