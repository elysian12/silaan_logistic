import 'package:flutter/material.dart';
import 'package:silaan_logistic/app/common/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'helper.dart';

class MyTextStyle {
  static TextStyle get appBarTextStyle => TextStyle(
        color: AppColors.iconColor,
        fontSize: 18.sp,
        fontWeight: FontWeight.w400,
        fontFamily: Helper.bodyFontFamily,
      );
  static TextStyle get onBoardTitleTextStyle => TextStyle(
        color: AppColors.fontColor,
        fontSize: 28.sp,
        fontWeight: FontWeight.w400,
        fontFamily: Helper.titleFontFamily,
        height: 35.1.sp / 28,
      );
  static TextStyle get onBoardDescTextStyle => TextStyle(
        color: AppColors.fontShadeColor.withOpacity(0.8),
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        fontFamily: Helper.bodyFontFamily,
        height: 16.84.sp / 14,
      );
  static TextStyle get heading => TextStyle(
        color: AppColors.brown,
        fontSize: 20.sp,
        fontWeight: FontWeight.w400,
        fontFamily: Helper.titleFontFamily,
        height: 19.84.sp / 16,
      );
  static TextStyle get subHeading => TextStyle(
        color: AppColors.brown,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        fontFamily: Helper.titleFontFamily,
        height: 16.84.sp / 14,
      );
}
