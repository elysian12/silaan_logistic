import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:silaan_logistic/app/common/constants/colors.dart';
import 'package:silaan_logistic/app/modules/helper.dart';
import 'package:silaan_logistic/app/modules/home/controllers/home_controller.dart';

class DeliveryBottomSheet extends StatelessWidget {
  const DeliveryBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230.h,
      width: Get.width,
      color: AppColors.iconColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(4, (index) {
          return InkWell(
            onTap: () {
              Get.back();
              final homeController = Get.find<HomeController>();
            },
            child: Column(
              children: [
                SizedBox(
                  height: 6.h,
                ),
                Text(
                  index == 0
                      ? HomeHelper.pickTailor
                      : index == 1
                          ? HomeHelper.pickCustomer
                          : index == 2
                              ? HomeHelper.dropTailor
                              : HomeHelper.dropCustomer,
                ),
                SizedBox(
                  height: 6.h,
                ),
                index != 3 ? Divider() : SizedBox(),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class FemaleBottomSheet extends StatelessWidget {
  const FemaleBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: Get.width,
      color: AppColors.iconColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(2, (index) {
          return InkWell(
            onTap: () {
              Get.back();
              // Get.to(() => OtpView());
            },
            child: Column(
              children: [
                SizedBox(
                  height: 6.h,
                ),
                Text(
                  index == 0
                      ? HomeHelper.pickCustomer
                      : HomeHelper.dropCustomer,
                ),
                SizedBox(
                  height: 6.h,
                ),
                index != 1 ? Divider() : SizedBox(),
              ],
            ),
          );
        }),
      ),
    );
  }
}
