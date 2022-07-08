import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:silaan_logistic/app/common/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:silaan_logistic/app/common/widgets/loading_overlay.dart';
import 'package:silaan_logistic/app/modules/helper.dart';
import 'package:silaan_logistic/app/modules/home/models/order_model.dart';
import 'package:silaan_logistic/app/modules/home/views/order_view.dart';

import '../../../common/widgets/filled_cutom_button.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetBuilder<HomeController>(builder: (context) {
      if (controller.isFemaleExecutive) {
        return DefaultTabController(
          length: 2,
          child: LoadingOverlay(
            isLoading: controller.isLoading,
            child: Column(
              children: [
                Container(
                  color: AppColors.iconColor,
                  child: TabBar(
                    indicatorColor: AppColors.primaryColor,
                    unselectedLabelColor: AppColors.fontColor,
                    labelColor: AppColors.primaryColor,
                    tabs: [
                      Tab(
                        text: HomeHelper.allOrders,
                      ),
                      Tab(
                        text: HomeHelper.customer,
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    GetX<HomeController>(builder: (_) {
                      return ListView.builder(
                        itemCount: controller.orders.length,
                        itemBuilder: (context, index) {
                          var item = controller.orders[index];
                          return Padding(
                            padding: EdgeInsets.only(
                              top: index == 0 ? 20.h : 7.h,
                              left: 22.w,
                              right: 17.w,
                              bottom: index == (controller.orders.length - 1)
                                  ? 20.h
                                  : 7.h,
                            ),
                            child: InkWell(
                              onTap: () {
                                Get.to(() => OrderView(order: item));
                              },
                              child: OrderCard(
                                imgUrl: item.imgUrl!,
                                orderID: item.orderID!,
                                productName: item.typeOfCloth!,
                                status: item.orderStatus!.name,
                                accept: () {
                                  if (item.orderStatus! == Status.accepted) {
                                    controller.sendOTP(
                                      item.contactNumber!,
                                      context,
                                      Status.processing,
                                      item.orderID!,
                                    );
                                  } else {
                                    controller.sendOTP(
                                      item.contactNumber!,
                                      context,
                                      Status.delivered,
                                      item.orderID!,
                                    );
                                  }
                                },
                                reject: () {
                                  controller.rejectOrder(item.orderID!);
                                },
                              ),
                            ),
                          );
                        },
                      );
                    }),
                    GetX<HomeController>(builder: (_) {
                      return ListView.builder(
                        itemCount: controller.orders.length,
                        itemBuilder: (context, index) {
                          var item = controller.orders[index];
                          return Padding(
                            padding: EdgeInsets.only(
                              top: index == 0 ? 20.h : 7.h,
                              left: 22.w,
                              right: 17.w,
                              bottom: index == (controller.orders.length - 1)
                                  ? 20.h
                                  : 7.h,
                            ),
                            child: InkWell(
                              onTap: () {
                                Get.to(() => OrderView(order: item));
                              },
                              child: OrderCard(
                                imgUrl: item.imgUrl!,
                                orderID: item.orderID!,
                                productName: item.typeOfCloth!,
                                status: item.orderStatus!.name,
                                accept: () {
                                  if (item.orderStatus! == Status.accepted) {
                                    controller.sendOTP(
                                      item.contactNumber!,
                                      context,
                                      Status.processing,
                                      item.orderID!,
                                    );
                                  } else {
                                    controller.sendOTP(
                                      item.contactNumber!,
                                      context,
                                      Status.delivered,
                                      item.orderID!,
                                    );
                                  }
                                },
                                reject: () {
                                  controller.rejectOrder(item.orderID!);
                                },
                              ),
                            ),
                          );
                        },
                      );
                    }),
                  ],
                )),
              ],
            ),
          ),
        );
      } else {
        return DefaultTabController(
          length: 3,
          child: LoadingOverlay(
            isLoading: controller.isLoading,
            child: Column(
              children: [
                Container(
                  color: AppColors.iconColor,
                  child: TabBar(
                    indicatorColor: AppColors.primaryColor,
                    unselectedLabelColor: AppColors.fontColor,
                    labelColor: AppColors.primaryColor,
                    tabs: [
                      Tab(
                        text: HomeHelper.allOrders,
                      ),
                      Tab(
                        text: HomeHelper.customer,
                      ),
                      Tab(
                        text: HomeHelper.tailor,
                      )
                    ],
                  ),
                ),
                Expanded(
                    child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    GetX<HomeController>(builder: (_) {
                      return ListView.builder(
                        itemCount: controller.orders.length,
                        itemBuilder: (context, index) {
                          var item = controller.orders[index];
                          return Padding(
                            padding: EdgeInsets.only(
                              top: index == 0 ? 20.h : 7.h,
                              left: 22.w,
                              right: 17.w,
                              bottom: index == (controller.orders.length - 1)
                                  ? 20.h
                                  : 7.h,
                            ),
                            child: InkWell(
                              onTap: () {
                                Get.to(() => OrderView(order: item));
                              },
                              child: OrderCard(
                                imgUrl: item.imgUrl!,
                                orderID: item.orderID!,
                                productName: item.typeOfCloth!,
                                status: item.orderStatus!.name,
                                accept: () {
                                  if (item.orderStatus! == Status.accepted) {
                                    controller.sendOTP(
                                      item.contactNumber!,
                                      context,
                                      Status.processing,
                                      item.orderID!,
                                    );
                                  } else {
                                    controller.sendOTP(
                                      item.contactNumber!,
                                      context,
                                      Status.delivered,
                                      item.orderID!,
                                    );
                                  }
                                },
                                reject: () {
                                  controller.rejectOrder(item.orderID!);
                                },
                              ),
                            ),
                          );
                        },
                      );
                    }),
                    GetX<HomeController>(builder: (_) {
                      return ListView.builder(
                        itemCount: controller.orders.length,
                        itemBuilder: (context, index) {
                          var item = controller.orders[index];
                          return Padding(
                            padding: EdgeInsets.only(
                              top: index == 0 ? 20.h : 7.h,
                              left: 22.w,
                              right: 17.w,
                              bottom: index == (controller.orders.length - 1)
                                  ? 20.h
                                  : 7.h,
                            ),
                            child: InkWell(
                              onTap: () {
                                Get.to(() => OrderView(order: item));
                              },
                              child: OrderCard(
                                imgUrl: item.imgUrl!,
                                orderID: item.orderID!,
                                productName: item.typeOfCloth!,
                                status: item.orderStatus!.name,
                                accept: () {
                                  if (item.orderStatus! == Status.accepted) {
                                    controller.sendOTP(
                                      item.contactNumber!,
                                      context,
                                      Status.processing,
                                      item.orderID!,
                                    );
                                  } else {
                                    controller.sendOTP(
                                      item.contactNumber!,
                                      context,
                                      Status.delivered,
                                      item.orderID!,
                                    );
                                  }
                                },
                                reject: () {
                                  controller.rejectOrder(item.orderID!);
                                },
                              ),
                            ),
                          );
                        },
                      );
                    }),

                    GetX<HomeController>(builder: (_) {
                      return ListView.builder(
                        itemCount: controller.orders.length,
                        itemBuilder: (context, index) {
                          var item = controller.orders[index];
                          return Padding(
                            padding: EdgeInsets.only(
                              top: index == 0 ? 20.h : 7.h,
                              left: 22.w,
                              right: 17.w,
                              bottom: index == (controller.orders.length - 1)
                                  ? 20.h
                                  : 7.h,
                            ),
                            child: InkWell(
                              onTap: () {
                                Get.to(() => OrderView(order: item));
                              },
                              child: OrderCard(
                                imgUrl: item.imgUrl!,
                                orderID: item.orderID!,
                                productName: item.typeOfCloth!,
                                status: item.orderStatus!.name,
                                accept: () {
                                  if (item.orderStatus! == Status.accepted) {
                                    controller.sendOTP(
                                      item.contactNumber!,
                                      context,
                                      Status.processing,
                                      item.orderID!,
                                    );
                                  } else {
                                    controller.sendOTP(
                                      item.contactNumber!,
                                      context,
                                      Status.delivered,
                                      item.orderID!,
                                    );
                                  }
                                },
                                reject: () {
                                  controller.rejectOrder(item.orderID!);
                                },
                              ),
                            ),
                          );
                        },
                      );
                    }),
                    // ListView.builder(
                    //   itemCount: orders.length,
                    //   itemBuilder: (context, index) {
                    //     var item = orders[index];
                    //     return Padding(
                    //       padding: EdgeInsets.only(
                    //         top: index == 0 ? 20.h : 7.h,
                    //         left: 22.w,
                    //         right: 17.w,
                    //         bottom: index == (orders.length - 1) ? 20.h : 7.h,
                    //       ),
                    //       child: OrderCard(
                    //         imgUrl: item.imgUrl,
                    //         orderID: item.orderID,
                    //         productName: item.productName,
                    //         status: item.status.name,
                    //         accept: () {
                    //           Get.to(() => VerifyOtpView());
                    //         },
                    //         reject: () {},
                    //       ),
                    //     );
                    //   },
                    // ),
                    // ListView.builder(
                    //   itemCount: orders.length,
                    //   itemBuilder: (context, index) {
                    //     var item = orders[index];
                    //     return Padding(
                    //       padding: EdgeInsets.only(
                    //         top: index == 0 ? 20.h : 7.h,
                    //         left: 22.w,
                    //         right: 17.w,
                    //         bottom: index == (orders.length - 1) ? 20.h : 7.h,
                    //       ),
                    //       child: OrderCard(
                    //         imgUrl: item.imgUrl,
                    //         orderID: item.orderID,
                    //         productName: item.productName,
                    //         status: item.status.name,
                    //         accept: () {
                    //           Get.to(() => VerifyOtpView());
                    //         },
                    //         reject: () {},
                    //       ),
                    //     );
                    //   },
                    // ),
                  ],
                )),
              ],
            ),
          ),
        );
      }
    }));
  }
}

class OrderCard extends StatelessWidget {
  final String imgUrl;
  final String orderID;
  final String productName;
  final String status;
  final VoidCallback accept;
  final VoidCallback reject;
  const OrderCard({
    Key? key,
    required this.imgUrl,
    required this.orderID,
    required this.productName,
    required this.status,
    required this.accept,
    required this.reject,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.h,
      width: 336.w,
      color: AppColors.iconColor,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: 24.w, top: 14.h, bottom: 15.h, right: 39.w),
            child: Image.network(
              imgUrl,
              fit: BoxFit.cover,
              height: 111.h,
              width: 81.w,
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.only(top: 24.h, bottom: 20.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${HomeHelper.orderId} : $orderID'),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(productName),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    '${HomeHelper.status} : $status',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: AppColors.textBorder,
                        ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      ChipButtons(
                        label: HomeHelper.accept,
                        onTap: accept,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      ChipButtons(
                        label: HomeHelper.reject,
                        onTap: reject,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
