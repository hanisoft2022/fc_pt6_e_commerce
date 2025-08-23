import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import 'view_module.dart';

class BannerViewModule extends StatelessWidget with ViewModuleWidget {
  final ViewModuleEntity viewModule;

  const BannerViewModule({super.key, required this.viewModule});

  @override
  Widget build(BuildContext context) {
    return viewModule.imageUrl.isNotEmpty
        ? AspectRatio(
            aspectRatio: 375 / 79,
            child: Image.network(viewModule.imageUrl, fit: BoxFit.cover),
          )
        : const SizedBox.shrink();
  }
}
