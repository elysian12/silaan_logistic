import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:silaan_logistic/app/common/constants/colors.dart';
import 'package:silaan_logistic/app/common/constants/text_style.dart';
import 'package:silaan_logistic/app/common/widgets/filled_cutom_button.dart';
import 'package:silaan_logistic/app/common/widgets/loading_overlay.dart';
import 'package:silaan_logistic/app/modules/helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:silaan_logistic/app/modules/home/controllers/home_controller.dart';

import 'package:silaan_logistic/app/modules/home/models/order_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class OrderView extends GetView<HomeController> {
  final OrderModel order;
  const OrderView({
    Key? key,
    required this.order,
  }) : super(key: key);

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
          HomeHelper.orderDetails,
          style: MyTextStyle.appBarTextStyle,
        ),
      ),
      body: LoadingOverlay(
        isLoading: controller.isLoading,
        child: Container(
          margin: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
            top: 20.h,
            bottom: 80.h,
          ),
          padding: EdgeInsets.only(
            left: 26.w,
            right: 20.w,
            top: 20.h,
            bottom: 17.h,
          ),
          color: AppColors.iconColor,
          child: SizedBox(
            width: Get.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${HomeHelper.name} : ${order.name}',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  '${HomeHelper.orderId} : ${order.orderID}',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      HomeHelper.descripition,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: order.decripition!.split(',').map((e) {
                        return Text(e);
                      }).toList(),
                    )
                  ],
                ),
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      HomeHelper.payment,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    Text(
                      order.status!.name,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textBorder,
                          ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  '${HomeHelper.amount}  ₹ ${order.amount} (${order.qunatity} items)',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  '${HomeHelper.pickUpDate} : ${DateFormat('dd MMM yyyy').format(order.pickDate!)}',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  '${HomeHelper.deliveryDate} : ${DateFormat('dd MMM yyyy').format(order.deliveryDate!)}',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  '${HomeHelper.location} : ${order.location}',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Container(
                  height: 139.h,
                  width: 281.w,
                  // color: AppColors.textBorder,
                  child: WebView(
                    javascriptMode: JavascriptMode.unrestricted,
                    zoomEnabled: true,
                    onWebViewCreated: (controller) {
                      controller.runJavascript(
                          "document.getElementById('omnibox').style.display = \"none\"");
                    },
                    userAgent:
                        'Version/4.0 Chrome/43.0.2357.65 Mobile Safari/537.36',
                    initialUrl:
                        "https://www.google.com/maps/?pb=!1m18!1m12!1m3!1d118106.71283250827!2d73.10304567004724!3d22.322087608604043!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x395fc8ab91a3ddab%3A0xac39d3bfe1473fb8!2sVadodara%2C%20Gujarat!5e0!3m2!1sen!2sin!4v1656657999154!5m2!1sen!2sin",
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  '${HomeHelper.remark} : ${order.location}',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  children: [
                    Text(
                      HomeHelper.contactNumber,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    ChipButtons(
                      label: order.contactNumber!,
                      onTap: () {},
                    )
                  ],
                ),
                SizedBox(
                  height: 12.h,
                ),
                InkWell(
                  onTap: () {
                    final homeController = Get.find<HomeController>();
                    homeController.sendOTP(order.contactNumber!, context);
                  },
                  child: Container(
                    height: 35.h,
                    width: 336.w,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Center(
                      child: Text(
                        HomeHelper.pickup,
                        style: MyTextStyle.appBarTextStyle
                            .copyWith(height: 21.65.sp / 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
