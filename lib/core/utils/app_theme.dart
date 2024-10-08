import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_exam/core/utils/app_colors.dart';

class AppTheme{
  static ThemeData lightTheme=ThemeData(
      scaffoldBackgroundColor: AppColors.kWhite,
      appBarTheme: AppBarTheme(
          centerTitle: false,
          elevation: 0.0,

          backgroundColor: AppColors.kWhite,
          titleTextStyle:  GoogleFonts.inter(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.kBlack)
      )
  );

}