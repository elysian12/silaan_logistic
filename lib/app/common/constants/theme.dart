import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:silaan_logistic/app/common/constants/colors.dart';
import 'package:silaan_logistic/app/common/constants/text_style.dart';

import 'helper.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.backGround,
    textTheme: textTheme(),
    fontFamily: Helper.bodyFontFamily,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryColor,
      titleTextStyle: MyTextStyle.appBarTextStyle,
      actionsIconTheme: IconThemeData(
        color: AppColors.iconColor,
      ),
    ),
  );
}

TextTheme textTheme() {
  return TextTheme(
    bodyText1: MyTextStyle.onBoardDescTextStyle.copyWith(
      fontSize: 15.sp,
      color: AppColors.fontColor,
      height: 16.84.sp / 14,
    ),
    bodyText2: MyTextStyle.onBoardDescTextStyle.copyWith(
      fontSize: 15.sp,
      color: AppColors.fontColor,
      height: 16.84.sp / 14,
    ),
  );
}
