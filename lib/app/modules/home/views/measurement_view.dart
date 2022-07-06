import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:silaan_logistic/app/modules/helper.dart';
import 'package:silaan_logistic/app/modules/profile/views/profile_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:silaan_logistic/app/routes/app_pages.dart';

class MeasurementView extends StatelessWidget {
  const MeasurementView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              EditContainer(
                label: HomeHelper.frontNeckDepth,
                value: '6.0 inches',
              ),
              EditContainer(
                  label: HomeHelper.backNeckDepth, value: '6.0 inches'),
              EditContainer(
                  label: HomeHelper.shoulderLength, value: '6.0 inches'),
              EditContainer(label: HomeHelper.armLength, value: '6.0 inches'),
              EditContainer(label: HomeHelper.chest, value: '6.0 inches'),
              EditContainer(
                  label: HomeHelper.upperBodyLength, value: '6.0 inches'),
              EditContainer(label: HomeHelper.comments, value: '6.0 inches'),
              SizedBox(
                height: 40.h,
              ),
              OutlinedButton(
                onPressed: () {
                  Get.offAllNamed(Routes.BOTTOM_NAVIGATION);
                },
                child: Text(
                  'Next',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.w600,
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
