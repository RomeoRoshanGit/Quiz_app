import 'package:get/get.dart';

class DashboardController extends GetxController {
  //TODO: Implement DashboardController
  String name='';
  final count = 0.obs;
  @override
  void onInit() {
    name=Get.arguments as String;
    name=name.split(' ').first;
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
