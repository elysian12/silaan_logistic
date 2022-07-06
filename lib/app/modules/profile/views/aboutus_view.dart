// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:silaan_logistic/app/common/constants/colors.dart';
import 'package:silaan_logistic/app/common/constants/text_style.dart';
import 'package:silaan_logistic/app/modules/helper.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({Key? key}) : super(key: key);

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
          HomeHelper.aboutus,
          style: MyTextStyle.appBarTextStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SizedBox(
            width: Get.width,
            child: Column(
              children: [
                AboutUsContiner(
                  label: HomeHelper.aboutus,
                  desc: HomeHelper.aboutText,
                ),
                AboutUsContiner(
                  label: HomeHelper.idea,
                  desc: HomeHelper.ideaText,
                ),
                AboutUsContiner(
                  label: HomeHelper.team,
                  desc: HomeHelper.teamText,
                ),
                AboutUsContiner(
                  label: HomeHelper.work,
                  desc: HomeHelper.worksText,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AboutUsContiner extends StatefulWidget {
  final String label;
  final String desc;
  const AboutUsContiner({
    Key? key,
    required this.label,
    required this.desc,
  }) : super(key: key);

  @override
  State<AboutUsContiner> createState() => _AboutUsContinerState();
}

class _AboutUsContinerState extends State<AboutUsContiner> {
  bool showMore = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 15.h,
        ),
        Text(
          widget.label,
          style: MyTextStyle.heading,
        ),
        SizedBox(
          height: 15.h,
        ),
        SizedBox(
          height: showMore ? null : 100.h,
          child: Text(
            widget.desc,
            textAlign: TextAlign.center,
            style: MyTextStyle.onBoardDescTextStyle.copyWith(
              color: AppColors.fontColor,
            ),
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        InkWell(
          onTap: () {
            setState(() {
              showMore = !showMore;
            });
          },
          child: Container(
            height: 40.h,
            width: 100.w,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(2),
            ),
            child: Center(
              child: Text(
                showMore ? HomeHelper.readLess : HomeHelper.readMore,
                style: MyTextStyle.appBarTextStyle.copyWith(
                  fontSize: 16.sp,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        Divider(),
      ],
    );
  }
}
