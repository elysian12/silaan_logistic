import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:silaan_logistic/app/common/constants/colors.dart';
import 'package:silaan_logistic/app/common/constants/text_style.dart';

class FilledCustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const FilledCustomButton({
    Key? key,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50.h,
        width: 148.w,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(2),
        ),
        child: Center(
          child: Text(
            label,
            style: MyTextStyle.appBarTextStyle.copyWith(height: 21.65.sp / 18),
          ),
        ),
      ),
    );
  }
}

class FullFilledCustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const FullFilledCustomButton({
    Key? key,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50.h,
        width: 336.w,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(2),
        ),
        child: Center(
          child: Text(
            label,
            style: MyTextStyle.appBarTextStyle.copyWith(height: 21.65.sp / 18),
          ),
        ),
      ),
    );
  }
}

class ChipButtons extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const ChipButtons({Key? key, required this.label, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(2),
        ),
        child: Center(
          child: Text(
            label,
            style: MyTextStyle.appBarTextStyle.copyWith(
              fontSize: 16.sp,
            ),
          ),
        ),
      ),
    );
  }
}
