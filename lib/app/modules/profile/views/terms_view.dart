import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:silaan_logistic/app/common/constants/colors.dart';
import 'package:silaan_logistic/app/common/constants/text_style.dart';
import 'package:silaan_logistic/app/modules/helper.dart';

class TermsAndConditionView extends StatelessWidget {
  const TermsAndConditionView({Key? key}) : super(key: key);

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
          HomeHelper.terms,
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
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  HomeHelper.terms,
                  style: MyTextStyle.heading,
                ),
                TermsContainer(
                  label: HomeHelper.introduction,
                  desc: HomeHelper.introText,
                ),
                TermsContainer(
                  label: HomeHelper.communication,
                  desc: HomeHelper.communicationText,
                ),
                TermsContainer(
                  label: HomeHelper.purchase,
                  desc: HomeHelper.purchaseText,
                ),
                TermsContainer(
                  label: HomeHelper.contest,
                  desc: HomeHelper.contestText,
                ),
                TermsContainer(
                  label: HomeHelper.content,
                  desc: HomeHelper.contentText,
                ),
                TermsContainer(
                  label: HomeHelper.prohibited,
                  desc: HomeHelper.prohibitedText,
                ),
                TermsContainer(
                  label: HomeHelper.analytics,
                  desc: HomeHelper.analyticsText,
                ),
                TermsContainer(
                  label: HomeHelper.minor,
                  desc: HomeHelper.minorText,
                ),
                TermsContainer(
                  label: HomeHelper.accounts,
                  desc: HomeHelper.accountsText,
                ),
                TermsContainer(
                  label: HomeHelper.copyright,
                  desc: HomeHelper.copyrightText,
                ),
                TermsContainer(
                  label: HomeHelper.dmca,
                  desc: HomeHelper.dmcaText,
                ),
                TermsContainer(
                  label: HomeHelper.error,
                  desc: HomeHelper.errorText,
                ),
                TermsContainer(
                  label: HomeHelper.links,
                  desc: HomeHelper.linksText,
                ),
                TermsContainer(
                  label: HomeHelper.disclaimer,
                  desc: HomeHelper.discText,
                ),
                TermsContainer(
                  label: HomeHelper.limitation,
                  desc: HomeHelper.limitationText,
                ),
                TermsContainer(
                  label: HomeHelper.termination,
                  desc: HomeHelper.terminationText,
                ),
                TermsContainer(
                  label: HomeHelper.laws,
                  desc: HomeHelper.lawsText,
                ),
                TermsContainer(
                  label: HomeHelper.services,
                  desc: HomeHelper.serviceText,
                ),
                TermsContainer(
                  label: HomeHelper.amendments,
                  desc: HomeHelper.amendentsText,
                ),
                TermsContainer(
                  label: HomeHelper.ack,
                  desc: HomeHelper.ackText,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TermsContainer extends StatelessWidget {
  final String label;
  final String desc;
  const TermsContainer({
    Key? key,
    required this.label,
    required this.desc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 15.h,
        ),
        Text(
          label,
          style: MyTextStyle.subHeading,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 15.h,
        ),
        Text(
          desc,
          textAlign: TextAlign.center,
          style: MyTextStyle.onBoardDescTextStyle.copyWith(
            color: AppColors.fontColor,
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
