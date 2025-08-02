import 'package:flutter/material.dart';

import '../custom/custom_theme.dart';

abstract class AppTheme {
  static ThemeData get themeData => ThemeData(
    colorScheme: CustomTheme.colorScheme,
    textTheme: CustomTheme.textTheme,
    fontFamily: 'Pretendard',
  );
}
