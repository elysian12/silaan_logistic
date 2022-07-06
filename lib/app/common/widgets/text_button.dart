import 'package:flutter/material.dart';
import 'package:silaan_logistic/app/common/constants/colors.dart';
import 'package:silaan_logistic/app/common/constants/text_style.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback onTap;
  final String label;
  const CustomTextButton({
    Key? key,
    required this.onTap,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        label,
        style: MyTextStyle.onBoardDescTextStyle.copyWith(
          color: AppColors.fontColor,
        ),
      ),
      onPressed: onTap,
    );
  }
}
