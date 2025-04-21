import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


import 'app/bindings/dependency_injection.dart';
import 'app/core/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("Width=========${MediaQuery.of(context).size.width}");
    debugPrint("Height=========${MediaQuery.of(context).size.height}");
    return ScreenUtilInit(

      designSize: const Size(360, 752),
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      builder: (context, child) => GetMaterialApp.router(
        initialBinding: DependencyInjection(),
        debugShowCheckedModeBanner: false,
        routeInformationParser: AppRouter.route.routeInformationParser,
        routerDelegate: AppRouter.route.routerDelegate,
        routeInformationProvider: AppRouter.route.routeInformationProvider,
      ),
    );
  }
}


