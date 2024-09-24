import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quiz_app/app/routes/app_pages.dart';

class SplashScreenController extends GetxController {
  //TODO: Implement SplashScreenController
  late BuildContext context;

  final count = 0.obs;
  @override
  void onInit() {
    final storage = GetStorage();
    List<dynamic> usersList = storage.read<List>('users') ?? [];

    Future.delayed(Duration(seconds: 2),(){
      if(usersList.isNotEmpty){
        Get.offAllNamed(Routes.DASHBOARD,arguments:usersList.last['name']);
      }else{
        Get.offAllNamed(Routes.SIGN_UP);
      }
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
