import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import 'view_module.dart';
import 'widget/widget.dart';

class ScrollViewModule extends StatelessWidget with ViewModuleWidget {
  final ViewModule viewModule;

  const ScrollViewModule({super.key, required this.viewModule});

  @override
  Widget build(BuildContext context) {
    return ProductCardWidget(productInfo: viewModule.products.first, aspectRatio: 150 / 195);
  }
}
