import 'package:e_commerce_app/core/constant/padding_constants.dart';
import 'package:flutter/widgets.dart';

class ViewModulePadding extends StatelessWidget {
  final Widget child;

  const ViewModulePadding({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: PaddingConstants.horizontalPadding, child: child);
  }
}
