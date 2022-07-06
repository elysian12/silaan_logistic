import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:silaan_logistic/app/bottomNavigation/widgets/bottom_navigation_bar.dart';
import 'package:silaan_logistic/app/common/constants/colors.dart';
import 'package:silaan_logistic/app/common/constants/helper.dart';
import 'package:silaan_logistic/app/modules/home/views/home_view.dart';
import 'package:silaan_logistic/app/modules/profile/views/profile_view.dart';
import 'package:silaan_logistic/app/modules/report/views/report_view.dart';

import '../controllers/bottom_navigation_controller.dart';

class BottomNavigationView extends GetView<BottomNavigationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        leading: Padding(
          padding: EdgeInsets.only(left: 21.w),
          child: SvgPicture.asset(
            Helper.logo,
            color: AppColors.iconColor,
          ),
        ),
        actions: [
          Obx(() {
            return controller.tabIndex.value == 0
                ? InkWell(
                    onTap: () {
                      controller.showBottomSheet();
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: 14.w),
                      child: Icon(Icons.filter_alt_outlined),
                    ),
                  )
                : SizedBox.shrink();
          }),
        ],
      ),
      body: Obx(() {
        return IndexedStack(
          children: [
            HomeView(),
            ReportView(),
            ProfileView(),
          ],
          index: controller.tabIndex.value,
        );
      }),
      bottomNavigationBar: MyBottomBar(),
    );
  }
}
