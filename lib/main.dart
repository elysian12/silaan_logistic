import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:silaan_logistic/app/bottomNavigation/bindings/bottom_navigation_binding.dart';
import 'package:silaan_logistic/app/data/services/shared_services.dart';
import 'package:silaan_logistic/app/modules/login/bindings/login_binding.dart';

import 'app/common/constants/theme.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  bool isLoggedIn = await SharedService().getSharedUUID() != null;
  runApp(MyApp(
    isLoggedIn: isLoggedIn,
  ));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({Key? key, required this.isLoggedIn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
            theme: appTheme(),
            debugShowCheckedModeBanner: false,
            builder: (context, widget) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: GetMaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: appTheme(),
                  title: "Silaan",
                  initialRoute:
                      isLoggedIn ? Routes.BOTTOM_NAVIGATION : AppPages.INITIAL,
                  getPages: AppPages.routes,
                  initialBinding:
                      isLoggedIn ? BottomNavigationBinding() : LoginBinding(),
                ),
              );
            });
      },
    );
  }
}
