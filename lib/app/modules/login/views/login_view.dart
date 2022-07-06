import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:silaan_logistic/app/common/constants/text_style.dart';
import 'package:silaan_logistic/app/common/widgets/custom_text_field.dart';
import 'package:silaan_logistic/app/common/widgets/loading_overlay.dart';

import '../../../common/widgets/filled_cutom_button.dart';
import '../controllers/login_controller.dart';
import 'helper.dart';

class LoginView extends GetView<LoginController> {
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
                controller: controller.mobileController,
                hintText: LoginHelper.enterMobile,
                showPrefix: true,
                onChanged: (value) {
                  if (value.length >= 10) {
                    controller.mobile = value;
                    FocusScope.of(context).unfocus();
                  }
                },
              ),
              SizedBox(
                height: 36.h,
              ),
              FullFilledCustomButton(
                label: LoginHelper.getOtp,
                onTap: () {
                  controller.sendOTP(controller.mobile, context);
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
