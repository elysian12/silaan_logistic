import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:silaan_logistic/app/common/constants/colors.dart';
import 'package:silaan_logistic/app/common/constants/helper.dart';
import 'package:silaan_logistic/app/common/constants/text_style.dart';
import 'package:silaan_logistic/app/modules/profile/controllers/profile_controller.dart';

import '../controllers/bottom_navigation_controller.dart';

class MyBottomBar extends GetView<BottomNavigationController> {
  const MyBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: AppColors.primaryColor,
      ),
      child: SizedBox(
        height: Platform.isIOS ? Get.height * 0.0998 : Get.height * 0.085,
        child: Obx(
          () => Container(
            color: AppColors.primaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                3,
                (index) {
                  return Stack(
                    children: [
                      Container(
                        height: Get.height,
                        width: 90.w,
                        child: InkWell(
                          onTap: () {
                            controller.changePage(index);
                          },
                          child: Center(
                            child: index == 0
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        IconHelper.home,
                                      ),
                                      SizedBox(
                                        height: 7.h,
                                      ),
                                      Text(
                                        "Home",
                                        style: MyTextStyle.onBoardDescTextStyle
                                            .copyWith(
                                          color: AppColors.iconColor,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )
                                    ],
                                  )
                                : index == 1
                                    ? Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            IconHelper.order,
                                          ),
                                          SizedBox(
                                            height: 7.h,
                                          ),
                                          Text(
                                            "Report",
                                            style: MyTextStyle
                                                .onBoardDescTextStyle
                                                .copyWith(
                                              color: AppColors.iconColor,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          )
                                        ],
                                      )
                                    : Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          GetBuilder<ProfileController>(
                                              init: ProfileController(),
                                              builder: (controller) {
                                                if (controller.profileModel
                                                        .profileUrl ==
                                                    null) {
                                                  return SvgPicture.asset(
                                                    IconHelper.profile,
                                                  );
                                                } else {
                                                  return CircleAvatar(
                                                    radius: 16.r,
                                                    backgroundImage:
                                                        Image.network(controller
                                                                .profileModel
                                                                .profileUrl!)
                                                            .image,
                                                  );
                                                }
                                              }),
                                          GetBuilder<ProfileController>(
                                              builder: (controller) {
                                            return Text(
                                              controller.profileModel
                                                          .profileUrl ==
                                                      null
                                                  ? "Profile"
                                                  : '',
                                              style: MyTextStyle
                                                  .onBoardDescTextStyle
                                                  .copyWith(
                                                color: AppColors.iconColor,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            );
                                          })
                                        ],
                                      ),
                          ),
                        ),
                      ),
                      controller.tabIndex.value == index
                          ? Positioned(
                              top: 0.h,
                              left: 18.w,
                              child: Container(
                                height: 5.h,
                                width: 61.w,
                                decoration: BoxDecoration(
                                  color: AppColors.iconColor,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(8.r),
                                      bottomRight: Radius.circular(8.r)),
                                ),
                              ),
                            )
                          : SizedBox.shrink(),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
