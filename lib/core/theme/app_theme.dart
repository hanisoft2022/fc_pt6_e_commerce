import 'package:flutter/material.dart';
import 'app_colors.dart';

abstract class AppTheme {
  // * 라이트 테마
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.primary,
      // scaffoldBackgroundColor: AppColors.background,
      colorScheme: ColorScheme.light(
        primary: AppColors.primary,
        // secondary: AppColors.secondary,
        // background: AppColors.background,
        // error: AppColors.error,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      // 기타 테마 속성 추가
    );
  }

  // * 다크테마
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: AppColors.primary,
      // ...생략
    );
  }
}
