// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:silaan_logistic/app/modules/login/views/helper.dart';

import '../constants/colors.dart';
import '../constants/text_style.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool showPrefix;
  final Function(String)? onChanged;
  final TextInputType keyBoardType;
  // final
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.showPrefix = false,
    required this.onChanged,
    this.keyBoardType = TextInputType.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      keyboardType: keyBoardType,
      decoration: InputDecoration(
        prefixIcon: showPrefix
            ? ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 60,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '+91',
                      style: MyTextStyle.onBoardDescTextStyle
                          .copyWith(fontSize: 16),
                    ),
                    SvgPicture.asset(
                      LoginHelper.down,
                      height: 7.h,
                    ),
                    Container(
                      height: 18.h,
                      width: 1.w,
                      color: AppColors.textBorder,
                    ),
                  ],
                ),
              )
            : null,
        prefixStyle: MyTextStyle.onBoardDescTextStyle,
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.textBorder,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.textBorder,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.textBorder,
          ),
        ),
        hintText: hintText,
        hintStyle: MyTextStyle.onBoardDescTextStyle,
      ),
    );
  }
}
