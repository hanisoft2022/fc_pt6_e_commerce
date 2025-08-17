import 'package:e_commerce_app/core/theme/theme.dart';
import 'package:flutter/material.dart';

abstract class CustomThemeData {
  static ThemeData get themeData => ThemeData(
    colorScheme: CustomTheme.colorScheme,
    textTheme: CustomTheme.textTheme,
    dividerTheme: DividerThemeData(color: AppColors.outline),
    tabBarTheme: TabBarThemeData(
      indicator: UnderlineTabIndicator(borderSide: BorderSide(width: 2, color: AppColors.primary)),
      dividerColor: Colors.transparent,
      indicatorSize: TabBarIndicatorSize.label,
      labelColor: CustomTheme.colorScheme.primary,
      labelStyle: CustomTheme.textTheme.titleSmall.semiBold,
      unselectedLabelColor: CustomTheme.colorScheme.contentSecondary,
      unselectedLabelStyle: CustomTheme.textTheme.titleSmall,
      overlayColor: WidgetStatePropertyAll(Colors.grey[300] ?? Colors.grey),
    ),
    fontFamily: 'Pretendard',
  );
}
