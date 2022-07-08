import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:silaan_logistic/app/common/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:silaan_logistic/app/modules/helper.dart';
import 'package:silaan_logistic/app/routes/app_pages.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SizedBox(
      child: Obx(() {
        return controller.isLoading.value
            ? Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      CircleAvatar(
                        radius: 50.r,
                        backgroundImage:
                            Image.network(controller.profileModel.profileUrl!)
                                .image,
                      ),
                      EditContainer(
                        label: HomeHelper.name,
                        value: controller.profileModel.name!,
                      ),
                      Container(
                        height: 300.h,
                        padding: EdgeInsets.only(
                          top: 9.h,
                          bottom: 10.h,
                          left: 20.w,
                          right: 14.w,
                        ),
                        margin: EdgeInsets.only(
                          top: 20.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.iconColor,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  HomeHelper.availability,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: List.generate(5, (index) {
                                var date = DateTime.now().add(
                                  Duration(days: index),
                                );
                                return InkWell(
                                  onTap: () {
                                    controller.changeDate(DateTime.now().add(
                                      Duration(days: index),
                                    ));
                                  },
                                  child: Container(
                                    height: 50.h,
                                    width: 50.w,
                                    padding: EdgeInsets.only(left: 5.w),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: AppColors.iconColor,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey,
                                            offset: Offset(0.0, 1.0), //(x,y)
                                            blurRadius: 2.0,
                                          )
                                        ]),
                                    child: GetBuilder<ProfileController>(
                                        builder: (_) {
                                      return Text(
                                        DateFormat('dd MMM yyyy').format(
                                          date,
                                        ),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                              color: date.day ==
                                                      controller.today.day
                                                  ? AppColors.primaryColor
                                                  : null,
                                            ),
                                      );
                                    }),
                                  ),
                                );
                              }),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            GetBuilder<ProfileController>(
                                builder: (controller) {
                              return Container(
                                child: Column(
                                  children: [
                                    Container(
                                        color: AppColors.primaryColor,
                                        padding: EdgeInsets.only(
                                          top: 6.h,
                                          left: 20.w,
                                          right: 14.w,
                                          bottom: 6.h,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              DateFormat('EEEEEEE')
                                                  .format(controller.today),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1!
                                                  .copyWith(
                                                    color: AppColors.iconColor,
                                                  ),
                                            ),
                                            Text(
                                              DateFormat('dd MMM yyyy').format(
                                                controller.today,
                                              ),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1!
                                                  .copyWith(
                                                    color: AppColors.iconColor,
                                                  ),
                                            ),
                                          ],
                                        )),
                                    Column(
                                      children: List.generate(
                                          controller.profileModel.availability!
                                              .length, (index) {
                                        var availability = controller
                                            .profileModel.availability![index];
                                        return Container(
                                          margin: EdgeInsets.only(top: 2.h),
                                          padding: EdgeInsets.only(
                                            top: 10.h,
                                            left: 20.w,
                                            right: 14.w,
                                            bottom: 10.h,
                                          ),
                                          color: AppColors.textBorder
                                              .withOpacity(0.11),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(availability.timeSlot!),
                                              DropdownButton<String>(
                                                isDense: true,
                                                underline: SizedBox(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1!,
                                                value: controller
                                                    .availabilities[index],
                                                items: controller.availability
                                                    .map((time) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    child: Text(time),
                                                    value: time,
                                                  );
                                                }).toList(),
                                                onChanged: (value) {
                                                  controller.changeMorningSlot(
                                                    index,
                                                    value,
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
                                    ),
                                  ],
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                      InfoCard(
                        label: HomeHelper.aboutus,
                        onTap: () {
                          Get.toNamed(Routes.ABOUTUS);
                        },
                      ),
                      InfoCard(
                        label: HomeHelper.terms,
                        onTap: () {
                          Get.toNamed(Routes.TERMS);
                        },
                      ),
                      InfoCard(
                        label: HomeHelper.logOut,
                        onTap: () {
                          controller.logOut();
                        },
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(HomeHelper.version),
                      SizedBox(
                        height: 15.h,
                      ),
                    ],
                  ),
                ),
              );
      }),
    ));
  }
}

class EditContainer extends StatefulWidget {
  final String label;
  final String value;
  final bool isProfile;
  const EditContainer({
    Key? key,
    required this.label,
    required this.value,
    this.isProfile = true,
  }) : super(key: key);

  @override
  State<EditContainer> createState() => _EditContainerState();
}

class _EditContainerState extends State<EditContainer> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController(text: widget.value);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  bool active = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          active = !active;
        });
      },
      child: Container(
        padding: EdgeInsets.only(
          top: 9.h,
          bottom: 10.h,
          left: 20.w,
          right: 14.w,
        ),
        margin: EdgeInsets.only(
          top: 20.h,
        ),
        // height: 55.h,
        decoration: BoxDecoration(
          color: AppColors.iconColor,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.label,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            active
                ? TextFormField(
                    controller: controller,
                    onFieldSubmitted: (value) {
                      if (widget.isProfile) {
                        setState(() {
                          var profileController = Get.find<ProfileController>();
                          profileController.profileModel.name = value;
                          profileController.updateName(value);
                          active = !active;
                        });
                      } else {}
                    },
                  )
                : Text(
                    widget.value,
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: AppColors.fontShadeColor,
                          fontSize: 14.sp,
                        ),
                  ),
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const InfoCard({
    Key? key,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: Get.width,
        padding: EdgeInsets.only(
          top: 15.h,
          bottom: 15.h,
          left: 20.w,
          right: 14.w,
        ),
        margin: EdgeInsets.only(
          top: 20.h,
        ),
        // height: 55.h,
        decoration: BoxDecoration(
          color: AppColors.iconColor,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                decoration: TextDecoration.underline,
              ),
        ),
      ),
    );
  }
}
