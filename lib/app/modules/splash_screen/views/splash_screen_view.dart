import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quiz_app/app/modules/utils/color_res.dart';
import 'package:quiz_app/app/modules/utils/styles.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.context=context;
    return Scaffold(
      backgroundColor: ColorRes.bgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.quiz_outlined,size: 80,color: ColorRes.primary,),
            Text("Quiz App",style: textSemiBold(color: ColorRes.primary,size: 20),)
          ],
        )
      ),
    );
  }
}
