import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paymint/constants/colors.dart';

final ThemeData payMintTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.transparent,
  primaryColor: AppColors.primaryAccent,
  colorScheme: const ColorScheme.dark(
    primary: AppColors.primaryAccent,
    secondary: AppColors.secondaryAccent,
    error: AppColors.highlight,
  ),
  textTheme: GoogleFonts.poppinsTextTheme().copyWith(
    headlineLarge: const TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: AppColors.textPrimary,
    ),
    bodyLarge: const TextStyle(
      fontSize: 16,
      color: AppColors.textSecondary,
    ),
    labelLarge: const TextStyle(
      fontSize: 14,
      color: AppColors.textPrimary,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primaryAccent,
      foregroundColor: AppColors.background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 8,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
    ),
  ),
);
