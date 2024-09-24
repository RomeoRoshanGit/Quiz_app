import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quiz_app/app/routes/app_pages.dart';

class SplashScreenController extends GetxController {
  //TODO: Implement SplashScreenController
  late BuildContext context;

  final count = 0.obs;
  @override
  void onInit() {
    Future.delayed(Duration(seconds: 2),(){
      Get.offAllNamed(Routes.SIGN_UP);
    });
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
