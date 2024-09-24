import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quiz_app/app/modules/utils/color_res.dart';
import 'package:quiz_app/app/modules/utils/styles.dart';

import '../controllers/quiz_page_controller.dart';

class QuizPageView extends GetView<QuizPageController> {
  const QuizPageView({super.key});

  Widget build(BuildContext context) {
    controller.context = context;
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorRes.bgColor,
        body: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  width: Get.width,
                  height: 330,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                    child: Image.asset(
                      'assets/images/bg.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(height: 80),
                Expanded(
                  child: SingleChildScrollView(
                    child: Obx(
                      () => ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller
                            .questions[controller.questionIndex.value]['options']
                            .length,
                        itemBuilder: (context, index) {
                    
                          return GestureDetector(
                            onTap: () {
                              if(controller.questionAnswered.value==false){
                                controller.selectOption(index);
                              }
                            },
                            child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Obx(
                                  () => Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                      color:
                                      controller.correctIndex.value!=index?
                                      controller.selectedOption.value==index?controller.borderColor.value:ColorRes.secondary:ColorRes.success),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Text(
                                        controller.questions[controller
                                            .questionIndex.value]['options'][index],
                                        style: textRegular(),
                                      ),
                                    ),
                                  ),
                                )),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    const SizedBox(height: 200),
                    Container(
                      width: Get.width / 1.2,
                      height: 200,
                      decoration: BoxDecoration(
                        color: ColorRes.bgColor,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: ColorRes.textColor,
                            blurStyle: BlurStyle.outer,
                            blurRadius: 5,
                            spreadRadius: 20,
                            offset: Offset(1, 1),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Obx(()=>
                              Text(
                                controller.questions[controller.questionIndex.value]
                                ['question'],
                                style: textRegular(size: 18),
                                textAlign: TextAlign.center,
                              ),
                          )
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: Obx(()=>
          controller.questionAnswered.value==false?
              SizedBox():
          FloatingActionButton(
            onPressed: () {
              controller.nextQuestion();
            },
            backgroundColor: ColorRes.purpleAcc!.withOpacity(.7),
            child: const Icon(Icons.arrow_forward_ios, color: ColorRes.bgColor),
          )
        ),
      ),
    );
  }
}
