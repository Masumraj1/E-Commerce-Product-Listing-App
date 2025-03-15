
import 'package:get/get.dart';
import 'package:recipe_app/app/view/screens/splash/controller/splash_controller.dart';

class DependencyInjection extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController(), fenix: true);


  }
}