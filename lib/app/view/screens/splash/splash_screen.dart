
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
   SplashScreen({super.key});
final SplashController splashController = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
  return  Scaffold(
    body: Center(child: Text('Start'),),
  );
  }
}
