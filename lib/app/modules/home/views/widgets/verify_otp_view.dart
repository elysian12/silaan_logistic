import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:silaan_logistic/app/common/constants/colors.dart';
import 'package:silaan_logistic/app/common/constants/text_style.dart';
import 'package:silaan_logistic/app/common/widgets/custom_text_field.dart';
import 'package:silaan_logistic/app/common/widgets/filled_cutom_button.dart';
import 'package:silaan_logistic/app/common/widgets/loading_overlay.dart';
import 'package:silaan_logistic/app/modules/helper.dart';
import 'package:silaan_logistic/app/modules/home/controllers/home_controller.dart';
import 'package:silaan_logistic/app/modules/home/models/order_model.dart';
import 'package:silaan_logistic/app/modules/login/views/helper.dart';

class VerifyOtpView extends GetView<HomeController> {
  final Status status;
  final String order;
  const VerifyOtpView({Key? key, required this.status, required this.order})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
          title: Text(
            HomeHelper.otp,
            style: MyTextStyle.appBarTextStyle,
          ),
        ),
        body: LoadingOverlay(
          isLoading: controller.isLoading,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                Spacer(
                  flex: 3,
                ),
                Text(HomeHelper.pickreq),
                SizedBox(
                  height: 20.h,
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
                  label: HomeHelper.confirm,
                  onTap: () {
                    controller.verifyOTP(
                        controller.otpCode, context, status, order);
                  },
                ),
                Spacer(
                  flex: 5,
                ),
              ],
            ),
          ),
        ));
  }
}
