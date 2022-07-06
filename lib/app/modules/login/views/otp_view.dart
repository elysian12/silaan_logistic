import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:silaan_logistic/app/common/constants/colors.dart';
import 'package:silaan_logistic/app/common/constants/text_style.dart';
import 'package:silaan_logistic/app/common/widgets/custom_text_field.dart';
import 'package:silaan_logistic/app/common/widgets/loading_overlay.dart';
import 'package:silaan_logistic/app/modules/login/views/helper.dart';

import '../../../common/widgets/filled_cutom_button.dart';
import '../controllers/login_controller.dart';

class OtpView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: LoadingOverlay(
        isLoading: controller.isLoading,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              Spacer(
                flex: 1,
              ),
              SvgPicture.asset(
                LoginHelper.logoUrl,
                height: 40,
              ),
              SizedBox(
                height: 21.h,
              ),
              Text(
                LoginHelper.welcome,
                style: MyTextStyle.onBoardTitleTextStyle.copyWith(
                  fontSize: 28.sp,
                ),
              ),
              Spacer(
                flex: 2,
              ),
              CustomTextField(
                controller: controller.otpController,
                hintText: LoginHelper.enterOTP,
                onChanged: (value) {
                  if (value.length >= 6) {
                    FocusScope.of(context).unfocus();
                    controller.otpCode = value;
                    log(controller.otpCode);
                  }
                },
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Didn’t receive a code? '),
                  Text(
                    ' Resend in 01:30',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: AppColors.primaryColor,
                        ),
                  ),
                ],
              ),
              SizedBox(
                height: 36.h,
              ),
              FullFilledCustomButton(
                label: LoginHelper.login,
                onTap: () {
                  controller.verifyOTP(controller.otpCode, context);
                },
              ),
              Spacer(
                flex: 5,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
