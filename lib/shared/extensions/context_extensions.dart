import 'package:flutter/widgets.dart';

extension MediaQueryExtension on BuildContext {
  double get bottomPadding => MediaQuery.of(this).padding.bottom;

  double get topPadding => MediaQuery.of(this).padding.top;

  Size get screenSize => MediaQuery.of(this).size;
}
