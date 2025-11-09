import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/resources/colors_manager.dart';

abstract class ThemeManager {
  static final ThemeData light = ThemeData();
  static final ThemeData dark = ThemeData(
    scaffoldBackgroundColor: ColorsManager.black,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsManager.black,
      foregroundColor: ColorsManager.white,
      centerTitle: true,
      titleTextStyle: GoogleFonts.inter(
        fontSize: 20.sp,
        fontWeight: FontWeight.w500,
      ),
    ),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.inter(
        fontSize: 27.sp,
        fontWeight: FontWeight.w500,
        color: ColorsManager.black,
      ),
      titleMedium: GoogleFonts.inter(
        fontSize: 24.sp,
        fontWeight: FontWeight.w500,
        color: ColorsManager.white,
      ),
      titleSmall: GoogleFonts.inter(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        color: ColorsManager.grey,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        color: ColorsManager.white,
      ),
      bodySmall: GoogleFonts.inter(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: ColorsManager.white,
      ),
    ),
  );
}
