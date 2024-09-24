import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quiz_app/app/modules/utils/color_res.dart';
import 'package:quiz_app/app/modules/utils/styles.dart';
import 'package:quiz_app/app/routes/app_pages.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.bgColor,
      appBar: AppBar(
        backgroundColor: ColorRes.bgColor,
        actions: [
          IconButton(onPressed: (){
            Get.toNamed(Routes.VIDEO_PAGE);
          }, icon: const Icon(Icons.play_circle)),
          IconButton(onPressed: (){
            Get.offAllNamed(Routes.LOGIN);
          }, icon: const Icon(Icons.logout,))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Welcome back,\n${controller.name}",style: textMedium(size: 35),),
            const SizedBox(height: 16,),
            Text("Stay engaged and sharpen your skills! How can we assist you with today's quiz challenge?",style: textRegular(color: ColorRes.secondary,size: 16),),
            const SizedBox(height: 20,),
            Expanded(
              child: GestureDetector(
                onTap: (){
                  Get.toNamed(Routes.QUIZ_PAGE,arguments: ['Physics',controller.name]);
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: ColorRes.primary!.withOpacity(.5)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              backgroundColor: ColorRes.bgColor.withOpacity(.5),
                              child: const Icon(Icons.air),
                            ),
                            Text("Physics",style: textSemiBold(size: 20),)
                          ],
                        ),
                        Text("Total Questions: 3",style: textMedium(size: 18),),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Expanded(
              child: GestureDetector(
                onTap: (){
                  Get.toNamed(Routes.QUIZ_PAGE,arguments: ['Biology',controller.name]);
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorRes.success.withOpacity(.5)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              backgroundColor: ColorRes.bgColor.withOpacity(.5),
                              child: const Icon(Icons.biotech),
                            ),
                            Text("Biology",style: textSemiBold(size: 20),)
                          ],
                        ),
                        Text("Total Questions: 3",style: textMedium(size: 18),),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GestureDetector(
                onTap: (){
                  Get.toNamed(Routes.QUIZ_PAGE,arguments: ['Chemistry',controller.name]);
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorRes.warning.withOpacity(.5)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              backgroundColor: ColorRes.bgColor.withOpacity(.5),
                              child: const Icon(Icons.table_bar),
                            ),
                            Text("Chemistry",style: textSemiBold(size: 20),)
                          ],
                        ),
                        Text("Total Questions: 3",style: textMedium(size: 18),),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
