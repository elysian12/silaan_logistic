import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:silaan_logistic/app/common/constants/colors.dart';
import 'package:silaan_logistic/app/common/constants/text_style.dart';
import 'package:silaan_logistic/app/modules/helper.dart';
import 'package:silaan_logistic/app/modules/home/controllers/home_controller.dart';
import 'package:silaan_logistic/app/modules/home/models/order_model.dart';
import 'package:silaan_logistic/app/modules/profile/views/profile_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:silaan_logistic/app/routes/app_pages.dart';

class MeasurementView extends StatefulWidget {
  @override
  State<MeasurementView> createState() => _MeasurementViewState();
}

class _MeasurementViewState extends State<MeasurementView> {
  Measurements measurements = Measurements(
    armLength: '6.0 inches',
    backNeckDepth: '6.0 inches',
    chest: '6.0 inches',
    comments: 'na',
    frontNeckDepth: '6.0 inches',
    shoulderLength: '6.0 inches',
    upperBodyLength: '6.0 inches',
  );
  var orderID = Get.arguments;

  bool isLoading = false;

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: AppColors.primaryColor,
          ),
          SizedBox(
            width: 15,
          ),
          Container(
            margin: EdgeInsets.only(left: 7),
            child: Text("Loading..."),
          ),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Measurements',
          style: MyTextStyle.appBarTextStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              EditContainer(
                label: HomeHelper.frontNeckDepth,
                value: '6.0 inches',
                isProfile: false,
                onSubmitted: (value) {
                  log(value);
                  measurements.frontNeckDepth = value;
                },
              ),
              EditContainer(
                label: HomeHelper.backNeckDepth,
                value: '6.0 inches',
                isProfile: false,
                onSubmitted: (value) {
                  log(value);
                  measurements.backNeckDepth = value;
                },
              ),
              EditContainer(
                label: HomeHelper.shoulderLength,
                value: '6.0 inches',
                isProfile: false,
                onSubmitted: (value) {
                  log(value);
                  measurements.shoulderLength = value;
                },
              ),
              EditContainer(
                label: HomeHelper.armLength,
                value: '6.0 inches',
                isProfile: false,
                onSubmitted: (value) {
                  log(value);
                  measurements.armLength = value;
                },
              ),
              EditContainer(
                label: HomeHelper.chest,
                value: '6.0 inches',
                isProfile: false,
                onSubmitted: (value) {
                  log(value);
                  measurements.chest = value;
                },
              ),
              EditContainer(
                label: HomeHelper.upperBodyLength,
                value: '6.0 inches',
                isProfile: false,
                onSubmitted: (value) {
                  log(value);
                  measurements.upperBodyLength = value;
                },
              ),
              EditContainer(
                label: HomeHelper.comments,
                value: '6.0 inches',
                isProfile: false,
                onSubmitted: (value) {
                  log(value);
                  measurements.comments = value;
                },
              ),
              SizedBox(
                height: 40.h,
              ),
              InkWell(
                onTap: () async {
                  log(orderID);
                  showLoaderDialog(context);
                  final homeController = Get.find<HomeController>();
                  await homeController.updateMeasurement(orderID, measurements);
                  Get.offAllNamed(Routes.BOTTOM_NAVIGATION);
                },
                child: Container(
                  width: Get.width,
                  height: 40.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.iconColor,
                    border:
                        Border.all(color: AppColors.fontColor.withOpacity(0.5)),
                  ),
                  child: Text(
                    'Next',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
