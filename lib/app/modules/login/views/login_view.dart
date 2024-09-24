import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quiz_app/app/modules/utils/color_res.dart';
import 'package:quiz_app/app/modules/utils/styles.dart';
import 'package:quiz_app/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.bgColor,
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
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
                          Icons.login,
                          size: 55,
                          color: ColorRes.bgColor.withOpacity(.8),
                        ),
                        const SizedBox(height: 16,),
                        Text(
                          "Login",
                          style:
                          textSemiBold(color: ColorRes.bgColor, size: 30),
                        ),
                        const SizedBox(height: 8,),
                        SizedBox(
                          width: Get.width/1.3,
                          child: Text(
                            "Welcome back!\nPlease enter your details",
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
          Expanded(
            child: SingleChildScrollView(
              child: Padding(padding: const EdgeInsets.all(16),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                              suffixIcon: IconButton(onPressed: controller.togglePass, icon: const Icon(Icons.remove_red_eye,color: ColorRes.secondary,))
                            ),
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
                          child: Center(child: Text("Login",style: textSemiBold(color: ColorRes.bgColor,size: 18),)),
                        ),
                      ),
                      const SizedBox(height: 12,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account? ",style: textRegular(),),
                          GestureDetector(
                              onTap: (){
                                Get.offAllNamed(Routes.SIGN_UP);
    },
                              child: Text("Sign up",style: textRegular(color: ColorRes.primary),))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),

        ],
      ),

    );
  }
}
