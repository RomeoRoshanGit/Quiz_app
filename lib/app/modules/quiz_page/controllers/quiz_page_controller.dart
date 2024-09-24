import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/app/modules/utils/styles.dart';
import 'package:quiz_app/app/routes/app_pages.dart';

import '../../utils/color_res.dart';

class QuizPageController extends GetxController {
  //TODO: Implement QuizPageController
  late BuildContext context;
  String subject='';
  String name='';
  RxList questions=[].obs;
  RxInt questionIndex=0.obs;
  var selectedOption = (-1).obs;
  RxBool questionAnswered=false.obs;
  RxInt correctIndex=(-1).obs;
  int score=0;

  Map<String, List<Map<String, dynamic>>> quizData = {
    'Physics': [
      {
        'question': 'What is the unit of force?',
        'options': ['Newton', 'Joule', 'Watt', 'Pascal'],
        'correctAnswer': 'Newton',
      },
      {
        'question': 'What is the speed of light?',
        'options': ['300,000 km/s', '150,000 km/s', '1,000 km/s', '3,000 km/s'],
        'correctAnswer': '150,000 km/s',
      },
      {
        'question': 'What is the law of inertia?',
        'options': [
          'An object at rest stays at rest',
          'Force equals mass times acceleration',
          'Energy cannot be created or destroyed',
          'For every action, there is an equal and opposite reaction'
        ],
        'correctAnswer': 'An object at rest stays at rest',
      },
    ],
    'Chemistry': [
      {
        'question': 'What is the chemical symbol for water?',
        'options': ['H2O', 'O2', 'CO2', 'NaCl'],
        'correctAnswer': 'H2O',
      },
      {
        'question': 'What is the pH of pure water?',
        'options': ['7', '0', '14', '3'],
        'correctAnswer': '7',
      },
      {
        'question': 'Which gas is produced during photosynthesis?',
        'options': ['Oxygen', 'Carbon Dioxide', 'Nitrogen', 'Hydrogen'],
        'correctAnswer': 'Oxygen',
      },
    ],
    'Biology': [
      {
        'question': 'What is the powerhouse of the cell?',
        'options': ['Nucleus', 'Mitochondria', 'Ribosome', 'Endoplasmic Reticulum'],
        'correctAnswer': 'Mitochondria',
      },
      {
        'question': 'Which organ is responsible for pumping blood?',
        'options': ['Liver', 'Lungs', 'Heart', 'Kidneys'],
        'correctAnswer': 'Heart',
      },
      {
        'question': 'What is the basic unit of life?',
        'options': ['Tissue', 'Organ', 'Cell', 'System'],
        'correctAnswer': 'Cell',
      },
    ],
  };



  final count = 0.obs;
  @override
  void onInit() {
    List data=Get.arguments as List;
    subject=data[0];
    name=data[1];
    setQuestions(subject);
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

  void setQuestions(String sub){
    questions.value=quizData[sub]!;
  }

  void findCorrectIndex(){
    for(int i=0;i<questions[questionIndex.value]['options'].length;i++){
      if(questions[questionIndex.value]['correctAnswer']==questions[questionIndex.value]['options'][i]){
        correctIndex.value=i;
      }
    }
  }

  bool isAnswerCorrect(int index) {
    return questions[questionIndex.value]['correctAnswer'] == questions[questionIndex.value]['options'][index];
  }

  // Check if the option is the correct answer
  bool isCorrectAnswer(int index) {
    return questions[questionIndex.value]['correctAnswer'] == questions[questionIndex.value]['options'][index];
  }

  nextQuestion() {
    if(questionIndex.value>1){
      return Get.dialog(
        barrierDismissible: false,
          Dialog(
            insetPadding: const EdgeInsets.symmetric(horizontal: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Quiz Completed",
                      style: textSemiBold(size: 16, color: ColorRes.textColor),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "You have scored $score",
                      style: textRegular(size: 14, color: ColorRes.secondary),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: (){
                              Get.offAllNamed(Routes.DASHBOARD,arguments: name);
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: ColorRes.primary),
                              child: Center(
                                child: Text(
                                  "Dashboard",
                                  style: textMedium(size: 16, color: ColorRes.bgColor),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
      );

    }
    else{
      borderColor.value=ColorRes.secondary;
      questionAnswered.value = false;
      correctIndex.value =-1;
      questionIndex.value+=1;
    }
  }

  var borderColor=ColorRes.secondary.obs;
  RxString clickValue =''.obs;
  void selectOption(int index) {
    selectedOption.value = index;
    findCorrectIndex();
    if(correctIndex.value==selectedOption.value){
      score+=1;
    }
    questionAnswered.value=true;
    clickValue.value = questions[questionIndex.value]['correctAnswer'];
    if (selectedOption.value == index) {
      if (isAnswerCorrect(index)) {
        borderColor.value = Colors.green;
        update();
      } else {
        borderColor.value = Colors.red;
        update();
      }
    } else if (isCorrectAnswer(index) && questionAnswered.value) {
      borderColor.value = Colors.green;
      update();
    } else {
      borderColor.value = ColorRes.secondary;
      update();
    }

  }

  void increment() => count.value++;
}
