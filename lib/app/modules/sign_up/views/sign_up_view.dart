import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:quiz_app/app/modules/utils/color_res.dart';
import 'package:quiz_app/app/modules/utils/styles.dart';
import 'package:quiz_app/app/routes/app_pages.dart';

import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.context=context;
    return Scaffold(
      backgroundColor: ColorRes.bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Positioned(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                          width: Get.width,
                          height: Get.height/2.3,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(40),
                                bottomRight: Radius.circular(40)),
                            child: Image.asset(
                              'assets/images/bg.jpg',
                              fit: BoxFit.fill,
                            ),
                          )),
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 35),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.person_add,
                              size: 55,
                              color: ColorRes.bgColor.withOpacity(.8),
                            ),
                            const SizedBox(height: 16,),
                            Text(
                              "Sign Up",
                              style:
                                  textSemiBold(color: ColorRes.bgColor, size: 30),
                            ),
                            const SizedBox(height: 8,),
                            SizedBox(
                              width: Get.width/1.3,
                              child: Text(
                                "Please enter the required information to sign in to the app",
                                style: textRegular(
                                    color: ColorRes.bgColor.withOpacity(.8)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              Padding(padding: const EdgeInsets.all(16),
              child: Form(
                key: controller.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Name",style: textMedium(color: ColorRes.primary,size: 14),),
                    const SizedBox(height: 4,),
                    TextFormField(
                      validator: controller.validateName,
                      controller: controller.nameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: ColorRes.secondary)
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: ColorRes.secondary),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: ColorRes.primary!)
                        ),
                        hintText: "Enter your name",
                        hintStyle: textRegular(color: ColorRes.secondary),
                        prefixIcon: const Icon(Icons.person_outline,color: ColorRes.secondary,)
                      ),
                      
                    ),
                    const SizedBox(height: 15,),
                    Text("Email",style: textMedium(color: ColorRes.primary,size: 14),),
                    const SizedBox(height: 4,),
                    TextFormField(
                      validator: controller.validateEmail,
                      controller: controller.emailController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: ColorRes.secondary)
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: ColorRes.secondary),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: ColorRes.primary!)
                          ),
                          hintText: "Enter your email",
                          hintStyle: textRegular(color: ColorRes.secondary),
                          prefixIcon: const Icon(Icons.email_outlined,color: ColorRes.secondary,)
                      ),
                    ),
                    const SizedBox(height: 15,),
                    Text("Password",style: textMedium(color: ColorRes.primary,size: 14),),
                    const SizedBox(height: 4,),
                    Obx(()=>
                        TextFormField(
                          validator: controller.validatePassword,
                          controller: controller.passwordController,
                          obscureText: controller.hidePassword.value,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(color: ColorRes.secondary)
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: ColorRes.secondary),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: ColorRes.primary!)
                              ),
                              hintText: "Enter your password",
                              hintStyle: textRegular(color: ColorRes.secondary),
                              prefixIcon: const Icon(Icons.lock_outline,color: ColorRes.secondary,),
                              suffixIcon: IconButton(onPressed: (){
                                controller.togglePass();
                              }, icon: const Icon(Icons.remove_red_eye,color: ColorRes.secondary,))
                          ),
                        ),),
                    const SizedBox(height: 15,),
                    Text("University",style: textMedium(color: ColorRes.primary,size: 14),),
                    const SizedBox(height: 4,),
                    DropdownMenu(
                      width: double.infinity,
                      initialSelection: controller.universities[0],
                      onSelected: (String? value) {
                        controller.selectedUniversity=value??"M G University";
                      },
                      dropdownMenuEntries: controller.universities
                          .map<DropdownMenuEntry<String>>((String value) {
                        return DropdownMenuEntry<String>(value: value, label: value);
                      }).toList(),
                      inputDecorationTheme: InputDecorationTheme(
                          border: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: ColorRes.secondary, width: 0),
                              borderRadius: BorderRadius.circular(10)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 1,
                                color: ColorRes.secondary,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(width: 1, color: ColorRes.secondary),
                              borderRadius: BorderRadius.circular(10))
                      ),
                      menuHeight: 200,
                      menuStyle: MenuStyle(
                        backgroundColor: MaterialStateProperty.all(ColorRes.bgColor),
                        shadowColor: MaterialStateProperty.all(ColorRes.secondary),
                        elevation: MaterialStateProperty.all(5),
                      ),
                    ),
                    const SizedBox(height: 15,),
                    Text("Course",style: textMedium(color: ColorRes.primary,size: 14),),
                    const SizedBox(height: 4,),
                    DropdownMenu(
                      width: double.infinity,
                      initialSelection: controller.courses[0],
                      onSelected: (String? value) {
                        controller.selectedCourse=value??"M G University";
                      },
                      dropdownMenuEntries: controller.courses
                          .map<DropdownMenuEntry<String>>((String value) {
                        return DropdownMenuEntry<String>(value: value, label: value);
                      }).toList(),
                      inputDecorationTheme: InputDecorationTheme(
                          border: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: ColorRes.secondary, width: 0),
                              borderRadius: BorderRadius.circular(10)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 1,
                                color: ColorRes.secondary,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(width: 1, color: ColorRes.secondary),
                              borderRadius: BorderRadius.circular(10))
                      ),
                      menuHeight: 200,
                      menuStyle: MenuStyle(
                        backgroundColor: MaterialStateProperty.all(ColorRes.bgColor),
                        shadowColor: MaterialStateProperty.all(ColorRes.secondary),
                        elevation: MaterialStateProperty.all(5),
                      ),
                    ),
                    const SizedBox(height: 15,),
                    Text("University number",style: textMedium(color: ColorRes.primary,size: 14),),
                    const SizedBox(height: 4,),
                    TextFormField(
                      validator: controller.validateAdmno,
                      controller: controller.admnoController,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: ColorRes.secondary)
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: ColorRes.secondary),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: ColorRes.primary!)
                          ),
                          hintText: "University number",
                          hintStyle: textRegular(color: ColorRes.secondary),
                          prefixIcon: const Icon(Icons.numbers,color: ColorRes.secondary,)
                      ),
                    ),
                    const SizedBox(height: 30,),
                    GestureDetector(
                      onTap: controller.submitForm,
                      child: Container(
                        height: 55,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(colors: [ColorRes.primary!,ColorRes.purpleAcc!]),
                        ),
                        child: Center(child: Text("Sign Up",style: textSemiBold(color: ColorRes.bgColor,size: 18),)),
                      ),
                    ),
                    const SizedBox(height: 12,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account? ",style: textRegular(),),
                        GestureDetector(
                            onTap: (){
                              Get.offAllNamed(Routes.LOGIN);
                            },
                            child: Text("Login",style: textRegular(color: ColorRes.primary),))
                      ],
                    )
                  ],
                ),
              ),
              ),
              
            ],
          ),
        ),
      ),
    
    );
  }
}
