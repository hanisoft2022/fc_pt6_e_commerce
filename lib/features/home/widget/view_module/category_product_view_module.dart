import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import 'view_module.dart';

class CategoryProductViewModule extends StatefulWidget with ViewModuleWidget {
  final ViewModule viewModule;

  const CategoryProductViewModule({super.key, required this.viewModule});

  @override
  State<CategoryProductViewModule> createState() => _CategoryProductViewModuleState();
}

class _CategoryProductViewModuleState extends State<CategoryProductViewModule> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
