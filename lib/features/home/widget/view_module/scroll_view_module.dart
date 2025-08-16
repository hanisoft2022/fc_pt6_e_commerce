import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import 'view_module.dart';

class ScrollViewModule extends StatelessWidget with ViewModuleWidget {
  final ViewModule viewModule;

  const ScrollViewModule({super.key, required this.viewModule});

  @override
  Widget build(BuildContext context) {
    return Column(children: []);
  }
}
