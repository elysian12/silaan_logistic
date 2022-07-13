import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:silaan_logistic/app/common/constants/colors.dart';
import 'package:silaan_logistic/app/modules/helper.dart';
import 'package:silaan_logistic/app/modules/home/controllers/home_controller.dart';
import 'package:silaan_logistic/app/modules/home/models/order_model.dart';

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
        children: List.generate(5, (index) {
          return InkWell(
            onTap: () {
              Get.back();
              final homeController = Get.find<HomeController>();
              if (index == 1) {
                homeController.getAllorders(status: Status.accepted);
              }
              if (index == 3) {
                homeController.getAllorders(status: Status.ready);
              }
              if (index == 4) {
                homeController.getAllorders(status: null);
              }
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
                              : index == 3
                                  ? HomeHelper.dropCustomer
                                  : HomeHelper.none,
                ),
                SizedBox(
                  height: 6.h,
                ),
                index != 4 ? Divider() : SizedBox(),
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
