import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quiz_app/app/routes/app_pages.dart';

class SignUpController extends GetxController {
  //TODO: Implement SignUpController
  late BuildContext context;
  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController admnoController=TextEditingController();
  final formKey = GlobalKey<FormState>();
  final storage=GetStorage();
  final count = 0.obs;
  RxBool hidePassword=true.obs;
  List<String> universities=<String>['M G University','KTU','Calicut University'];
  String selectedUniversity='M G University';
  List<String> courses=<String>['Bsc Physics','MCA','Bsc Maths'];
  String selectedCourse='Bsc Physics';


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
    print("$selectedCourse $selectedUniversity");
    if (formKey.currentState!.validate()) {
      Map<String, String> newUser = {
        'name': nameController.text,
        'email': emailController.text,
        'password': passwordController.text,
        'university':selectedUniversity,
        'course':selectedCourse,
        'admno':admnoController.text
      };
      List<dynamic> usersList = storage.read<List>('users') ?? [];
      usersList.add(newUser);
      storage.write('users', usersList);
      Get.offAllNamed(Routes.DASHBOARD,arguments: admnoController.text);
    } else {
    }
  }

  togglePass(){
    hidePassword.value=!hidePassword.value;
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return "Name is required";
    }
    return null;
  }

  String? validateAdmno(String? value) {
    if (value == null || value.isEmpty) {
      return "Admno is required";
    }
    else if(value.length!=6){
      return "Input a 6 digit admno";
    }
    return null;
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
