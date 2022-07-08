import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:silaan_logistic/app/common/constants/colors.dart';
import 'package:silaan_logistic/app/data/methods/firestore_methods.dart';
import 'package:silaan_logistic/app/modules/helper.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:silaan_logistic/app/modules/home/models/order_model.dart';

import '../controllers/report_controller.dart';

class ReportView extends GetView<ReportController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ReportController>(builder: (context) {
        if (controller.isFemaleExecutive) {
          return DefaultTabController(
            length: 2,
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
                    children: [
                      ListView.builder(
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 19.w, vertical: 20.h),
                            height: 282.h,
                            color: AppColors.iconColor,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text(
                                  HomeHelper.orderAnalytic,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        color: AppColors.primaryColor,
                                      ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 20,
                                      top: 20,
                                      right: 30,
                                      bottom: 40,
                                    ),
                                    child: LineChart(
                                      LineChartData(
                                        minX: 0,
                                        maxX: 6,
                                        minY: 0,
                                        maxY: 4,
                                        lineBarsData: [
                                          LineChartBarData(
                                              isCurved: true,
                                              color: AppColors.primaryColor,
                                              spots: [
                                                FlSpot(1, 1.5),
                                                FlSpot(1.5, 1.8),
                                                FlSpot(2, 2),
                                                FlSpot(2, 1.5),
                                                FlSpot(2.5, 2.2),
                                                FlSpot(3, 3),
                                                FlSpot(3.5, 2.4),
                                                FlSpot(4, 3.5),
                                                FlSpot(4.5, 3.5),
                                                FlSpot(5, 3.5),
                                              ],
                                              dotData: FlDotData(show: false),
                                              belowBarData: BarAreaData(
                                                show: true,
                                                gradient: LinearGradient(
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  colors: [
                                                    AppColors.primaryColor
                                                        .withOpacity(0.5),
                                                    AppColors.iconColor,
                                                  ],
                                                ),
                                              )),
                                        ],
                                        borderData: FlBorderData(show: false),
                                        titlesData: FlTitlesData(
                                          show: true,
                                          bottomTitles: _bottomTitles,
                                          leftTitles: _leftTitles,
                                          topTitles: AxisTitles(
                                            sideTitles:
                                                SideTitles(showTitles: false),
                                          ),
                                          rightTitles: AxisTitles(
                                            sideTitles:
                                                SideTitles(showTitles: false),
                                          ),
                                        ),
                                        gridData: FlGridData(
                                          show: true,
                                          getDrawingVerticalLine: (value) {
                                            return FlLine(
                                              color: AppColors.iconColor,
                                            );
                                          },
                                          getDrawingHorizontalLine: (value) {
                                            return FlLine(
                                              color: AppColors.fontColor
                                                  .withOpacity(0.1),
                                              strokeWidth: 0.5,
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      ListView.builder(
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 19.w, vertical: 20.h),
                            height: 282.h,
                            color: AppColors.iconColor,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text(
                                  HomeHelper.orderAnalytic,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        color: AppColors.primaryColor,
                                      ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 20,
                                      top: 20,
                                      right: 30,
                                      bottom: 40,
                                    ),
                                    child: LineChart(
                                      LineChartData(
                                        minX: 0,
                                        maxX: 6,
                                        minY: 0,
                                        maxY: 4,
                                        lineBarsData: [
                                          LineChartBarData(
                                              isCurved: true,
                                              color: AppColors.primaryColor,
                                              spots: [
                                                FlSpot(1, 1.5),
                                                FlSpot(1.5, 1.8),
                                                FlSpot(2, 2),
                                                FlSpot(2, 1.5),
                                                FlSpot(2.5, 2.2),
                                                FlSpot(3, 3),
                                                FlSpot(3.5, 2.4),
                                                FlSpot(4, 3.5),
                                                FlSpot(4.5, 3.5),
                                                FlSpot(5, 3.5),
                                              ],
                                              dotData: FlDotData(show: false),
                                              belowBarData: BarAreaData(
                                                show: true,
                                                gradient: LinearGradient(
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  colors: [
                                                    AppColors.primaryColor
                                                        .withOpacity(0.5),
                                                    AppColors.iconColor,
                                                  ],
                                                ),
                                              )),
                                        ],
                                        borderData: FlBorderData(show: false),
                                        titlesData: FlTitlesData(
                                          show: true,
                                          bottomTitles: _bottomTitles,
                                          leftTitles: _leftTitles,
                                          topTitles: AxisTitles(
                                            sideTitles:
                                                SideTitles(showTitles: false),
                                          ),
                                          rightTitles: AxisTitles(
                                            sideTitles:
                                                SideTitles(showTitles: false),
                                          ),
                                        ),
                                        gridData: FlGridData(
                                          show: true,
                                          getDrawingVerticalLine: (value) {
                                            return FlLine(
                                              color: AppColors.iconColor,
                                            );
                                          },
                                          getDrawingHorizontalLine: (value) {
                                            return FlLine(
                                              color: AppColors.fontColor
                                                  .withOpacity(0.1),
                                              strokeWidth: 0.5,
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        } else {
          return DefaultTabController(
            length: 3,
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
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      ListView.builder(
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 19.w, vertical: 20.h),
                            height: 282.h,
                            color: AppColors.iconColor,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text(
                                  HomeHelper.orderAnalytic,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        color: AppColors.primaryColor,
                                      ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 20,
                                      top: 20,
                                      right: 30,
                                      bottom: 40,
                                    ),
                                    child: LineChart(
                                      LineChartData(
                                        minX: 0,
                                        maxX: 6,
                                        minY: 0,
                                        maxY: 4,
                                        lineBarsData: [
                                          LineChartBarData(
                                              isCurved: true,
                                              color: AppColors.primaryColor,
                                              spots: [
                                                FlSpot(1, 1.5),
                                                FlSpot(1.5, 1.8),
                                                FlSpot(2, 2),
                                                FlSpot(2, 1.5),
                                                FlSpot(2.5, 2.2),
                                                FlSpot(3, 3),
                                                FlSpot(3.5, 2.4),
                                                FlSpot(4, 3.5),
                                                FlSpot(4.5, 3.5),
                                                FlSpot(5, 3.5),
                                              ],
                                              dotData: FlDotData(show: false),
                                              belowBarData: BarAreaData(
                                                show: true,
                                                gradient: LinearGradient(
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  colors: [
                                                    AppColors.primaryColor
                                                        .withOpacity(0.5),
                                                    AppColors.iconColor,
                                                  ],
                                                ),
                                              )),
                                        ],
                                        borderData: FlBorderData(show: false),
                                        titlesData: FlTitlesData(
                                          show: true,
                                          bottomTitles: _bottomTitles,
                                          leftTitles: _leftTitles,
                                          topTitles: AxisTitles(
                                            sideTitles:
                                                SideTitles(showTitles: false),
                                          ),
                                          rightTitles: AxisTitles(
                                            sideTitles:
                                                SideTitles(showTitles: false),
                                          ),
                                        ),
                                        gridData: FlGridData(
                                          show: true,
                                          getDrawingVerticalLine: (value) {
                                            return FlLine(
                                              color: AppColors.iconColor,
                                            );
                                          },
                                          getDrawingHorizontalLine: (value) {
                                            return FlLine(
                                              color: AppColors.fontColor
                                                  .withOpacity(0.1),
                                              strokeWidth: 0.5,
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      Container(),
                      Container(),
                    ],
                  ),
                )
              ],
            ),
          );
        }
      }),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: AppColors.primaryColor,
      //   child: Icon(Icons.add),
      //   onPressed: () {
      //     FireStoreMethods().addDummyOrders(
      //       OrderModel(
      //         amount: 999,
      //         contactNumber: "8299580719",
      //         descripition:
      //             'Front Neck [ V Neck ], Back Neck [ Boat Neck ],Cut [ Plain Cut ],Sleeves [ 3/4 th sleeves],Size : XXS',
      //         deliveryDate: DateTime.now(),
      //         pickDate: DateTime.now(),
      //         imgUrl:
      //             'https://firebasestorage.googleapis.com/v0/b/silaan.appspot.com/o/orders%2Fmodel1.png?alt=media&token=f095c198-e18d-489c-afdc-7f6ee096b443',
      //         location: '25/1 Geetanjali Apartment',
      //         measurements: null,

      //         // Measurements(
      //         //   armLength: '6.00 inches',
      //         //   backNeckDepth: '6.00 inches',
      //         //   chest: '6.00 inches',
      //         //   comments: 'NA',
      //         //   frontNeckDepth: '6.00 inches',
      //         //   shoulderLength: '6.00 inches',
      //         //   upperBodyLength: '6.00 inches',
      //         // ),
      //         orderID: '0xff127',
      //         name: 'Sneha Singh',
      //         typeOfCloth: 'Blouse',
      //         typeOfStich: 'Basic',
      //         orderStatus: Status.ready,
      //         qunatity: 1,
      //         paymentStatus: PaymentStatus.complete,
      //       ),
      //     );
      //   },
      // ),
    );
  }

  AxisTitles get _bottomTitles => AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          interval: 1,
          getTitlesWidget: (value, _) {
            switch (value.toInt()) {
              case 0:
                return Text('Jan');
              case 1:
                return Text('Feb');
              case 2:
                return Text('Mar');
              case 3:
                return Text('Apr');
              case 4:
                return Text('May');
              case 5:
                return Text('Jun');
            }

            return Text('');
          },
        ),
      );
  AxisTitles get _leftTitles => AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (value, _) {
            switch (value.toInt()) {
              case 0:
                return Text('');
              case 1:
                return Text('10');
              case 2:
                return Text('20');
              case 3:
                return Text('30');
              case 4:
                return Text('40');
              case 5:
                return Text('50');
            }

            return Text('');
          },
        ),
      );
}
