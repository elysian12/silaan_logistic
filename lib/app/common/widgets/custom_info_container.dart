// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:silaan_logistic/app/common/constants/colors.dart';

class CustomInfoCard extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const CustomInfoCard({
    Key? key,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 15.h),
        height: 40.h,
        width: 336.w,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.primaryColor,
          ),
          borderRadius: BorderRadius.circular(2),
        ),
        child: Row(
          children: [
            Spacer(
              flex: 1,
            ),
            Text(label),
            Spacer(
              flex: 9,
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 18,
            ),
            Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
