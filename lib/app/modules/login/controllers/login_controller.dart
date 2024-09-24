import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quiz_app/app/routes/app_pages.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController
  late BuildContext context;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final storage = GetStorage();
  final count = 0.obs;
  RxBool hidePassword=true.obs;
  @override
  void onInit() {
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

  void submitForm() {
    if (formKey.currentState!.validate()) {
      bool flag=false;
      List<dynamic> usersList = storage.read<List>('users') ?? [];

      for (var user in usersList) {
        if (user['email'] == emailController.text &&
            user['password'] == passwordController.text) {
          Get.offAllNamed(Routes.DASHBOARD,arguments: user['name']);
          flag=true;
        }

      }
      if(flag==false){
        Get.snackbar("User not found", "No user is registered with this credentials",snackPosition: SnackPosition.BOTTOM);
      }
    } else {
      print("Form is invalid");
    }
  }

  togglePass(){
    hidePassword.value=!hidePassword.value;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    } else if (!GetUtils.isEmail(value)) {
      return "Enter a valid email";
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    } else if (value.length < 6) {
      return "Password must be at least 6 characters";
    }
    return null;
  }

  void increment() => count.value++;
}
